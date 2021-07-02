import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/category_screen.dart';
import 'package:meal_app/screens/favorites_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoritemeal;

  const TabsScreen(this.favoritemeal);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categries',
      },
      {
        'page': FavoriteScreen(widget.favoritemeal),
        'title': 'Your Favorites',
      },
    ];
  }

  int selectpageintex = 0;

  void _selectpage(int value) {
    setState(() {
      selectpageintex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[selectpageintex]['title']),
      ),
      body: _pages[selectpageintex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectpage,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: selectpageintex,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Category"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Favorites"),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
