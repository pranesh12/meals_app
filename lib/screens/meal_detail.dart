import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:khabar/models/meal.dart';
import 'package:khabar/providers/meal_provider.dart';
import 'package:khabar/screens/favourite_meal.dart';

class MealDetail extends ConsumerStatefulWidget {
  const MealDetail({super.key, required this.meal});
  final Meal meal;

  @override
  _MealDetailState createState() => _MealDetailState();
}

class _MealDetailState extends ConsumerState<MealDetail> {
  bool isSaved = false;

  void handleToggle(Meal meal) {
    setState(() {
      isSaved = !isSaved;
      if (isSaved) {
        ref.read(mealProvider.notifier).addTofavourite(meal);
      } else {
        ref.read(mealProvider.notifier).removeFromFavourite(meal);
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isSaved ? 'Meal saved!' : 'Meal unsaved!'),
        action: SnackBarAction(
            label: 'view',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FavouriteMeal()));
            }),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.title),
        actions: [
          IconButton(
            onPressed: () => handleToggle(widget.meal),
            icon: isSaved
                ? const Icon(Icons.star, color: Colors.amber)
                : const Icon(Icons.star_border),
            tooltip: "Save Meal",
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              child: Image.network(
                widget.meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Making process: ${widget.meal.complexity.name}",
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              "Affordability: ${widget.meal.affordability.name}",
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              "Time: ${widget.meal.duration} minutes",
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
              itemCount: widget.meal.steps.length,
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
                          widget.meal.steps[index],
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
