import 'package:flutter/material.dart';

import '../widgets/mealItem.dart';

import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String id;
  // final String title;

  // CategoryMealsScreen(this.id, this.title);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final meals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: meals[index].id,
              title: meals[index].title,
              duration: meals[index].duration,
              imageUrl: meals[index].imageUrl,
              affordability: meals[index].affordability,
              complexity: meals[index].complexity,
            );
          },
          itemCount: meals.length,
        ));
  }
}
