import 'package:analytics_repository/analytics_repository.dart';
import 'package:app_logging/app_logging.dart';
import 'package:bloc_demo_app/app/app.dart';
import 'package:bloc_demo_app/home/route/home_route.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter routerConfig({
    required Logger logger,
    required AnalyticsRepository analyticsRepository,
  }) {
    return GoRouter(
      observers: [
        AppNavigatorObserver(
          logger: logger,
          analyticsRepository: analyticsRepository,
        ),
      ],
      routes: [
        HomeRoute.route(),
      ],
    );
  }
}
