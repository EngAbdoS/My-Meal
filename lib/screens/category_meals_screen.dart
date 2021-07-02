import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routename = 'ctegory_meals';
final List<Meal>availablemeals;

  const CategoryMealsScreen(this.availablemeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
String categorytitle;
List<Meal>displayedMeal;
@override
  void didChangeDependencies() {
  final routarg =
  ModalRoute.of(context).settings.arguments as Map<String, String>;
  final categoryid = routarg['id'];
  categorytitle = routarg['title'];
  displayedMeal = widget.availablemeals.where((meal) {
    return meal.categories.contains(categoryid);
  }).toList();
  super.didChangeDependencies();
  }
  @override
  void initState() {

   super.initState();
  }
  void _removeMeal(String mealId){
    setState(() {
      displayedMeal.removeWhere((meal) => meal.id==mealId);
    });

  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(categorytitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeal[index].id,
            imageurl: displayedMeal[index].imageUrl,
            title: displayedMeal[index].title,
            duration: displayedMeal[index].duration,
            affordability: displayedMeal[index].affordability,
            complexity: displayedMeal[index].complexity,
          );
        },
        itemCount: displayedMeal.length,
      ),
    );
  }
}
