part of 'filters_bloc.dart';

@immutable
sealed class FiltersEvent {}

class FiltersInitialEvent extends FiltersEvent {}

class FiltersUpdateEvent extends FiltersEvent {
  final Filter filter;
  final bool isactive;

  FiltersUpdateEvent({required this.filter, required this.isactive});
}
