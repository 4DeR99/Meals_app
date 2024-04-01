part of 'meals_bloc.dart';

@immutable
sealed class MealsEvent {}

class MealsInitialEvent extends MealsEvent {
  final Category category;

  MealsInitialEvent({required this.category});
}

class MealSelectedEvent extends MealsEvent {
  final Meal meal;

  MealSelectedEvent({required this.meal});
}
