import 'package:bloc_demo_app/counter/counter.dart';
import 'package:go_router/go_router.dart';

abstract class CounterRoute {
  static const name = 'counter';
  static const path = '/counter';

  static GoRoute route() {
    return GoRoute(
      name: name,
      path: path,
      builder: (_, __) => const CounterPage(),
    );
  }
}
