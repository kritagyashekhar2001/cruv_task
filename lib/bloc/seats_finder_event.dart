part of 'seats_finder_bloc.dart';

abstract class SeatsFinderEvent extends Equatable {
  const SeatsFinderEvent();

  @override
  List<Object> get props => [];
}

class NumberEntered extends SeatsFinderEvent {
  final int index;

  const NumberEntered(this.index);
  @override
  List<Object> get props => [index];
}
