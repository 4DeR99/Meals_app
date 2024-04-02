part of 'meal_details_bloc.dart';

@immutable
sealed class MealDetailsState {}

abstract class ActionState extends MealDetailsState {}

final class MealDetailsInitial extends MealDetailsState {}


class LoadingState extends MealDetailsState {}

class LoadingSuccessState extends MealDetailsState {
  final bool isFavorite;

  LoadingSuccessState(this.isFavorite);
}

class LoadingFailureState extends MealDetailsState {
  final String message;

  LoadingFailureState(this.message);
}

class AddToFavoritesActionState extends ActionState {
  final Meal meal;

  AddToFavoritesActionState(this.meal);
}

class RemoveFromFavoritesActionState extends ActionState {
  final Meal meal;

  RemoveFromFavoritesActionState(this.meal);
}