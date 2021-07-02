import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FilerScreen extends StatefulWidget {
  static const routeName = '/filter';
final Function savefilter;
final Map<String,bool> currentFilter;
FilerScreen(this.savefilter,this.currentFilter);
  @override
  _FilerScreenState createState() => _FilerScreenState();
}

class _FilerScreenState extends State<FilerScreen> {
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
@override
initState(){
  isGlutenFree = widget.currentFilter['gluten'];
  isLactoseFree =widget.currentFilter['lactose'];
  isVegan = widget.currentFilter['vegetarian'];
  isVegetarian = widget.currentFilter['vegan'];



  super.initState();
}
  Widget buildSwitchlisttile(
    String title,
    String describtion,
    bool currentvalue,
    Function updatevalue,
  ) {
    return SwitchListTile(
      value: currentvalue,
      onChanged: updatevalue,
      title: Text(
        title,
      ),
      subtitle: Text(
        describtion,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){
              final selectedfilter={
                'gluten': isGlutenFree,
                'lactose': isLactoseFree,
                'vegan': isVegan,
                'vegetarian': isVegetarian,
              };
              widget.savefilter(selectedfilter);



            },
          ),
        ],
        title: Text('Your Filters'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchlisttile(
                  "Gluten free",
                  "Only include gluten free meals",
                  isGlutenFree,
                  (newvalue) {
                    setState(() {
                      isGlutenFree = newvalue;
                    });
                  },
                ),
                buildSwitchlisttile(
                  "Lactose Free",
                  "Only include Lactose free meals",
                  isLactoseFree,
                  (newvalue) {
                    setState(() {
                      isLactoseFree = newvalue;
                    });
                  },
                ),
                buildSwitchlisttile(
                  "Vegan",
                  "Only include Vegan meals",
                  isVegan,
                  (newvalue) {
                    setState(() {
                      isVegan = newvalue;
                    });
                  },
                ),
                buildSwitchlisttile(
                  "Vegetarian",
                  "Only include Vegetarian meals",
                  isVegetarian,
                  (newvalue) {
                    setState(() {
                      isVegetarian = newvalue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
