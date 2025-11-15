import 'package:flutter/material.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  String selectedPeriod = 'Weekly';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFA),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(),
            
            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 100),
                child: Column(
                  children: [
                    // Key Metrics
                    _buildKeyMetrics(),
                    const SizedBox(height: 24),
                    
                    // This Week's Activity
                    _buildThisWeeksActivity(),
                    const SizedBox(height: 24),
                    
                    // Calendar View
                    _buildCalendarView(),
                    const SizedBox(height: 24),
                    
                    // Activity Breakdown
                    _buildActivityBreakdown(),
                    const SizedBox(height: 24),
                    
                    // Recent Activity
                    _buildRecentActivity(),
                    const SizedBox(height: 24),
                    
                    // Export Button
                    _buildExportButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Progress',         
   style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildPeriodButton('Weekly', true),
              const SizedBox(width: 8),
              _buildPeriodButton('Monthly', false),
              const SizedBox(width: 8),
              _buildPeriodButton('Yearly', false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPeriodButton(String text, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPeriod = text;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Switched to $text view'),
            backgroundColor: const Color(0xFF5FCCC4),
            duration: const Duration(seconds: 1),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF5FCCC4) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? const Color(0xFF5FCCC4) : const Color(0xFFE5F2F1),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : const Color(0xFF6B8583),
          ),
        ),
      ),
    );
  }

  Widget _buildKeyMetrics() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Key Metrics',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 12),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.2,
            children: [
              _buildMetricCard(
                'Completed',
                '24',
                '12%',
                'vs last week',
                Icons.check_circle,
                true,
              ),
              _buildMetricCard(
                'Total Minutes',
                '360',
                '8%',
                'vs last week',
                Icons.access_time,
                true,
              ),
              _buildMetricCard(
                'Day Streak',
                '7',
                '2 days',
                'from last',
                Icons.local_fire_department,
                true,
              ),
              _buildMetricCard(
                'Points Earned',
                '480',
                '15%',
                'vs last week',
                Icons.star,
                true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(
    String title,
    String value,
    String change,
    String changeLabel,
    IconData icon,
    bool isPositive,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF6B8583),
                ),
              ),
              Icon(
                icon,
                size: 20,
                color: const Color(0xFF5FCCC4),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(
                isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                size: 12,
                color: const Color(0xFF5FCCC4),
              ),
              const SizedBox(width: 4),
              Text(
                change,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF5FCCC4),
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  changeLabel,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6B8583),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildThisWeeksActivity() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'This Week\'s Activity',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
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
                SizedBox(
                  height: 180,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _buildWeeklyBarItem('Mon', 5, 0.83),
                      _buildWeeklyBarItem('Tue', 3, 0.5),
                      _buildWeeklyBarItem('Wed', 6, 1.0),
                      _buildWeeklyBarItem('Thu', 4, 0.67),
                      _buildWeeklyBarItem('Fri', 2, 0.33),
                      _buildWeeklyBarItem('Sat', 0, 0.0),
                      _buildWeeklyBarItem('Sun', 0, 0.0),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Sessions completed per day',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF6B8583),
                  ),
                ),
                const Text(
                  'Goal: 3 sessions daily',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6B8583),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeeklyBarItem(String day, int sessions, double height) {
    Color barColor = const Color(0xFF5FCCC4);
    if (sessions == 0) {
      barColor = const Color(0xFFE5F2F1);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 28,
          height: 120 * height,
          decoration: BoxDecoration(
            color: barColor,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          day,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF6B8583),
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          sessions.toString(),
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF1A1A1A),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildCalendarView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'November 2024',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
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
                // Calendar header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: ['S', 'M', 'T', 'W', 'T', 'F', 'S']
                      .map((day) => SizedBox(
                            width: 32,
                            child: Text(
                              day,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF6B8583),
                              ),
                            ),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 12),
                // Calendar grid
                _buildCalendarGrid(),
                const SizedBox(height: 16),
                // Legend
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildLegendItem('No activity', const Color(0xFFE5F2F1)),
                    _buildLegendItem('Some activity', const Color(0xFF9FE4DF)),
                    _buildLegendItem('Goal achieved', const Color(0xFF5FCCC4)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarGrid() {
    // November 2024 calendar data
    final List<Map<String, dynamic>> calendarDays = [
      // Week 1
      {'day': '', 'activity': 0}, {'day': '', 'activity': 0}, {'day': '', 'activity': 0}, {'day': '', 'activity': 0}, {'day': '', 'activity': 0}, {'day': '1', 'activity': 0}, {'day': '2', 'activity': 2},
      // Week 2
      {'day': '3', 'activity': 3}, {'day': '4', 'activity': 3}, {'day': '5', 'activity': 3}, {'day': '6', 'activity': 2}, {'day': '7', 'activity': 3}, {'day': '8', 'activity': 3}, {'day': '9', 'activity': 0},
      // Week 3
      {'day': '10', 'activity': 0}, {'day': '11', 'activity': 0}, {'day': '12', 'activity': 0}, {'day': '13', 'activity': 0}, {'day': '14', 'activity': 0}, {'day': '15', 'activity': 0}, {'day': '16', 'activity': 0},
      // Week 4
      {'day': '17', 'activity': 0}, {'day': '18', 'activity': 0}, {'day': '19', 'activity': 0}, {'day': '20', 'activity': 0}, {'day': '21', 'activity': 0}, {'day': '22', 'activity': 0}, {'day': '23', 'activity': 0},
      // Week 5
      {'day': '24', 'activity': 0}, {'day': '25', 'activity': 0}, {'day': '26', 'activity': 0}, {'day': '27', 'activity': 0}, {'day': '28', 'activity': 0}, {'day': '29', 'activity': 0}, {'day': '30', 'activity': 0},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 1,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: calendarDays.length,
      itemBuilder: (context, index) {
        final dayData = calendarDays[index];
        return _buildCalendarDay(dayData['day'], dayData['activity']);
      },
    );
  }

  Widget _buildCalendarDay(String day, int activity) {
    Color backgroundColor;
    if (day.isEmpty) {
      backgroundColor = Colors.transparent;
    } else if (activity == 0) {
      backgroundColor = const Color(0xFFE5F2F1);
    } else if (activity >= 3) {
      backgroundColor = const Color(0xFF5FCCC4);
    } else {
      backgroundColor = const Color(0xFF9FE4DF);
    }

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: Text(
          day,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: day.isEmpty ? Colors.transparent : 
                   (activity >= 3 ? Colors.white : const Color(0xFF1A1A1A)),
          ),
        ),
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            color: Color(0xFF6B8583),
          ),
        ),
      ],
    );
  }

  Widget _buildActivityBreakdown() {
    final activities = [
      {
        'title': 'Breathing',
        'sessions': '8 sessions',
        'minutes': '120 min',
        'percentage': '33%',
        'progress': 0.33,
        'icon': Icons.self_improvement,
      },
      {
        'title': 'Movement',
        'sessions': '6 sessions',
        'minutes': '90 min',
        'percentage': '25%',
        'progress': 0.25,
        'icon': Icons.directions_walk,
      },
      {
        'title': 'Energy',
        'sessions': '5 sessions',
        'minutes': '75 min',
        'percentage': '21%',
        'progress': 0.21,
        'icon': Icons.bolt,
      },
      {
        'title': 'Focus',
        'sessions': '5 sessions',
        'minutes': '75 min',
        'percentage': '21%',
        'progress': 0.21,
        'icon': Icons.center_focus_strong,
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Activity Breakdown',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 12),
          ...activities.map((activity) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
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
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0F9F8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          activity['icon'] as IconData,
                          size: 20,
                          color: const Color(0xFF5FCCC4),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              activity['title'] as String,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1A1A1A),
                              ),
                            ),
                            Text(
                              activity['sessions'] as String,
                              style: const TextStyle(
                                fontSize: 12,
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
                            activity['minutes'] as String,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                          Text(
                            activity['percentage'] as String,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF5FCCC4),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 8,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F5F4),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: activity['progress'] as double,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF5FCCC4),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildRecentActivity() {
    final recentActivities = [
      {
        'title': 'Morning Breathing',
        'time': 'Today, 8:30 AM',
        'points': '+20 pts',
        'duration': '15 min',
        'intensity': 'High',
        'icon': Icons.self_improvement,
      },
      {
        'title': 'Evening Walk',
        'time': 'Yesterday, 6:15 PM',
        'points': '+30 pts',
        'duration': '30 min',
        'intensity': 'Medium',
        'icon': Icons.directions_walk,
      },
      {
        'title': 'Focus Session',
        'time': 'Yesterday, 2:00 PM',
        'points': '+25 pts',
        'duration': '20 min',
        'intensity': 'High',
        'icon': Icons.center_focus_strong,
      },
      {
        'title': 'Energy Boost',
        'time': '2 days ago, 10:30 AM',
        'points': '+15 pts',
        'duration': '10 min',
        'intensity': 'Low',
        'icon': Icons.bolt,
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recent Activity',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 12),
          ...recentActivities.map((activity) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
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
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0F9F8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          activity['icon'] as IconData,
                          size: 20,
                          color: const Color(0xFF5FCCC4),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              activity['title'] as String,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1A1A1A),
                              ),
                            ),
                            Text(
                              activity['time'] as String,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF6B8583),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        activity['points'] as String,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5FCCC4),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 16,
                        color: Color(0xFF6B8583),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        activity['duration'] as String,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF6B8583),
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Icon(
                        Icons.bolt,
                        size: 16,
                        color: Color(0xFF5FCCC4),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        activity['intensity'] as String,
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
          )),
        ],
      ),
    );
  }

  Widget _buildExportButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Exporting progress report...'),
                backgroundColor: Color(0xFF5FCCC4),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF5FCCC4),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 2,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.download, size: 20),
              SizedBox(width: 8),
              Text(
                'Export Progress Report',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}