part of 'meal_details_bloc.dart';

@immutable
sealed class MealDetailsEvent {}

class MealDetailsInitialEvent extends MealDetailsEvent {
  final Meal meal;

  MealDetailsInitialEvent(this.meal);
}

class AddToFavoritesEvent extends MealDetailsEvent {
  final Meal meal;

  AddToFavoritesEvent(this.meal);
}

class RemoveFromFavoritesEvent extends MealDetailsEvent {
  final Meal meal;

  RemoveFromFavoritesEvent(this.meal);
}