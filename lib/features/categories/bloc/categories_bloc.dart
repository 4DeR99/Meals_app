import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meals_app/features/categories/models/category.dart';
import 'package:meta/meta.dart';
import 'package:meals_app/data/dummy_data.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial()) {
    on<CategoriesInitalEvent>(categoriesInitalEvent);
    on<CategorySelectedEvent>(categorySelectedEvent);
  }

  FutureOr<void> categoriesInitalEvent(
      CategoriesInitalEvent event, Emitter<CategoriesState> emit) async {
    emit(CategoriesLoading());
    // await Future.delayed(const Duration(seconds: 2)); fetching data from the internet
    emit(CategoriesLoadingSuccess(categories: availableCategories));
  }

  FutureOr<void> categorySelectedEvent(
      CategorySelectedEvent event, Emitter<CategoriesState> emit) {
    emit(CategorySelectedActionState(category: event.category));
  }
}
