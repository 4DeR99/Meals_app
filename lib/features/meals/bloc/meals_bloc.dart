import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'meals_event.dart';
part 'meals_state.dart';

class MealsBloc extends Bloc<MealsEvent, MealsState> {
  MealsBloc() : super(MealsInitial()) {
    on<MealsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
