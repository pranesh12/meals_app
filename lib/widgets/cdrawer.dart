import 'package:flutter/material.dart';
import 'package:khabar/screens/favourite_meal.dart';
import 'package:khabar/screens/home.dart';

class Cdrawer extends StatelessWidget {
  const Cdrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Use only the DrawerHeader and customize it directly
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Meal",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          ListTile(
            iconColor: Colors.green,
            title: const Text("Home"),
            leading: const Icon(Icons.home),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Home()));
            },
          ),
          ListTile(
            iconColor: Colors.red,
            title: const Text("Favourite"),
            leading: const Icon(Icons.favorite_rounded),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavouriteMeal()),
              );
            },
          ),
        ],
      ),
    );
  }
}
