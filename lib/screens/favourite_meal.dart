import 'package:flutter/material.dart';

class FavouriteMeal extends StatefulWidget {
  const FavouriteMeal({super.key});

  @override
  _FavouriteMealState createState() => _FavouriteMealState();
}

class _FavouriteMealState extends State<FavouriteMeal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Favourited Meal"),
      ),
      body: Text("Hello"),
    );
  }
}
