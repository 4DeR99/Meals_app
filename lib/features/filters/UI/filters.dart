import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_app/data/filters.dart';
import 'package:meals_app/features/filters/bloc/filters_bloc.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  final FiltersBloc filtersBloc = FiltersBloc();

  @override
  void initState() {
    filtersBloc.add(FiltersInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Color activeColor = Theme.of(context).colorScheme.primary;

    return BlocConsumer<FiltersBloc, FiltersState>(
      bloc: filtersBloc,
      listenWhen: (previous, current) => current is FiltersActionState,
      buildWhen: (previous, current) => current is! FiltersActionState,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is FiltersLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FiltersLoadingFailureState) {
          return Center(child: Text(state.message));
        } else if (state is FiltersInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FiltersLoadingSuccessState) {
          _glutenFreeFilterSet = state.filters[Filter.glutenFree]!;
          _lactoseFreeFilterSet = state.filters[Filter.lactoseFree]!;
          _vegetarianFilterSet = state.filters[Filter.vegetarian]!;
          _veganFilterSet = state.filters[Filter.vegan]!;
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Filters'),
          ),
          body: Column(
            children: [
              SwitchListTile(
                value: _glutenFreeFilterSet,
                onChanged: (isChecked) {
                  filtersBloc.add(FiltersUpdateEvent(
                      filter: Filter.glutenFree, isactive: isChecked));
                },
                title: Text(
                  'Gluten-free',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                subtitle: Text(
                  'Only include gluten-free meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                activeColor: activeColor,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: _lactoseFreeFilterSet,
                onChanged: (isChecked) {
                  filtersBloc.add(FiltersUpdateEvent(
                      filter: Filter.lactoseFree, isactive: isChecked));
                },
                title: Text(
                  'Lactose-free',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                subtitle: Text(
                  'Only include lactose-free meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                activeColor: activeColor,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: _vegetarianFilterSet,
                onChanged: (isChecked) {
                  filtersBloc.add(FiltersUpdateEvent(
                      filter: Filter.vegetarian, isactive: isChecked));
                },
                title: Text(
                  'Vegetarian',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                subtitle: Text(
                  'Only include vegetarian meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                activeColor: activeColor,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: _veganFilterSet,
                onChanged: (isChecked) {
                  filtersBloc.add(FiltersUpdateEvent(
                      filter: Filter.vegan, isactive: isChecked));
                },
                title: Text(
                  'Vegan',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                subtitle: Text(
                  'Only include vegan meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                activeColor: activeColor,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Scaffold(
//       appBar: AppBar(
//         title: const Text('Filters'),
//       ),
//       body: Column(
//         children: [
//           SwitchListTile(
//             value: _glutenFreeFilterSet,
//             onChanged: (isChecked) {
//               setState(() {
//                 _glutenFreeFilterSet = isChecked;
//               });
//             },
//             title: Text(
//               'Gluten-free',
//               style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                     color: Theme.of(context).colorScheme.onBackground,
//                   ),
//             ),
//             subtitle: Text(
//               'Only include gluten-free meals.',
//               style: Theme.of(context).textTheme.labelMedium!.copyWith(
//                     color: Theme.of(context).colorScheme.onBackground,
//                   ),
//             ),
//             activeColor: activeColor,
//             contentPadding: const EdgeInsets.only(left: 34, right: 22),
//           ),
//           SwitchListTile(
//             value: _lactoseFreeFilterSet,
//             onChanged: (isChecked) {
//               setState(() {
//                 _lactoseFreeFilterSet = isChecked;
//               });
//             },
//             title: Text(
//               'Lactose-free',
//               style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                     color: Theme.of(context).colorScheme.onBackground,
//                   ),
//             ),
//             subtitle: Text(
//               'Only include lactose-free meals.',
//               style: Theme.of(context).textTheme.labelMedium!.copyWith(
//                     color: Theme.of(context).colorScheme.onBackground,
//                   ),
//             ),
//             activeColor: activeColor,
//             contentPadding: const EdgeInsets.only(left: 34, right: 22),
//           ),
//           SwitchListTile(
//             value: _vegetarianFilterSet,
//             onChanged: (isChecked) {
//               setState(() {
//                 _vegetarianFilterSet = isChecked;
//               });
//             },
//             title: Text(
//               'Vegetarian',
//               style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                     color: Theme.of(context).colorScheme.onBackground,
//                   ),
//             ),
//             subtitle: Text(
//               'Only include vegetarian meals.',
//               style: Theme.of(context).textTheme.labelMedium!.copyWith(
//                     color: Theme.of(context).colorScheme.onBackground,
//                   ),
//             ),
//             activeColor: activeColor,
//             contentPadding: const EdgeInsets.only(left: 34, right: 22),
//           ),
//           SwitchListTile(
//             value: _veganFilterSet,
//             onChanged: (isChecked) {
//               setState(() {
//                 _veganFilterSet = isChecked;
//               });
//             },
//             title: Text(
//               'Vegan',
//               style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                     color: Theme.of(context).colorScheme.onBackground,
//                   ),
//             ),
//             subtitle: Text(
//               'Only include vegan meals.',
//               style: Theme.of(context).textTheme.labelMedium!.copyWith(
//                     color: Theme.of(context).colorScheme.onBackground,
//                   ),
//             ),
//             activeColor: activeColor,
//             contentPadding: const EdgeInsets.only(left: 34, right: 22),
//           ),
//         ],
//       ),
//     )
