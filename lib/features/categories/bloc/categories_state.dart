part of 'categories_bloc.dart';

@immutable
sealed class CategoriesState {}

abstract class CategoriesActionState extends CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesLoadingSuccess extends CategoriesState {
  final List<Category> categories;

  CategoriesLoadingSuccess({required this.categories});
}

class CategoriesLoadingFailure extends CategoriesState {}

class CategorySelectedActionState extends CategoriesActionState {
  final Category category;

  CategorySelectedActionState({required this.category});
}

class CategoriesDrawerClickedActionState extends CategoriesActionState {}
