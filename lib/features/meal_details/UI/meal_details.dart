import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/features/meal_details/UI/widgets/favotires_button.dart';
import 'package:meals_app/features/meal_details/bloc/meal_details_bloc.dart';
import 'package:meals_app/features/meals/models/meal.dart';

class MealDetailsScreen extends StatefulWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
    required this.updateFavorites,
  });

  final Meal meal;
  final void Function() updateFavorites;

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  final MealDetailsBloc mealDetailsBloc = MealDetailsBloc();

  Widget _getBody(Widget actionButton) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.title),
        actions: [
          actionButton,
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: widget.meal.id,
              child: Image.network(
                widget.meal.imageUrl,
                fit: BoxFit.cover,
                height: 300,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 14),
            ...widget.meal.ingredients.map(
              (ingredient) => Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'Spets',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 14),
            ...widget.meal.steps.map(
              (ingredient) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Text(
                  ingredient,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    mealDetailsBloc.add(MealDetailsInitialEvent(widget.meal));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MealDetailsBloc, MealDetailsState>(
      bloc: mealDetailsBloc,
      listenWhen: (previous, current) => current is ActionState,
      buildWhen: (previous, current) => current is! ActionState,
      listener: (context, state) {
        if (state is AddToFavoritesActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Added to favorites'),
            ),
          );
        } else if (state is RemoveFromFavoritesActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Removed from favorites'),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LoadingSuccessState) {
          Widget actionButton = FavoritesButton(
            isFavorite: state.isFavorite,
            meal: widget.meal,
            mealDetailsBloc: mealDetailsBloc,
            updateFavorites: widget.updateFavorites,
          );
          return _getBody(actionButton);
        } else if (state is LoadingFailureState) {
          return Center(
            child: Text(state.message),
          );
        }
        return const Placeholder();
      },
    );
  }
}
