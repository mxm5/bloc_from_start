import 'package:ansicolor/ansicolor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterObserver extends BlocObserver {
  final _pen = AnsiPen()..rgb(b: .2, bg: true);
  @override
  void onChange(Cubit cubit, Change change) {
    print(_pen(' counter observer : ${cubit.runtimeType} $change '));
    super.onChange(cubit, change);
  }
}
