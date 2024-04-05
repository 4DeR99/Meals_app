part of 'filters_bloc.dart';

@immutable
sealed class FiltersState {}

abstract class FiltersActionState extends FiltersState {}

final class FiltersInitial extends FiltersState {}

class FiltersLoadingState extends FiltersState {}

class FiltersLoadingSuccessState extends FiltersState {
  final Map<Filter, bool> filters;

  FiltersLoadingSuccessState({required this.filters});
}

class FiltersLoadingFailureState extends FiltersState {
  final String message;

  FiltersLoadingFailureState({required this.message});
}

class FiltersUpdateActionState extends FiltersActionState {
  final Map<Filter, bool> filters;

  FiltersUpdateActionState({required this.filters});
}

