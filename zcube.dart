// In the case of the CounterCubit above, the state can be represented via an int but in more complex cases it might be necessary to use a class
// class MyCounterCubit extends Cubit<MyCounterState> {
//   MyCounterCubit() : super(MyCounterInitial());
// }

import 'package:ansicolor/ansicolor.dart';
import 'package:bloc/bloc.dart';

enum CounterEvevnts { increment, decrement }

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);

  @override
  void onChange(Change<int> change) {
    print(change);
    super.onChange(change);
  }
  // @override
  // Stream<int> mapEventToState(CounterEvevnts event) async* {
  //   switch (event) {
  //     case CounterEvevnts.increment:
  //       yield state + 1;
  //       break;
  //     case CounterEvevnts.decrement:
  //       yield state - 1;
  //       break;
  //     default:
  //   }
}
// Each Cubit has the ability to output a new state via emit.
// void incremant() {
//   print('inc called ');
//   return emit(state + 1);
//  When increment is called, we can access the current state of the Cubit via the state getter and emit a new state
// }

// void decrement() {
//   print('dec called ');
//   return emit(state - 1);
//  When increment is called, we can access the current state of the Cubit via the state getter and emit a new state
// }
// }

void main(List<String> args) async {
  AnsiPen someColorPen = AnsiPen()..rgb(r: 0, g: 0, b: .2, bg: true);
  // final mbloc = CounterBloc();
  // final subscriber = mbloc.listen((data) {
  //   print(someColorPen('state is $data'));
  // });
  // now we add events instead of callitn functions
  // mbloc.add(CounterEvevnts.increment);
  // mbloc.add(CounterEvevnts.increment);
  // mbloc.add(CounterEvevnts.increment);
  // mbloc.add(CounterEvevnts.increment);
  // mbloc.add(CounterEvevnts.decrement);
  // mbloc.add(CounterEvevnts.decrement);
  // mbloc.add(CounterEvevnts.decrement);
  // final meFirstCubit = CounterCubit();
  // final listenrToStraem = meFirstCubit.listen((data) {
  //   print(someColorPen('state is $data '));
  // });
  // final meFirstCubit = CounterCubit(0);
  // print('state is ' + someColorPen(meFirstCubit.state.toString()));
  // meFirstCubit.incremant();
  // print('state is ' + someColorPen(meFirstCubit.state.toString()));
  // meFirstCubit.decrement();
  // print('state is ' + someColorPen(meFirstCubit.state.toString()));
  // meFirstCubit.incremant();
  // meFirstCubit.incremant();
  // meFirstCubit.incremant();
  // meFirstCubit.incremant();
  // meFirstCubit.incremant();
  // meFirstCubit.close();
  //! has error now because of importing Flutter Bloc
  // we must imported bloc alone
  // import 'package:flutter_bloc/flutter_bloc.dart';
  // another way is to listen to a cubit cuase it is a stream and streams can be listened
  // must use this for not canceling the sub before listening to it
  // await listenrToStraem.cancel();
  // await meFirstCubit.close();
  // closing for not leaking
  // turning cubit to the Bloc man
  // the difference between cubit and bloc is cubit has not stram entrance hence only
  // exiting type that has like int or class of state
  // but bloc has stream entrance and stream of state out put
  // await Future.delayed(Duration.zero);
  // await subscriber.cancel();
  // await mbloc.close();
  final x = CounterCubit()
    ..increment()
    ..increment()
    ..increment()
    ..increment()
    ..increment()
    ..increment()
    ..close();
  print(x.state);
// Change { currentState: 0, nextState: 1 }
// Change { currentState: 1, nextState: 2 }
// Change { currentState: 2, nextState: 3 }
// Change { currentState: 3, nextState: 4 }
// Change { currentState: 4, nextState: 5 }
// Change { currentState: 5, nextState: 6 }
// 6
  // A Change occurs just before the state of the Cubit is updated.
  // }
}

// difference between yield and yield *
// 20

// yield
// It is used to emit values from stream.

// Example (yield)

// Stream<int> str() async* {
//   List<int> numbers = [1, 2, 3, 4, 5];
//   for (var i in numbers) {
//     if (i > 2) yield i; // only yield numbers greater than 2
//   }
// }

// main() async {
//   await for (var i in str()) {
//     print(i);
//   }
// }
// Output:

// 3
// 4
// 5
// yield*
// It delegates to the another generator and after the another generator stop producing values, then it resumes generating its own values.

// Example yield*

// Stream<int> numbersDownFrom(int n) async* {
//   if (n > 2) {
//     yield n;
//     yield* numbersDownFrom(n - 1);
//   }
// }

// main() async {
//   await for (int i in numbersDownFrom(5)) {
//     print('$i');
//   }
// }

// Output:

// 5
// 4
// 3
