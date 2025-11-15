import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../active_challenge/active_challenge_session_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  Map<String, dynamic> _getChallengeData(String challengeType) {
    final challenges = {
      'morning-stretch': {
        'name': 'Morning Stretch Challenge',
        'totalDuration': 900, // 15 minutes
        'activities': [
          {
            'title': 'Warm Up',
            'duration': 180,
            'instructions': 'Gentle movements to prepare your body',
          },
          {
            'title': 'Neck & Shoulders',
            'duration': 240,
            'instructions': 'Release tension in your neck and shoulders',
          },
          {
            'title': 'Full Body Stretch',
            'duration': 300,
            'instructions': 'Stretch all major muscle groups',
          },
          {
            'title': 'Cool Down',
            'duration': 180,
            'instructions': 'Relax and center yourself',
          },
        ],
      },
      'mindful-breathing': {
        'name': 'Mindful Breathing',
        'totalDuration': 180, // 3 minutes
        'activities': [
          {
            'title': 'Preparation',
            'duration': 30,
            'instructions': 'Find a comfortable position and close your eyes',
          },
          {
            'title': 'Deep Breathing',
            'duration': 120,
            'instructions': 'Breathe in for 4, hold for 4, exhale for 4',
          },
          {
            'title': 'Integration',
            'duration': 30,
            'instructions': 'Take a moment to notice how you feel',
          },
        ],
      },
      'office-stretch': {
        'name': 'Office Stretch',
        'totalDuration': 300, // 5 minutes
        'activities': [
          {
            'title': 'Neck Release',
            'duration': 90,
            'instructions': 'Gentle neck stretches to release tension',
          },
          {
            'title': 'Shoulder Rolls',
            'duration': 90,
            'instructions': 'Roll your shoulders to loosen tight muscles',
          },
          {
            'title': 'Spinal Twist',
            'duration': 120,
            'instructions': 'Seated spinal twists for back relief',
          },
        ],
      },
      'energy-reset': {
        'name': 'Energy Reset',
        'totalDuration': 420, // 7 minutes
        'activities': [
          {
            'title': 'Energizing Breath',
            'duration': 120,
            'instructions': 'Quick breathing exercises to boost energy',
          },
          {
            'title': 'Movement Flow',
            'duration': 180,
            'instructions': 'Simple movements to activate your body',
          },
          {
            'title': 'Focus Setting',
            'duration': 120,
            'instructions': 'Set your intention for renewed energy',
          },
        ],
      },
      'calm-mind': {
        'name': 'Calm Mind',
        'totalDuration': 600, // 10 minutes
        'activities': [
          {
            'title': 'Centering',
            'duration': 120,
            'instructions': 'Center yourself and prepare for calm',
          },
          {
            'title': 'Mindful Meditation',
            'duration': 300,
            'instructions': 'Focus on your breath and let thoughts pass',
          },
          {
            'title': 'Peaceful Transition',
            'duration': 180,
            'instructions': 'Gently return to your day with calm energy',
          },
        ],
      },
    };

    return challenges[challengeType] ?? challenges['mindful-breathing']!;
  }

  void _startChallenge(String challengeType) {
    final challengeData = _getChallengeData(challengeType);
    
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FCFC),
      body: SafeArea(
        child: Column(
          children: [

            
            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Greeting Card
                    _buildGreetingCard(),
                    const SizedBox(height: 24),
                    
                    // Wellness Goals Grid
                    _buildWellnessGoalsGrid(),
                    const SizedBox(height: 24),
                    
                    // Featured Challenge
                    _buildFeaturedChallenge(),
                    const SizedBox(height: 24),
                    
                    // Quick Challenges
                    _buildQuickChallenges(),
                    const SizedBox(height: 100), // Bottom padding for navigation
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }

  Widget _buildGreetingCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF7DD9D3),
            Color(0xFF5FCCC4),
            Color(0xFF3FB5AC),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Good Morning, Alex',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Let\'s make today a balanced and mindful day.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white.withValues(alpha: 0.9),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                _buildBadge('Mindful Warrior'),
                const SizedBox(width: 12),
                _buildBadge('Active Streaker'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildWellnessGoalsGrid() {
    final goals = [
      {'title': 'Stress Reduction', 'svg': 'assets/illustrations/stress_reduction.svg'},
      {'title': 'Increased Energy', 'svg': 'assets/illustrations/increased_energy.svg'},
      {'title': 'Better Sleep', 'svg': 'assets/illustrations/better sleep.svg'},
      {'title': 'Physical Fitness', 'svg': 'assets/illustrations/physical_fitness.svg'},
      {'title': 'Healthy Eating', 'svg': 'assets/illustrations/healthy_eating.svg'},
      {'title': 'Social Connection', 'svg': 'assets/illustrations/Social-connection.svg'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Wellness Goals',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A3A3A),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 2.2,
      ),
      itemCount: goals.length,
      itemBuilder: (context, index) {
        final goal = goals[index];
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFE8F7F6), width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      goal['title'] as String,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1A3A3A),
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    goal['svg'] as String,
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF5FCCC4),
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                height: 6,
                decoration: BoxDecoration(
                  color: const Color(0xFF5FCCC4),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ],
          ),
        );
      },
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturedChallenge() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Featured Challenge',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A3A3A),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: const Color(0xFFD4EEEC)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Background decoration
              Positioned(
                top: -32,
                right: -32,
                child: Container(
                  width: 128,
                  height: 128,
                  decoration: BoxDecoration(
                    color: const Color(0xFF5FCCC4).withValues(alpha: 0.05),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              
              // Content
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Morning Stretch Challenge',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A3A3A),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 16,
                        color: Color(0xFF5FCCC4),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        '15 mins',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF5A7878),
                        ),
                      ),
                      const SizedBox(width: 24),
                      const Icon(
                        Icons.local_fire_department_outlined,
                        size: 16,
                        color: Color(0xFF5FCCC4),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Medium',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF5A7878),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Progress bar
                  Container(
                    height: 8,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F7F6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: 0.33,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF5FCCC4),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _startChallenge('morning-stretch'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5FCCC4),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 2,
                      ),
                      child: const Text(
                        'Start Challenge',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuickChallenges() {
    final challenges = [
      {'title': 'Mindful Breathing', 'duration': '3 mins', 'type': 'mindful-breathing'},
      {'title': 'Office Stretch', 'duration': '5 mins', 'type': 'office-stretch'},
      {'title': 'Energy Reset', 'duration': '7 mins', 'type': 'energy-reset'},
      {'title': 'Calm Mind', 'duration': '10 mins', 'type': 'calm-mind'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quick Challenges',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A3A3A),
          ),
        ),
        const SizedBox(height: 16),
        ...challenges.map((challenge) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFD4EEEC)),
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
                        challenge['title']!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A3A3A),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time,
                            size: 16,
                            color: Color(0xFF5FCCC4),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            challenge['duration']!,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF5A7878),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _startChallenge(challenge['type']!),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5FCCC4),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
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
          ),
        )),
      ],
    );
  }


}