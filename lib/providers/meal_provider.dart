import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:khabar/data/dummy_data.dart';
import 'package:khabar/models/category.dart';
import 'package:khabar/models/meal.dart';

final mainCatagory = Provider<List<Category>>((ref) {
  return availableCategories;
});

final dMeals = Provider<List<Meal>>((ref) {
  return dummyMeals;
});
