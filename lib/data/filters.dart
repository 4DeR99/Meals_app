enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

Map<Filter, bool> filters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};