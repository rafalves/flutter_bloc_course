import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_exemple1/presentation/screens/second_screen.dart';
import 'package:flutter_bloc_exemple1/presentation/screens/third_screen.dart';
import 'logic/cubit/counter_cubit.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => BlocProvider.value(
              value: _counterCubit,
              child: const HomeScreen(
                title: 'HomeScreen',
                color: Colors.blueAccent,
              ),
            ),
        '/second': (context) => BlocProvider.value(
              value: _counterCubit,
              child: const SecondScreen(
                title: 'SecondScreen',
                color: Colors.redAccent,
              ),
            ),
        '/third': (context) => BlocProvider.value(
              value: _counterCubit,
              child: const ThirdScreen(
                title: 'ThirdScreen',
                color: Colors.greenAccent,
              ),
            ),
      },
      // home: BlocProvider(
      //   create: (context) => CounterCubit(),
      //   child: const HomeScreen(
      //     title: 'Flutter Demo Home Page',
      //     color: Colors.blueAccent,
      //   ),
      // ),
    );
  }
}
