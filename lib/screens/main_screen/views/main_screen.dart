import 'package:fintracker/screens/accounts/views/account_screen.dart';
import 'package:fintracker/screens/categories/views/categories_screen.dart';
import 'package:fintracker/screens/home/views/home_screen.dart';
import 'package:fintracker/screens/settings/views/setting_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _controller = PageController(keepPage: true);

  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(),
          AccountScreen(),
          CategoryScreen(),
          SettingScreen(),
        ],
        onPageChanged: (int index) {
          setState(() {
            _selected = index;
          });
        },
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selected,
        onDestinationSelected: (int index) {
          _controller.jumpToPage(index);
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.wallet), label: "Accounts"),
          NavigationDestination(
              icon: Icon(Icons.category), label: "Categories"),
          NavigationDestination(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}
