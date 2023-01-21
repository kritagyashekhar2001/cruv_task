part of 'seats_finder_bloc.dart';

abstract class SeatsFinderState extends Equatable {
  const SeatsFinderState();

  @override
  List<Object> get props => [];
}

class SeatsFinderInitial extends SeatsFinderState {}

class NumberColored extends SeatsFinderState {
  final int index;

  const NumberColored(this.index);
  @override
  List<Object> get props => [index];
}
class NumberOutOfRange extends SeatsFinderState {
  final String error;

  const NumberOutOfRange(this.error);
  @override
  List<Object> get props => [error];
}
