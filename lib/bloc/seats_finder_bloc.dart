import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'seats_finder_event.dart';
part 'seats_finder_state.dart';

class SeatsFinderBloc extends Bloc<SeatsFinderEvent, SeatsFinderState> {
  SeatsFinderBloc() : super(SeatsFinderInitial()) {
    on<NumberEntered>((event, emit) {
      if (event.index == 0) {
        emit(const NumberOutOfRange("Please enter a valid seat number."));
      } else if (event.index > 36) {
        emit (const NumberOutOfRange("Please enter seat number less than 36."));
      } else {
        emit(NumberColored(event.index - 1));
      }
    });
  }
}
