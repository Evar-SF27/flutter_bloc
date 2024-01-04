import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_manager/bloc/counter_bloc.dart';
import 'package:state_manager/cubit/counter_cubit.dart';

class IncButton extends StatelessWidget {
  const IncButton({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    final counterCubit = BlocProvider.of<CounterCubit>(context);
    return Row(
      children: [
        FloatingActionButton(
          onPressed: () {
            counterBloc.add(CounterIncremented());
            counterCubit.incrementCounter();
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: () {
            counterBloc.add(CounterDecremented());
            counterCubit.decrementCounter();
          },
          tooltip: 'Decrement',
          child: const Icon(Icons.minimize),
        ),
      ],
    );
  }
}
