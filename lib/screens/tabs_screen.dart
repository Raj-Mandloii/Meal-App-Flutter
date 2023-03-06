import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../widgets/main_drawer.dart';
import '../screens/favourite_screen.dart';
import '../screens/categories_screen.dart';

class TabsScreen extends StatefulWidget {
  // TabsScreen({Key? key}) : super(key: key);
  final List<Meal> favouriteMeal;
  TabsScreen(this.favouriteMeal);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   List<Widget>? _pages;
   @override
  void initState() {
    _pages = [
      CategoriesScreen(),
    FavouriteScreen(widget.favouriteMeal),
    ];
    super.initState();
  }
  int _selectPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🧑‍🍳  Daily Meals  🧑‍🍳"),
        elevation: 0,
        
      ),
      drawer: const Drawer(
        child: MainDrawer(),
      ),
      // appBar: AppBar(
      //   title: const Text('Daily Meals'),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectPageIndex,
        // type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Category"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorite"),
        ],
      ),
      body: _pages![_selectPageIndex],
    );
  }
}
