import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'tabs/tab1_screen.dart';
import 'tabs/tab2_screen.dart';
import 'tabs/tab3_screen.dart';
import 'tabs/tab4_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    Tab1Screen(),
    Tab2Screen(),
    Tab3Screen(),
    Tab4Screen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        backgroundColor: AppTheme.surfaceColor,
        indicatorColor: AppTheme.primaryColor.withValues(alpha: 0.2),
        destinations: [
        NavigationDestination(
          icon: const Icon(Icons.sports_soccer_outlined),
          selectedIcon: const Icon(Icons.sports_soccer, color: AppTheme.primaryColor),
          label: 'Drills',
        ),
        NavigationDestination(
          icon: const Icon(Icons.schema_outlined),
          selectedIcon: const Icon(Icons.schema, color: AppTheme.primaryColor),
          label: 'Tactics',
        ),
        NavigationDestination(
          icon: const Icon(Icons.speed_outlined),
          selectedIcon: const Icon(Icons.speed, color: AppTheme.primaryColor),
          label: 'Speed',
        ),
        NavigationDestination(
          icon: const Icon(Icons.emoji_events_outlined),
          selectedIcon: const Icon(Icons.emoji_events, color: AppTheme.primaryColor),
          label: 'Matches',
        ),

        ],
      ),
    );
  }
}
