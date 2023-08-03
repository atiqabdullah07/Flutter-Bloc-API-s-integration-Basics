// ignore_for_file: must_be_immutable

part of 'app_bloc.dart';

class AppState {
  int counter;
  AppState({required this.counter});
}

class AppInitial extends AppState {
  AppInitial() : super(counter: 0);
}

// class Counter extends AppState {
//   int counter;
//   Counter({required this.counter});
// }
