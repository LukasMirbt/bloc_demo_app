import 'package:bloc_demo_app/counter/counter.dart';
import 'package:bloc_demo_app/door_list/door_list.dart';
import 'package:bloc_demo_app/home/home.dart';
import 'package:go_router/go_router.dart';

abstract class HomeRoute {
  static const name = 'home';
  static const path = '/';

  static GoRoute route() {
    return GoRoute(
      name: name,
      path: path,
      builder: (_, __) => const HomePage(),
      routes: [
        CounterRoute.route(),
        DoorListRoute.route(),
      ],
    );
  }
}
