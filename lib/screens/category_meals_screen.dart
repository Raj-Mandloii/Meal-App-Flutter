import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  final List<Meal> _availableMeals;
  CategoryMealsScreen(this._availableMeals);
  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  // const CategoryMealsScreen({Key? key}) : super(key: key);
  //  String categoryMeals;
  List<Meal>? displayMeals;
  var _isLoaded = false;
  // @override
  // void initState() {
  //   // TODO: implement initState

  //   super.initState();
  // }

  @override
  void didChangeDependencies() {
    if (!_isLoaded) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      displayMeals = widget._availableMeals.where((meal) {
        return meal.categories.contains(routeArgs['id']);
      }).toList();
      _isLoaded = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayMeals!.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(routeArgs['title']!),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, i) {
            return MealItem(
              id: displayMeals![i].id,
              title: displayMeals![i].title,
              imageurl: displayMeals![i].imageUrl,
              affordability: displayMeals![i].affordability,
              duration: displayMeals![i].duration,
              complexity: displayMeals![i].complexity,
              removeItem: _removeMeal,
            );
          },
          itemCount: displayMeals!.length,
        ),
      ),
    );
  }
}
