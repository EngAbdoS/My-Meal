import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoritemeal;

  FavoriteScreen(this.favoritemeal);

  @override
  Widget build(BuildContext context) {
    if (favoritemeal.isEmpty) {
      return Center(
        child: Text("You have no favorites yet => Start adding some!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoritemeal[index].id,
            imageurl: favoritemeal[index].imageUrl,
            title: favoritemeal[index].title,
            duration: favoritemeal[index].duration,
            affordability: favoritemeal[index].affordability,
            complexity: favoritemeal[index].complexity,
          );
        },
        itemCount: favoritemeal.length,
      );
    }
  }
}
