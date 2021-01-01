import 'package:bp/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('counter of cubits'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('you have pressed the button this many times'),
          BlocBuilder<CounterCubit, CounterState>(
            // cubit: context.read<CounterCubit>(),
            builder: (context, state) {
              return Text('${state.counterValue}',
                  style: TextStyle(fontSize: 25));
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: () {
                  // BlocProvider.of<CounterCubit>(context).increment();
                  context.read<CounterCubit>().increment();
                },
                child: Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  // BlocProvider.of<CounterCubit>(context).decrement();
                  context.read<CounterCubit>().decrement();
                },
                child: Icon(Icons.remove),
              )
            ],
          )
        ],
      ),
    );
  }
}
