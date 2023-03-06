import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key, required this.saveFilters, required this.currentFilters})
      : super(key: key);
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegeterian = false;
  var _vegan = false;
  var _lactoseFree = false;
//  {gluten: false, lactose: false, vegan: false, vegeterian: false}
  @override
  void initState() {
    print(widget.currentFilters);
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegan = widget.currentFilters['vegan']!;
    _vegeterian = widget.currentFilters['vegeterian']!;

    super.initState();
  }

  Widget buildSwitchTile(String title, String description, bool currentValue,
      Function updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: (val) => updateValue(val),
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("Your Filters"),
          actions: [
            IconButton(
                onPressed: () {
                  final selectFilterData = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegeterian': _vegeterian,
                  };
                  widget.saveFilters(selectFilterData);
                },
                icon: const Icon(Icons.save))
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Adjust your meal selection",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                buildSwitchTile(
                  "Gluten Free",
                  'Only includes Gluten-free meals',
                  _glutenFree,
                  (val) {
                    setState(() {
                      _glutenFree = val;
                    });
                  },
                ),
                buildSwitchTile(
                  "Lactose Free",
                  'Only includes Lactose-free meals',
                  _lactoseFree,
                  (val) {
                    setState(() {
                      _lactoseFree = val;
                    });
                  },
                ),
                buildSwitchTile(
                  "Vegan",
                  'Only includes Vegan meals',
                  _vegan,
                  (val) {
                    setState(() {
                      _vegan = val;
                    });
                  },
                ),
                buildSwitchTile(
                  "Vegeterian",
                  'Only includes Vegeterian meals',
                  _vegeterian,
                  (val) {
                    setState(() {
                      _vegeterian = val;
                    });
                  },
                ),
              ],
            ))
          ],
        ));
  }
}
