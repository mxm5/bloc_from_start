import 'package:bp/counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final txTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text(' counter app '),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        BlocBuilder<CounterCubit, int>(
          cubit: context.watch<CounterCubit>(),
          builder: (context, state) {
            return Text(
              'helo you have pressed $state the button this many times',
              style: txTheme.headline5,
              textAlign: TextAlign.center,
            );
          },
        ),
      ]),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            child: FaIcon(FontAwesomeIcons.plus),
            onPressed: () => BlocProvider.of<CounterCubit>(context).increment(),
          ),
          FloatingActionButton(
            child: FaIcon(FontAwesomeIcons.minus),
            onPressed: () => BlocProvider.of<CounterCubit>(context).decrement(),
          ),
        ],
      ),
    );
  }
}
