import 'package:analytics_repository/analytics_repository.dart';
import 'package:bloc_demo_app/app/view/app_view.dart';
import 'package:city_repository/city_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({
    required AnalyticsRepository analyticsRepository,
    required CityRepository cityRepository,
    required GoRouter router,
    super.key,
  })  : _analyticsRepository = analyticsRepository,
        _cityRepository = cityRepository,
        _router = router;

  final AnalyticsRepository _analyticsRepository;
  final CityRepository _cityRepository;
  final GoRouter _router;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _analyticsRepository),
        RepositoryProvider.value(value: _cityRepository),
      ],
      child: Provider.value(
        value: _router,
        child: const AppView(),
      ),
    );
  }
}
