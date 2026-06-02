import 'package:flutter/material.dart';
import 'package:smart_meal_ta/features/ai_recommendation/screens/ai_recommendation_page.dart';
import 'package:smart_meal_ta/features/budget/screens/budget_page.dart';
import 'package:smart_meal_ta/features/game/screens/game_page.dart';
import 'package:smart_meal_ta/features/meal_planner/screens/meal_planner_page.dart';
import 'package:smart_meal_ta/features/profile/screens/profile_page.dart';
import 'package:smart_meal_ta/core/services/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Set ke 1 agar saat pertama buka langsung tampil Meal Planner (Tugas Si B)
  int _selectedIndex = 1;
  int _userId = 1;

  @override
  void initState() {
    super.initState();
    _loadUserId();
  }

  Future<void> _loadUserId() async {
    final id = await AuthService().getUserId();
    if (!mounted || id == null) return;
    setState(() => _userId = int.tryParse(id) ?? 1);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      const ProfilePage(),
      const MealPlannerPage(),
      BudgetPage(userId: _userId),
      const SaranMenuPage(),
      const GamePage(),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        // Warna hijau sesuai tema Smart Meal
        selectedItemColor: Colors.green.shade700,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            activeIcon: Icon(Icons.calendar_today),
            label: 'Planner',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            activeIcon: Icon(Icons.account_balance_wallet),
            label: 'Budget',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_awesome_outlined),
            activeIcon: Icon(Icons.auto_awesome),
            label: 'Saran',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videogame_asset_outlined),
            activeIcon: Icon(Icons.videogame_asset),
            label: 'Game',
          ),
        ],
      ),
    );
  }
}
