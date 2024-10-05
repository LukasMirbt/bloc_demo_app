import 'dart:math';

import 'package:city_repository/city_repository.dart';
import 'package:city_repository/src/models/cities.dart';

class CityRepository {
  const CityRepository();

  Future<List<City>> fetchCities({
    String? search,
  }) async {
    final ms = Random().nextInt(2000);

    await Future<void>.delayed(
      Duration(milliseconds: ms),
    );

    if (search == null || search.isEmpty) {
      print('fetched all cities');
      return cities;
    }

    print('fetched cities with search: $search');

    return cities.where((city) {
      final cityName = city.name.toLowerCase();
      final searchTerm = search.toLowerCase();
      return cityName.contains(searchTerm);
    }).toList();
  }
}
