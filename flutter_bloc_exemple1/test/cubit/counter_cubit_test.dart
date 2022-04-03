import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_exemple1/logic/cubit/counter_cubit.dart';
import 'package:test/test.dart';

void main() {
  group('CounterCubit', () {
    //CounterCubit counterCubit;

    setUp(() {
      //counterCubit = CounterCubit();
    });

    tearDown(() {
      //counterCubit.close();
    });
    test(
        'the initial state for the CounterCubit is CounterState(counterValue:0)',
        () {
      CounterCubit counterCubit = CounterCubit();
      expect(counterCubit.state, CounterState(counterValue: 0));
    });

    blocTest(
      'the cubit should emit a CounterState(counterValue:1, wasIncremented:true) when cubit.increment() function is called',
      build: () {
        CounterCubit counterCubit = CounterCubit();
        return counterCubit;
      },
      act: (CounterCubit cubit) => cubit.increment(),
      expect: () => [CounterState(counterValue: 1, wasUpdated: true)],
    );

    blocTest(
      'the cubit should emit a CounterState(counterValue:-1, wasIncremented:false) when cubit.decrement() function is called',
      build: () {
        CounterCubit counterCubit = CounterCubit();
        return counterCubit;
      },
      act: (CounterCubit cubit) => cubit.decrement(),
      expect: () => [CounterState(counterValue: -1, wasUpdated: false)],
    );
  });
}
