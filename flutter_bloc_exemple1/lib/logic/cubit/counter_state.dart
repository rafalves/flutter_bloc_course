part of 'counter_cubit.dart';

// ignore: must_be_immutable
class CounterState extends Equatable {
  int counterValue;
  bool? wasUpdated;
  CounterState({
    this.wasUpdated,
    required this.counterValue,
  });

  @override
  List<Object?> get props => [counterValue, wasUpdated];
}
