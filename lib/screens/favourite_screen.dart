import 'package:flutter/material.dart';
import '../models/meals.dart';
import "../widgets/meal_item.dart";
class FavouriteScreen extends StatelessWidget {
  // const FavouriteScreen({Key? key}) : super(key: key);
  final List<Meal> favouriteMeal;
  FavouriteScreen(this.favouriteMeal);
  @override
  Widget build(BuildContext context) {
    if (favouriteMeal.isEmpty)
      return Center(
        child: Container(
          child: Text("You have no favourites yet - start adding some"),
        ),
      );
    else {
      return ListView.builder(
          itemBuilder: (ctx, i) {
            return MealItem(
              id: favouriteMeal![i].id,
              title: favouriteMeal![i].title,
              imageurl: favouriteMeal![i].imageUrl,
              affordability: favouriteMeal![i].affordability,
              duration: favouriteMeal![i].duration,
              complexity: favouriteMeal![i].complexity,
               removeItem: (){},
            );
          },
          itemCount: favouriteMeal!.length,
        );
    }
  }
}
