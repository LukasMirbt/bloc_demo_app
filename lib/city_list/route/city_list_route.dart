import 'package:bloc_demo_app/city_list/city_list.dart';
import 'package:go_router/go_router.dart';

abstract class CityListRoute {
  static const name = 'cityList';
  static const path = '/cities';

  static GoRoute route() {
    return GoRoute(
      name: name,
      path: path,
      builder: (_, __) => const CityListPage(),
    );
  }
}
