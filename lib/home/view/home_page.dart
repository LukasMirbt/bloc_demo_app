import 'package:bloc_demo_app/city_list/route/city_list_route.dart';
import 'package:bloc_demo_app/counter/counter.dart';
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
      body: const SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _CounterButton(),
              SizedBox(height: 16),
              _CityListButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _CounterButton extends StatelessWidget {
  const _CounterButton();

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        GoRouter.of(context).goNamed(CounterRoute.name);
      },
      child: const Text('Counter'),
    );
  }
}

class _CityListButton extends StatelessWidget {
  const _CityListButton();

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        GoRouter.of(context).goNamed(CityListRoute.name);
      },
      child: const Text('City List'),
    );
  }
}
