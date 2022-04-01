part of 'counter_cubit.dart';

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
