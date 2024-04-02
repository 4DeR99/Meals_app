part of 'meals_bloc.dart';

@immutable
sealed class MealsState {}

abstract class MealActionState extends MealsState {}

final class MealsInitial extends MealsState {}

class MealsLoadingState extends MealsState {}

class MealsLoadedSuccessState extends MealsState {
  final List<Meal> meals;

  MealsLoadedSuccessState({required this.meals});
}

class MealsLoadedFailureState extends MealsState {
  final String message;

  MealsLoadedFailureState({required this.message});
}

class FavoritesMealsState extends MealsState {}

class FavoritesMealsLoadingState extends MealsState {}

class FavoritesMealsLoadedSuccessState extends MealsState {
  final List<Meal> meals;

  FavoritesMealsLoadedSuccessState({required this.meals});
}

class FavoritesMealsLoadedFailureState extends MealsState {
  final String message;

  FavoritesMealsLoadedFailureState({required this.message});
}

class MealSelectedActionState extends MealActionState {
  final Meal meal;

  MealSelectedActionState({required this.meal});
}
