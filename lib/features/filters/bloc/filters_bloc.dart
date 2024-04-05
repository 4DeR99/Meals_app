import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:meals_app/data/filters.dart';

part 'filters_event.dart';
part 'filters_state.dart';

class FiltersBloc extends Bloc<FiltersEvent, FiltersState> {
  FiltersBloc() : super(FiltersInitial()) {
    on<FiltersInitialEvent>(filtersInitialEvent);
    on<FiltersUpdateEvent>(filtersUpdateEvent);
  }

  FutureOr<void> filtersInitialEvent(FiltersInitialEvent event, Emitter<FiltersState> emit) {
    emit(FiltersLoadingState());
    emit(FiltersLoadingSuccessState(filters: filters));
  }

  FutureOr<void> filtersUpdateEvent(FiltersUpdateEvent event, Emitter<FiltersState> emit) {
    filters[event.filter] = event.isactive;
    emit(FiltersLoadingSuccessState(filters: filters));
    // emit(FiltersUpdateActionState(filters: filters));
  }
}
