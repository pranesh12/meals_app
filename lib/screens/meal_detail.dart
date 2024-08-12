import 'package:flutter/material.dart';
import 'package:khabar/models/meal.dart';

class MealDetail extends StatelessWidget {
  const MealDetail({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Making process: ${meal.complexity.name}",
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              "Affordability: ${meal.affordability.name}",
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              "Time: ${meal.duration} minutes",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 12),
            const Text(
              'Steps:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: meal.steps.length,
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 10.0,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        child: Text('${index + 1}'),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          meal.steps[index],
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
