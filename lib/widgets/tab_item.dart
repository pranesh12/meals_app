import 'package:flutter/material.dart';
import 'package:khabar/screens/favourite_meal.dart';
import 'package:khabar/screens/home.dart';

class TabItem extends StatefulWidget {
  const TabItem({super.key});

  @override
  State<TabItem> createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [Home(), FavouriteMeal()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => _pages[index]));
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ]);
  }
}
