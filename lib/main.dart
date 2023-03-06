import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily Meals',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyMedium: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              titleLarge:
                  const TextStyle(fontSize: 20, fontFamily: "RobotoCondensed"),
            ),
      ),
      // home: const CategoriesScreen(),
      initialRoute: "/", // this is the default route i.e. landing screen.
      routes: {
        // this is the default route. /
        // "/": (context) => const CategoriesScreen(),
        "/": (context) => TabsScreen(),
        "/category-meals": (context) => CategoryMealsScreen(),
        "/meal_detail": (context) => const MealDetailScreen(),
        "/filters": (context) => const FiltersScreen(),
      },
      onGenerateRoute: (settings) {
        // gives arguement and name
        // if(settings.name == "/") // do this /...

        // in case the route not exists
        return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      },
      // use case
      // if flutter fails to build the perticular widget
      // before failure or flutter could not found the page.
      // ex 404 page , page does not exist.
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      },
    );
  }
}
