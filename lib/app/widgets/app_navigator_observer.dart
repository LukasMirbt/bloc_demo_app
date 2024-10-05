import 'package:analytics_repository/analytics_repository.dart';
import 'package:app_logging/app_logging.dart';
import 'package:flutter/material.dart';

export 'package:analytics_repository/analytics_repository.dart' show ScreenView;

class AppNavigatorObserver extends NavigatorObserver {
  AppNavigatorObserver({
    required Logger logger,
    required AnalyticsRepository analyticsRepository,
  })  : _logger = logger,
        _analyticsRepository = analyticsRepository;

  final Logger _logger;
  final AnalyticsRepository _analyticsRepository;

  void _maybeSendScreenView(Route<dynamic>? route) {
    final routeName = route?.settings.name;
    if (routeName == null) return;

    final screenView = ScreenView.from(routeName);
    _analyticsRepository.send(screenView);

    _logger.fine(screenView.eventName);
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final isInitialRoute = route.isFirst && previousRoute == null;
    if (isInitialRoute) return;
    _maybeSendScreenView(route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _maybeSendScreenView(previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    _maybeSendScreenView(newRoute);
  }
}
