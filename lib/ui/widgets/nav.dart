import 'package:apna_farm/ui/screen/chat/all_chats.dart';
import 'package:apna_farm/ui/screen/home/home.dart';
import 'package:apna_farm/ui/screen/profile/profile.dart';
import 'package:apna_farm/ui/screen/shop/shop.dart';
import 'package:flutter/material.dart';

class ApnaBottomNavigationBar extends StatefulWidget {
  const ApnaBottomNavigationBar({super.key});

  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => ApnaBottomNavigationBar());

  @override
  State<ApnaBottomNavigationBar> createState() =>
      _ApnaBottomNavigationBarState();
}

class _ApnaBottomNavigationBarState extends State<ApnaBottomNavigationBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ApnaHomeScreen(),
    const ApnaShopScreen(),
    const ApnaChatsScreen(),
    const ApnaProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        indicatorColor: Colors.black.withValues(alpha: 0.72),
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.home,
              color:
                  (_currentIndex == 0)
                      ? Colors.white
                      : Colors.black.withValues(alpha: 0.72),
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.shopping_bag,
              color:
                  (_currentIndex == 1)
                      ? Colors.white
                      : Colors.black.withValues(alpha: 0.72),
            ),
            label: 'Shop',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.chat,
              color:
                  (_currentIndex == 2)
                      ? Colors.white
                      : Colors.black.withValues(alpha: 0.72),
            ),
            label: 'Chat',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person,
              color:
                  (_currentIndex == 3)
                      ? Colors.white
                      : Colors.black.withValues(alpha: 0.72),
            ),
            label: 'Profile',
          ),
        ],
      ),
      body: _screens[_currentIndex],
    );
  }
}
