import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math' as math;
import '../../main_app.dart';

class ActiveChallengeSessionPage extends StatefulWidget {
  final String challengeName;
  final List<Map<String, dynamic>> activities;
  final int totalDuration;

  const ActiveChallengeSessionPage({
    super.key,
    required this.challengeName,
    required this.activities,
    required this.totalDuration,
  });

  @override
  State<ActiveChallengeSessionPage> createState() => _ActiveChallengeSessionPageState();
}

class _ActiveChallengeSessionPageState extends State<ActiveChallengeSessionPage>
    with TickerProviderStateMixin {
  int currentActivityIndex = 1; // Starting from activity 2 as shown in design
  int remainingSeconds = 150; // 2:30 as shown in design
  bool isPaused = false;
  Timer? _timer;
  late AnimationController _progressController;

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _progressController.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!isPaused && remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
        
        if (remainingSeconds == 0) {
          _nextActivity();
        }
      }
    });
  }

  void _togglePause() {
    setState(() {
      isPaused = !isPaused;
    });
  }

  void _nextActivity() {
    if (currentActivityIndex < widget.activities.length - 1) {
      setState(() {
        currentActivityIndex++;
        remainingSeconds = widget.activities[currentActivityIndex]['duration'] ?? 180;
      });
    } else {
      _completeSession();
    }
  }

  void _previousActivity() {
    if (currentActivityIndex > 0) {
      setState(() {
        currentActivityIndex--;
        remainingSeconds = widget.activities[currentActivityIndex]['duration'] ?? 180;
      });
    }
  }

  void _completeSession() {
    _timer?.cancel();
    
    // Navigate back to main app home page
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const MainApp()),
      (route) => false,
    );
    
    // Show success message after navigation
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Challenge completed! Great job! 🎉'),
            backgroundColor: Color(0xFF5FCCC4),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    });
  }

  void _endSession() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'End Session',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: const Text(
            'Are you sure you want to end this session? Your progress will be saved.',
            style: TextStyle(fontSize: 14),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Continue',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                // Navigate back to main app home page
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const MainApp()),
                  (route) => false,
                );
              },
              child: const Text(
                'End Session',
                style: TextStyle(
                  color: Color(0xFF5FCCC4),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  double get _progressValue {
    final currentActivity = widget.activities[currentActivityIndex];
    final activityDuration = currentActivity['duration'] ?? 180;
    return (activityDuration - remainingSeconds) / activityDuration;
  }

  @override
  Widget build(BuildContext context) {
    final currentActivity = widget.activities[currentActivityIndex];
    
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFA),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: _endSession,
                    icon: const Icon(
                      Icons.close,
                      color: Color(0xFF5FCCC4),
                      size: 24,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        widget.challengeName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      Text(
                        'Activity ${currentActivityIndex + 1} of ${widget.activities.length}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_horiz,
                      color: Colors.grey[700],
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),

            // Main Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 32),

                    // Timer Circle
                    SizedBox(
                      width: 192,
                      height: 192,
                      child: Stack(
                        children: [
                          // Background Circle
                          SizedBox(
                            width: 192,
                            height: 192,
                            child: CircularProgressIndicator(
                              value: 1.0,
                              strokeWidth: 8,
                              backgroundColor: const Color(0xFFE8F6F5),
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                Color(0xFFE8F6F5),
                              ),
                            ),
                          ),
                          // Progress Circle
                          SizedBox(
                            width: 192,
                            height: 192,
                            child: Transform.rotate(
                              angle: -math.pi / 2,
                              child: CircularProgressIndicator(
                                value: _progressValue,
                                strokeWidth: 8,
                                backgroundColor: Colors.transparent,
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  Color(0xFF5FCCC4),
                                ),
                                strokeCap: StrokeCap.round,
                              ),
                            ),
                          ),
                          // Timer Text
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _formatTime(remainingSeconds),
                                  style: const TextStyle(
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1A1A1A),
                                  ),
                                ),
                                Text(
                                  'Remaining',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Pause Button
                    Column(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFF5FCCC4),
                              width: 4,
                            ),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: IconButton(
                            onPressed: _togglePause,
                            icon: Icon(
                              isPaused ? Icons.play_arrow : Icons.pause,
                              color: const Color(0xFF5FCCC4),
                              size: 32,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          isPaused ? 'Resume' : 'Pause',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    // Activity Card
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // Activity Icon
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF0F9F8),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.air,
                              color: Color(0xFF5FCCC4),
                              size: 32,
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Activity Title
                          Text(
                            currentActivity['title'] ?? 'Deep Breathing',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1A1A1A),
                            ),
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: 24),

                          // Instructions
                          Column(
                            children: [
                              _buildInstruction('Inhale for 4 seconds'),
                              const SizedBox(height: 12),
                              _buildInstruction('Hold for 4 seconds'),
                              const SizedBox(height: 12),
                              _buildInstruction('Exhale for 4 seconds'),
                              const SizedBox(height: 12),
                              _buildInstruction('Repeat cycle'),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Navigation Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF0F9F8),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: Colors.grey[300]!),
                          ),
                          child: InkWell(
                            onTap: currentActivityIndex > 0 ? _previousActivity : null,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.skip_previous,
                                  color: currentActivityIndex > 0 
                                      ? const Color(0xFF5FCCC4) 
                                      : Colors.grey[400],
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Previous',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: currentActivityIndex > 0 
                                        ? const Color(0xFF1A1A1A) 
                                        : Colors.grey[400],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF0F9F8),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: Colors.grey[300]!),
                          ),
                          child: InkWell(
                            onTap: _nextActivity,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text(
                                  'Next',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF1A1A1A),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(
                                  Icons.skip_next,
                                  color: Color(0xFF5FCCC4),
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    // Activity Progress
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4, bottom: 16),
                          child: Text(
                            'ACTIVITY PROGRESS',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[600],
                              letterSpacing: 0.8,
                            ),
                          ),
                        ),
                        ...widget.activities.asMap().entries.map((entry) {
                          final index = entry.key;
                          final activity = entry.value;
                          final isCompleted = index < currentActivityIndex;
                          final isCurrent = index == currentActivityIndex;
                          final isPending = index > currentActivityIndex;

                          return Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: isCurrent ? const Color(0xFFF0F9F8) : Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: isCurrent 
                                  ? const Border(left: BorderSide(color: Color(0xFF5FCCC4), width: 4))
                                  : null,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: isCompleted 
                                        ? const Color(0xFF5FCCC4)
                                        : isCurrent 
                                            ? const Color(0xFF5FCCC4)
                                            : Colors.transparent,
                                    border: isPending 
                                        ? Border.all(color: Colors.grey[400]!, width: 2)
                                        : null,
                                  ),
                                  child: isCompleted
                                      ? const Icon(Icons.check, color: Colors.white, size: 16)
                                      : isCurrent
                                          ? Container(
                                              width: 12,
                                              height: 12,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                              ),
                                            )
                                          : null,
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    activity['title'] ?? 'Activity',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                                      color: isPending ? Colors.grey[500] : const Color(0xFF1A1A1A),
                                    ),
                                  ),
                                ),
                                Text(
                                  '${(activity['duration'] ?? 180) ~/ 60} min',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: isCurrent ? FontWeight.w600 : FontWeight.normal,
                                    color: isPending ? Colors.grey[500] : Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ],
                    ),

                    const SizedBox(height: 32),

                    // End Session Button
                    OutlinedButton(
                      onPressed: _endSession,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        side: BorderSide(color: Colors.grey[400]!),
                      ),
                      child: Text(
                        'End Session',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInstruction(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.only(top: 6),
          decoration: const BoxDecoration(
            color: Color(0xFF5FCCC4),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF1A1A1A),
            ),
          ),
        ),
      ],
    );
  }
}