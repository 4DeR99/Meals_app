import 'package:flutter/material.dart';
import 'package:meals_app/features/categories/bloc/categories_bloc.dart';
import 'package:meals_app/features/categories/models/category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/features/categories/UI/widgets/categorie_grid_item.dart';
import 'package:meals_app/features/meals/UI/meals.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  void _selectCategory(BuildContext context, Category category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => MealsScreen(
              title: category.title,
              category: category,
            )),
      ),
    );
  }

  @override
  void initState() {
    categoriesBloc.add(CategoriesInitalEvent());
    super.initState();
  }

  final CategoriesBloc categoriesBloc = CategoriesBloc();

  @override
  Widget build(BuildContext context) {
    Widget mainBody = GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: availableCategories
          .map((category) => CategorieGridItem(
                category: category,
                categoriesBlac: categoriesBloc,
              ))
          .toList(),
    );

    return BlocConsumer<CategoriesBloc, CategoriesState>(
      bloc: categoriesBloc,
      listenWhen: (previous, current) => current is CategoriesActionState,
      buildWhen: (previous, current) => current is! CategoriesActionState,
      listener: (context, state) {
        if (state is CategorySelectedActionState) {
          _selectCategory(context, state.category);
        }
      },
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CategoriesLoadingFailure) {
          return const Center(
            child: Text('An error occurred!'),
          );
        } else {
          return mainBody;
        }
      },
    );
  }
}
