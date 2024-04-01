import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meals_app/features/categories/models/category.dart';
import 'package:meals_app/features/meals/models/meal.dart';
import 'package:meta/meta.dart';
import 'package:meals_app/data/dummy_data.dart';

part 'meals_event.dart';
part 'meals_state.dart';

class MealsBloc extends Bloc<MealsEvent, MealsState> {
  MealsBloc() : super(MealsInitial()) {
    on<MealsInitialEvent>(mealsInitialEvent);
    on<MealSelectedEvent>(mealSelectedEvent);
  }

  FutureOr<void> mealsInitialEvent(MealsInitialEvent event, Emitter<MealsState> emit) {
    emit(MealsLoadingState());
    emit(MealsLoadedSuccessState(meals: dummyMeals
        .where((meal) => meal.categories.contains(event.category.id))
        .toList()));
  }

  FutureOr<void> mealSelectedEvent(MealSelectedEvent event, Emitter<MealsState> emit) {
  }
}
