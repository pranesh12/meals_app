import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:khabar/providers/meal_provider.dart';
import 'package:khabar/screens/meal_detail.dart';

class FavouriteMeal extends ConsumerStatefulWidget {
  const FavouriteMeal({super.key});

  @override
  _FavouriteMealState createState() => _FavouriteMealState();
}

class _FavouriteMealState extends ConsumerState<FavouriteMeal> {
  @override
  Widget build(BuildContext context) {
    final fMeal = ref.watch(mealProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite Meal"),
      ),
      body: fMeal.isEmpty
          ? const Center(
              child: Text("No Favourite Meal "),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: fMeal.length,
                    itemBuilder: (ctx, index) {
                      final meal = fMeal[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MealDetail(meal: meal)));
                        },
                        child: Card(
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 15),
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
