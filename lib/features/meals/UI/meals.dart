import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/features/categories/models/category.dart';
import 'package:meals_app/features/meals/bloc/meals_bloc.dart';
import 'package:meals_app/features/meals/models/meal.dart';

import 'package:meals_app/features/meals/UI/widgets/meal_item.dart';
import 'package:meals_app/features/meal_details/UI/meal_details.dart';

class MealsScreen extends StatefulWidget {
  const MealsScreen({
    super.key,
    this.title,
    this.category,
  });

  final String? title;
  final Category? category;

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => MealDetailsScreen(meal: meal)),
      ),
    );
  }

  final MealsBloc mealsBloc = MealsBloc();

  Widget _getBody(List<Meal> meals) {
    Widget body = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
        return MealItem(
          meal: meals[index],
          mealsBloc: mealsBloc,
        );
      },
    );

    if (meals.isEmpty) {
      body = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'No meals found!',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            Text(
              'Try another category.',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ],
        ),
      );
    }

    return body;
  }

  @override
  void initState() {
    super.initState();
    if (widget.category != null) {
      mealsBloc.add(MealsInitialEvent(category: widget.category!));
    } else {
      mealsBloc.add(FavoritesMealsEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget body = Container();
    PreferredSizeWidget? appBar;

    if (widget.title != null) {
      appBar = AppBar(
        title: Text(widget.title!),
      );
    }

    return Scaffold(
      appBar: appBar,
      body: BlocConsumer<MealsBloc, MealsState>(
        bloc: mealsBloc,
        listenWhen: (previous, current) => current is MealActionState,
        buildWhen: (previous, current) => current is! MealActionState,
        listener: (context, state) {
          if (state is MealSelectedActionState) {
            _selectMeal(context, state.meal);
          }
        },
        builder: (context, state) {
          if (state is MealsLoadingState || state is FavoritesMealsLoadingState) {
            body = const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MealsLoadedFailureState) {
            body = Center(
              child: Text(state.message),
            );
          } else if (state is FavoritesMealsLoadedFailureState) {
            body = Center(
              child: Text(state.message),
            );
          } else if (state is MealsLoadedSuccessState) {
            body = _getBody(state.meals);
          } else if (state is FavoritesMealsLoadedSuccessState) {
            body = _getBody(state.meals);
          }
          return body;
        },
      ),
    );
  }
}
