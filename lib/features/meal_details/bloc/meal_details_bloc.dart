import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'meal_details_event.dart';
part 'meal_details_state.dart';

class MealDetailsBloc extends Bloc<MealDetailsEvent, MealDetailsState> {
  MealDetailsBloc() : super(MealDetailsInitial()) {
    on<MealDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
