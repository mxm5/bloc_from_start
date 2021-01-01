part of 'counter_cubit.dart';

class CounterState {
  final bool wasIncremented;
  final int counterValue;
  final DateTime dateTime;

  CounterState(
      {this.dateTime, this.wasIncremented, @required this.counterValue});
}
