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

class FavouriteMealNotifer extends StateNotifier<List<Meal>> {
  FavouriteMealNotifer() : super([]);

  void addTofavourite(Meal meal) {
    if (state.contains(meal)) {
      return;
    } else {
      state = [...state, meal];
    }
  }

  void removeFromFavourite(Meal meal) {
    state = state.where((m) => m.id != meal.id).toList();
  }
}

final mealProvider =
    StateNotifierProvider<FavouriteMealNotifer, List<Meal>>((ref) {
  return FavouriteMealNotifer();
});
