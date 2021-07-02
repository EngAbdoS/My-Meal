import 'package:flutter/material.dart';
import 'package:meal_app/widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: GridView(
        padding: EdgeInsets.all(25),
        children:DUMMY_CATEGORIES.map((cd) =>

       CategoryItem(id :cd.id,color: cd.color, title: cd.title,),

        ).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1.5,
        ),
      ),
    );
  }
}
