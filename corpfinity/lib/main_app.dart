import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'features/home/home_page.dart';
import 'features/progress/progress_page.dart';
import 'features/challenge_creator/challenge_creator_page.dart';
import 'features/profile/profile_page.dart';
import 'features/active_challenge/active_challenge_session_page.dart';


class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const ChallengesPageWidget(),
    const ChallengeCreatorPage(),
    const ProgressPage(),
    const ProfilePage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5FCFC),
        border: Border(
          top: BorderSide(
            color: const Color(0xFFD4EEEC),
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, 'Home', 0),
              _buildNavItem(Icons.assignment_outlined, 'Challenges', 1),
              _buildCenterNavButton(),
              _buildNavItem(Icons.bar_chart, 'Progress', 3),
              _buildNavItem(Icons.person_outline, 'Profile', 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isActive = _currentIndex == index;
    return GestureDetector(
      onTap: () => _onTabTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 24,
            color: isActive ? const Color(0xFF5FCCC4) : const Color(0xFF5A7878),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isActive ? const Color(0xFF5FCCC4) : const Color(0xFF5A7878),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCenterNavButton() {
    return GestureDetector(
      onTap: () => _onTabTapped(2),
      child: Container(
        width: 56,
        height: 56,
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF5FCCC4),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF5FCCC4).withValues(alpha: 0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Icon(
          Icons.add_circle_outline,
          size: 28,
          color: Colors.white,
        ),
      ),
    );
  }
}

// Placeholder pages - CreatePage removed, now using ChallengeCreatorPage

class ChallengesPageWidget extends StatefulWidget {
  const ChallengesPageWidget({super.key});

  @override
  State<ChallengesPageWidget> createState() => _ChallengesPageWidgetState();
}

class _ChallengesPageWidgetState extends State<ChallengesPageWidget> {


  void _openWizard() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChallengeCreatorPage()),
    );
  }

  void _joinChallenge(String challengeId) {
    // Sample challenge data based on challengeId
    Map<String, dynamic> challengeData = _getChallengeData(challengeId);
    
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ActiveChallengeSessionPage(
          challengeName: challengeData['name'],
          activities: challengeData['activities'],
          totalDuration: challengeData['totalDuration'],
        ),
      ),
    );
  }

  Map<String, dynamic> _getChallengeData(String challengeId) {
    // Sample challenge data - in a real app, this would come from a database
    final challenges = {
      'energy-boost': {
        'name': 'Quick Energy Boost',
        'totalDuration': 300, // 5 minutes
        'activities': [
          {
            'title': 'Warm Up',
            'duration': 60,
            'instructions': 'Prepare your body with gentle movements',
          },
          {
            'title': 'Deep Breathing',
            'duration': 150,
            'instructions': 'Focus on your breath to energize your body',
          },
          {
            'title': 'Stretching',
            'duration': 120,
            'instructions': 'Gentle stretches to activate your muscles',
          },
          {
            'title': 'Cool Down',
            'duration': 90,
            'instructions': 'Relax and center yourself',
          },
        ],
      },
      'stress-relief': {
        'name': 'Stress Relief Sessions',
        'totalDuration': 600, // 10 minutes
        'activities': [
          {
            'title': 'Warm Up',
            'duration': 120,
            'instructions': 'Prepare your mind and body for relaxation',
          },
          {
            'title': 'Deep Breathing',
            'duration': 240,
            'instructions': 'Breathe deeply to release tension',
          },
          {
            'title': 'Progressive Relaxation',
            'duration': 180,
            'instructions': 'Relax each muscle group systematically',
          },
          {
            'title': 'Mindful Meditation',
            'duration': 180,
            'instructions': 'Focus on the present moment',
          },
        ],
      },
      'focus-clarity': {
        'name': 'Focus & Clarity',
        'totalDuration': 900, // 15 minutes
        'activities': [
          {
            'title': 'Centering',
            'duration': 180,
            'instructions': 'Center your mind and prepare for focus',
          },
          {
            'title': 'Breathing Exercise',
            'duration': 300,
            'instructions': 'Controlled breathing to enhance concentration',
          },
          {
            'title': 'Mental Clarity',
            'duration': 240,
            'instructions': 'Visualization exercises for mental clarity',
          },
          {
            'title': 'Integration',
            'duration': 180,
            'instructions': 'Integrate your focused state',
          },
        ],
      },
      'mood-lifter': {
        'name': 'Mood Lifter',
        'totalDuration': 1200, // 20 minutes
        'activities': [
          {
            'title': 'Energizing Warm-up',
            'duration': 240,
            'instructions': 'Gentle movements to lift your energy',
          },
          {
            'title': 'Positive Breathing',
            'duration': 360,
            'instructions': 'Breathe in positivity and joy',
          },
          {
            'title': 'Gratitude Practice',
            'duration': 300,
            'instructions': 'Focus on things you are grateful for',
          },
          {
            'title': 'Joyful Integration',
            'duration': 300,
            'instructions': 'Integrate positive feelings into your day',
          },
        ],
      },
    };

    return challenges[challengeId] ?? challenges['energy-boost']!;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Challenges',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _openWizard,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5FCCC4),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        '+ New',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 8),
              
              // Ongoing Progress Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Ongoing Progress',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              
              // Ongoing Progress Cards
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    // Active challenge with teal border
                    _buildOngoingCard(
                      '5-Minute Energy Boost',
                      'Session 2 of 3 • Breathing & stretching',
                      '67%',
                      '1 session left',
                      'Target: Complete 3 energizing sessions ✓ On track',
                      0.67,
                      const Color(0xFF5FCCC4),
                      isActive: true,
                    ),
                    const SizedBox(height: 12),
                    _buildOngoingCard(
                      '10-Minute Calm Focus',
                      'Session 1 of 2 • Meditation & mindfulness',
                      '50%',
                      '1 session left',
                      'Target: Complete 2 focus sessions • Next session ready',
                      0.50,
                      const Color(0xFFD8B4FE),
                    ),
                    const SizedBox(height: 12),
                    _buildOngoingCard(
                      '30-Minute Wellness Break',
                      'Session 3 of 5 • Full body & mind reset',
                      '60%',
                      '2 sessions left',
                      'Target: Complete 5 wellness sessions • Great progress',
                      0.60,
                      const Color(0xFF86EFAC),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Recently Completed Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Recently Completed',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    _buildCompletedCard('5-Minute Morning Energizer', 'Completed 2 hours ago', 'assets/illustrations/increased_energy.svg'),
                    const SizedBox(height: 12),
                    _buildCompletedCard('10-Minute Desk Relief', 'Completed yesterday', 'assets/illustrations/physical_fitness.svg'),
                    const SizedBox(height: 12),
                    _buildCompletedCard('15-Minute Stress Buster', 'Completed 2 days ago', 'assets/illustrations/stress_reduction.svg'),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Popular Challenges Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Popular Challenges',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    _buildPopularCard(
                      'Quick Energy Boost',
                      '5-minute sessions to increase energy',
                      '5 mins',
                      const Color(0xFF5FCCC4),
                      const Color(0xFFF0F9F8),
                      '4.8',
                      '1.2k',
                      'energy-boost',
                    ),
                    const SizedBox(height: 12),
                    _buildPopularCard(
                      'Stress Relief Sessions',
                      '10-minute guided stress reduction',
                      '10 mins',
                      const Color(0xFFEF4444),
                      const Color(0xFFFEF2F2),
                      '4.9',
                      '856',
                      'stress-relief',
                    ),
                    const SizedBox(height: 12),
                    _buildPopularCard(
                      'Focus & Clarity',
                      '15-minute concentration enhancement',
                      '15 mins',
                      const Color(0xFF8B5CF6),
                      const Color(0xFFF3F4F6),
                      '4.7',
                      '2.1k',
                      'focus-clarity',
                    ),
                    const SizedBox(height: 12),
                    _buildPopularCard(
                      'Mood Lifter',
                      '20-minute sessions for better mood',
                      '20 mins',
                      const Color(0xFF10B981),
                      const Color(0xFFF0FDF4),
                      '4.6',
                      '634',
                      'mood-lifter',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }







  Widget _buildOngoingCard(String title, String subtitle, String progress, String daysLeft, String target, double progressValue, Color progressColor, {bool isActive = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isActive ? const Color(0xFF5FCCC4) : const Color(0xFFE5F2F1),
          width: isActive ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6B8583),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    progress,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isActive ? const Color(0xFF5FCCC4) : const Color(0xFF6B8583),
                    ),
                  ),
                  Text(
                    daysLeft,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF6B8583),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Left-aligned progress bar
          Container(
            width: double.infinity,
            height: 8,
            decoration: BoxDecoration(
              color: const Color(0xFFE5F2F1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: progressValue,
              child: Container(
                decoration: BoxDecoration(
                  color: progressColor,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            target,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF6B8583),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompletedCard(String title, String subtitle, String svgPath) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5F2F1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6B8583),
                  ),
                ),
              ],
            ),
          ),
          SvgPicture.asset(
            svgPath,
            width: 32,
            height: 32,
          ),
        ],
      ),
    );
  }

  Widget _buildPopularCard(String title, String description, String duration, Color durationColor, Color durationBgColor, String rating, String joined, String challengeId) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5F2F1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6B8583),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: durationBgColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        duration,
                        style: TextStyle(
                          fontSize: 12,
                          color: durationColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      '⭐ $rating rating',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF6B8583),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      '$joined joined',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF6B8583),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () => _joinChallenge(challengeId),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF5FCCC4),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Start',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ProfilePage moved to separate file