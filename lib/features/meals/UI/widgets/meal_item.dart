import 'package:flutter/material.dart';
import 'package:meals_app/features/meals/bloc/meals_bloc.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meals_app/features/meals/models/meal.dart';

import 'package:meals_app/features/meals/UI/widgets/meal_item_trait.dart';

dynamic placeHolder = kTransparentImage;

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.mealsBloc,
  });

  final Meal meal;
  final MealsBloc mealsBloc;

  @override
  Widget build(BuildContext context) {
    final complexityText =
        meal.complexity.name[0] + meal.complexity.name.substring(1);
    final affordabilityText =
        meal.affordability.name[0] + meal.affordability.name.substring(1);

    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          mealsBloc.add(MealSelectedEvent(meal: meal));
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(
                  horizontal: 44,
                  vertical: 6,
                ),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MealItemTrait(
                          icon: Icons.schedule,
                          label: '${meal.duration} min',
                        ),
                        const SizedBox(width: 12),
                        MealItemTrait(
                          icon: Icons.work,
                          label: complexityText,
                        ),
                        const SizedBox(width: 12),
                        MealItemTrait(
                          icon: Icons.attach_money,
                          label: affordabilityText,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
