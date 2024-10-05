import 'package:analytics_repository/analytics_repository.dart';
import 'package:app_logging/app_logging.dart';
import 'package:bloc_demo_app/app/app.dart';
import 'package:city_repository/city_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final logger = AppLogging.init();

  const analyticsRepository = AnalyticsRepository();

  Bloc.observer = AppBlocObserver(
    logger: logger,
    analyticsRepository: analyticsRepository,
  );

  final router = AppRouter.routerConfig(
    logger: logger,
    analyticsRepository: analyticsRepository,
  );

  const cityRepository = CityRepository();

  runApp(
    App(
      analyticsRepository: analyticsRepository,
      cityRepository: cityRepository,
      router: router,
    ),
  );
}
