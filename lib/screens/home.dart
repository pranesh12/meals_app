import 'package:flutter/material.dart';
import 'package:khabar/data/dummy_data.dart';
import 'package:khabar/widgets/cdrawer.dart';
import 'package:khabar/widgets/grid_item.dart';

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
      drawer: Cdrawer(),
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
