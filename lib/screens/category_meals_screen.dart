import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  // const CategoryMealsScreen({Key? key}) : super(key: key);
  // final String categoryId;
  // final String categoryTitle;

  // const CategoryMealsScreen(
  //     {required this.categoryId, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(routeArgs['id']);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(routeArgs['title']!),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, i) {
            return MealItem(
                id: categoryMeals[i].id,
                title: categoryMeals[i].title,
                imageurl: categoryMeals[i].imageUrl,
                affordability: categoryMeals[i].affordability,
                duration: categoryMeals[i].duration,
                complexity: categoryMeals[i].complexity);
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
