import 'package:bloc_demo_app/door_list/door_list.dart';
import 'package:go_router/go_router.dart';

abstract class DoorListRoute {
  static const name = 'doorList';
  static const path = '/doors';

  static GoRoute route() {
    return GoRoute(
      name: name,
      path: path,
      builder: (_, __) => const DoorListPage(),
    );
  }
}
