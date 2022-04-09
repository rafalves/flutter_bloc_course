import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_exemple1/constants/enums.dart';
import 'package:flutter_bloc_exemple1/logic/cubit/internet_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  StreamSubscription internetStreamSubscription;

  CounterCubit({
    required this.internetCubit,
  }) : super(CounterState(counterValue: 0)) {
    monitorInternetCubit();
  };

StreamSubscription<InternetCubit> monitorInternetCubit() {
  return internetStreamSubscription = internetCubit.listen((internetState) {
    if (internetState is InternetConnected && internetState.connectionType == ConnectionType.wifi) {
      return increment();
    } else if (internetState is InternetConnected && internetState.connectionType == ConnectionType.mobile) {
        decrement();
      }
    
  
  });
}


  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasUpdated: true));

  void decrement() => emit(
      CounterState(counterValue: state.counterValue - 1, wasUpdated: false));

  void reset() => emit(CounterState(counterValue: state.counterValue = 0));
}
