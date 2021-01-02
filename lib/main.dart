import 'package:bp/counter_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';

void main() {
  Bloc.observer = CounterObserver();
  // this is here to print all state changes
  runApp(CounterApp());
}
