import 'package:flutter/material.dart';
import 'package:khabar/data/dummy_data.dart';
import 'package:khabar/screens/meal_detail.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.id, required this.title});
  final String id;
  final String title;

  @override
  Widget build(BuildContext context) {
    final filterMeal = dummyMeals.where((meal) {
      return meal.categories.contains(id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Filtered Meals for Category: $title',
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filterMeal.length,
              itemBuilder: (ctx, index) {
                final meal = filterMeal[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MealDetail(meal: meal)));
                  },
                  child: Card(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: Stack(
                      children: [
                        // Displaying the image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            meal.imageUrl,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Positioned title at the bottom of the image
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            color: Colors.black54,
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 20,
                            ),
                            child: Text(
                              meal.title,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
