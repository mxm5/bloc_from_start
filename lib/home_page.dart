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
            builder: (context, state) {
              final count = state.counterValue;
              return showMessage(count);
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

Message showMessage(int count) {
  if (count < 0) {
    return Message(
      title: ' nah negative $count ',
    );
  }
  if (count % 2 == 0) {
    return Message(
      title: ' yaay $count ',
    );
  }
  if (count == 5) {
    return Message(
      title: ' hmm the quinta $count',
    );
  } else {
    return Message(
      title: '$count',
    );
  }
}

class Message extends StatelessWidget {
  final String title;
  const Message({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 25,
      ),
    );
  }
}
