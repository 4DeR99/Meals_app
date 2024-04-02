import 'package:flutter/material.dart';
import 'package:meals_app/features/meal_details/bloc/meal_details_bloc.dart';
import 'package:meals_app/features/meals/models/meal.dart';

class FavoritesButton extends StatelessWidget {
  const FavoritesButton({
    super.key,
    required this.isFavorite,
    required this.mealDetailsBloc,
    required this.meal,
    required this.updateFavorites,
  });

  final bool isFavorite;
  final MealDetailsBloc mealDetailsBloc;
  final Meal meal;
  final void Function() updateFavorites;

  @override
  Widget build(BuildContext context) {
    if (isFavorite) {
      return IconButton(
        icon: const Icon(Icons.favorite),
        onPressed: () {
          mealDetailsBloc.add(RemoveFromFavoritesEvent(meal));
          updateFavorites();
        },
      );
    } else {
      return IconButton(
        icon: const Icon(Icons.favorite_border),
        onPressed: () {
          mealDetailsBloc.add(AddToFavoritesEvent(meal));
          updateFavorites();
        },
      );
    }
  }
}
