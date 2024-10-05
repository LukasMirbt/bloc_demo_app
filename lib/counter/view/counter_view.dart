import 'package:bloc_demo_app/counter/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: const SafeArea(
        child: Center(
          child: _Counter(),
        ),
      ),
      floatingActionButton: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _IncrementButton(),
          SizedBox(height: 8),
          _DecrementButton(),
        ],
      ),
    );
  }
}

class _Counter extends StatelessWidget {
  const _Counter();

  @override
  Widget build(BuildContext context) {
    final counter = context.select(
      (CounterBloc bloc) => bloc.state.count,
    );

    final textTheme = Theme.of(context).textTheme;

    return Text(
      counter.toString(),
      style: textTheme.displayLarge,
    );
  }
}

class _IncrementButton extends StatelessWidget {
  const _IncrementButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: _IncrementButton,
      child: const Icon(Icons.add),
      onPressed: () {
        context.read<CounterBloc>().add(
              const CounterIncrementPressed(),
            );
      },
    );
  }
}

class _DecrementButton extends StatelessWidget {
  const _DecrementButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: _DecrementButton,
      child: const Icon(Icons.remove),
      onPressed: () {
        context.read<CounterBloc>().add(
              const CounterDecrementPressed(),
            );
      },
    );
  }
}
