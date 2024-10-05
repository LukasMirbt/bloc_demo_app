sealed class CityListEvent {
  const CityListEvent();
}

final class CityListStarted extends CityListEvent {
  const CityListStarted();
}

final class CityListSearchChanged extends CityListEvent {
  const CityListSearchChanged(this.search);

  final String search;
}

final class CityListSearchCleared extends CityListEvent {
  const CityListSearchCleared();
}
