// In the case of the CounterCubit above, the state can be represented via an int but in more complex cases it might be necessary to use a class
// class MyCounterCubit extends Cubit<MyCounterState> {
//   MyCounterCubit() : super(MyCounterInitial());
// }

import 'package:ansicolor/ansicolor.dart';
import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  // Each Cubit has the ability to output a new state via emit.
  void incremant() {
    print('inc called ');
    return emit(state + 1);
    //  When increment is called, we can access the current state of the Cubit via the state getter and emit a new state
  }

  void decrement() {
    print('dec called ');
    return emit(state - 1);
    //  When increment is called, we can access the current state of the Cubit via the state getter and emit a new state
  }
}

main(List<String> args) async {
  AnsiPen someColorPen = AnsiPen()..rgb(r: 0, g: 0, b: .2, bg: true);
  final meFirstCubit = CounterCubit();
  final listenrToStraem = meFirstCubit.listen((data) {
    print(someColorPen('state is $data '));
  });
  // final meFirstCubit = CounterCubit(0);
  // print('state is ' + someColorPen(meFirstCubit.state.toString()));
  // meFirstCubit.incremant();
  // print('state is ' + someColorPen(meFirstCubit.state.toString()));
  // meFirstCubit.decrement();
  // print('state is ' + someColorPen(meFirstCubit.state.toString()));
  meFirstCubit.incremant();
  meFirstCubit.incremant();
  meFirstCubit.incremant();
  meFirstCubit.incremant();
  meFirstCubit.incremant();
  // meFirstCubit.close();
  //! has error now because of importing Flutter Bloc
  // we must imported bloc alone
  // import 'package:flutter_bloc/flutter_bloc.dart';
  // another way is to listen to a cubit cuase it is a stream and streams can be listened
  await Future.delayed(Duration.zero);
  // must use this for not canceling the sub before listening to it
  await listenrToStraem.cancel();
  await meFirstCubit.close();
  // closing for not leaking
}
