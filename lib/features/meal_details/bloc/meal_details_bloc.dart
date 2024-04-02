import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meals_app/data/favorites_data.dart';
import 'package:meals_app/features/meals/models/meal.dart';
import 'package:meta/meta.dart';

part 'meal_details_event.dart';
part 'meal_details_state.dart';

class MealDetailsBloc extends Bloc<MealDetailsEvent, MealDetailsState> {
  MealDetailsBloc() : super(MealDetailsInitial()) {
    on<MealDetailsInitialEvent>(mealDetailsInitialEvent);
    on<AddToFavoritesEvent>(addToFavoritesEvent);
    on<RemoveFromFavoritesEvent>(removeFromFavoritesEvent);
  }

  FutureOr<void> mealDetailsInitialEvent(MealDetailsInitialEvent event, Emitter<MealDetailsState> emit) {
    emit(LoadingState());
    emit(LoadingSuccessState(favorites.contains(event.meal)));
  }

  FutureOr<void> addToFavoritesEvent(AddToFavoritesEvent event, Emitter<MealDetailsState> emit) {
    if (!favorites.contains(event.meal)) {
      favorites.add(event.meal);
      emit(LoadingSuccessState(true));
    }
  }

  FutureOr<void> removeFromFavoritesEvent(RemoveFromFavoritesEvent event, Emitter<MealDetailsState> emit) {
    if (favorites.contains(event.meal)) {
      favorites.remove(event.meal);
      emit(LoadingSuccessState(false));
    }
  }
}
