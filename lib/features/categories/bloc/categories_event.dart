part of 'categories_bloc.dart';

@immutable
sealed class CategoriesEvent {}

class CategoriesInitalEvent extends CategoriesEvent {}

class CategorySelectedEvent extends CategoriesEvent {
  final Category category;

  CategorySelectedEvent({required this.category});
}
