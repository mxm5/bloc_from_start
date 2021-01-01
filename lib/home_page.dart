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
        body: BlocConsumer<CounterCubit, CounterState>(
          listener: (context, state) {
            if (state.wasIncremented) {
              Scaffold.of(context).hideCurrentSnackBar();
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  // behavior: SnackBarBehavior.floating,
                  content: Text(' Incremented by one'),
                  duration: Duration(
                    seconds: 5,
                  ),
                ),
              );
            } else {
              Scaffold.of(context).hideCurrentSnackBar();

              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(' Decremented by one'),
                duration: Duration(
                  seconds: 5,
                ),
              ));
            }
          },
          listenWhen: (previous, current) {
            // print(previous.wasIncremented.toString() + ' p ');
            // print(previous.dateTime.second.toString() + ' p ');
            // print(current.wasIncremented.toString() + ' c ');
            // print(current.dateTime.second.toString() + ' c ');
            return (previous.wasIncremented != current.wasIncremented ||
                current.dateTime.second - previous.dateTime.second > 1);
          },
          // listenWhen: (previous, current) {
          //   if (current.dateTime.second - previous.dateTime.second <= 2) {
          //     return true;
          //   } else {
          //     return false;
          //   }
          // },
          builder: (context, state) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('you have pressed the button this many times'),
              Column(children: [showMessage(state.counterValue)]),
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
        ));
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
