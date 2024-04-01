import 'package:flutter/material.dart';
import 'package:meals_app/features/categories/bloc/categories_bloc.dart';

import 'package:meals_app/features/categories/models/category.dart';

class CategorieGridItem extends StatelessWidget {
  const CategorieGridItem({
    super.key,
    required this.category,
    required this.categoriesBlac,
  });

  final CategoriesBloc categoriesBlac;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        categoriesBlac.add(CategorySelectedEvent(category: category));
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
