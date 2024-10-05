import 'package:city_repository/city_repository.dart';
import 'package:equatable/equatable.dart';

enum CityListStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitialOrLoading => this == initial || this == loading;
  bool get isLoading => this == loading;
}

class CityListState extends Equatable {
  CityListState({
    List<City> cities = const [],
    this.status = CityListStatus.initial,
    this.search = '',
  }) : cities = status.isInitialOrLoading ? _placeholderCities : cities;

  final CityListStatus status;
  final List<City> cities;
  final String search;

  CityListState copyWith({
    CityListStatus? status,
    List<City>? cities,
  }) {
    return CityListState(
      status: status ?? this.status,
      cities: cities ?? this.cities,
      search: search,
    );
  }

  static final _placeholderCities = List.generate(
    50,
    (i) => City(
      name: 'City $i',
      area: Area.values[i % Area.values.length],
    ),
  );

  @override
  List<Object?> get props => [
        cities,
        status,
        search,
      ];
}
