import 'package:flutter/material.dart';

import 'package:meals_app/features/categories/UI/categories.dart';
import 'package:meals_app/features/meals/UI/meals.dart';
import 'package:meals_app/features/tabs/UI/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    String title = 'Categories';

    if (_selectedTabIndex == 1) title = 'Favorites';

    Widget body = const CategoriesScreen();

    if (_selectedTabIndex == 1) body = const MealsScreen();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: const MainDrawer(),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        currentIndex: _selectedTabIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
