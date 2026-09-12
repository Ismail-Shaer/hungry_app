import 'package:flutter/material.dart';
import 'package:hungry_app/app/navigation/widgets/app_navigation_bar.dart';
import 'package:hungry_app/features/cart/views/cart_view.dart';
import 'package:hungry_app/features/home/views/home_view.dart';
import 'package:hungry_app/features/order_history/views/order_history_view.dart';
import 'package:hungry_app/features/auth/views/profile_view.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  final List<Widget> _pages = [
    HomeView(),
    CartView(),
    OrderHistoryView(),
    ProfileView(),
  ];
  void _changePage(int newIndex) {
    if (newIndex == _selectedIndex) {
      return;
    }
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar:
          _selectedIndex == 3
              ? null
              : AppNavigationBar(
                selectedIndex: _selectedIndex,
                onDestinationSelected: _changePage,
              ),
    );
  }
}
