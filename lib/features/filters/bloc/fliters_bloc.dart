import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'fliters_event.dart';
part 'fliters_state.dart';

class FlitersBloc extends Bloc<FlitersEvent, FlitersState> {
  FlitersBloc() : super(FlitersInitial()) {
    on<FlitersEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
