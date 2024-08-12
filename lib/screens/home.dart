import 'package:flutter/material.dart';
import 'package:khabar/data/dummy_data.dart'; // Ensure this imports the 'availableCategories' list
import 'package:khabar/widgets/grid_item.dart'; // Ensure this imports the 'GridItem' widget

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Meals",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(10),
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          for (final category in availableCategories)
            GridItem(
              category: category,
            ),
        ],
      ),
    );
  }
}
