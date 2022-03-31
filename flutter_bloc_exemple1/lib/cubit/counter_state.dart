part of 'counter_cubit.dart';

class CounterState {
  int counterValue;
  bool? wasUpdated;
  CounterState({
    this.wasUpdated,
    required this.counterValue,
  });
}
