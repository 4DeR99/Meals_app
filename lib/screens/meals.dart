import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

import 'package:meals_app/widgets/meal_item.dart';
import 'package:meals_app/screens/meal_details.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });

  final String? title;
  final List<Meal> meals;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => MealDetailsScreen(meal: meal)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget body = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
        return MealItem(
          meal: meals[index],
          onSelectMeal: () {
            _selectMeal(context, meals[index]);
          },
        );
      },
    );

    if (meals.isEmpty) {
      body = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'No meals found!',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            Text(
              'Try another category.',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ],
        ),
      );
    }

    if (title == null) {
      return body;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: body,
    );
  }
}
