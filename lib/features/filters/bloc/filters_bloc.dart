import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'filters_event.dart';
part 'filters_state.dart';

class FiltersBloc extends Bloc<FiltersEvent, FiltersState> {
  FiltersBloc() : super(FiltersInitial()) {
    on<FiltersEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
