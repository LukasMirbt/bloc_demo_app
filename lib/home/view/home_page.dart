import 'package:bloc_demo_app/counter/counter.dart';
import 'package:bloc_demo_app/door_list/door_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              FilledButton(
                onPressed: () {
                  GoRouter.of(context).goNamed(CounterRoute.name);
                },
                child: const Text('Counter'),
              ),
              FilledButton(
                onPressed: () {
                  GoRouter.of(context).goNamed(DoorListRoute.name);
                },
                child: const Text('Doors'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
