import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:bloc_demo_app/city_list/city_list.dart';
import 'package:city_repository/city_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

class CityListBloc extends Bloc<CityListEvent, CityListState> {
  CityListBloc({
    required CityRepository cityRepository,
  })  : _repository = cityRepository,
        super(CityListState()) {
    on<CityListStarted>(_onStarted);
    on<CityListSearchChanged>(_onSearchChanged);
  }

  final CityRepository _repository;

  Future<void> _onStarted(
    CityListStarted event,
    Emitter<CityListState> emit,
  ) async {
    emit(
      state.copyWith(
        status: CityListStatus.loading,
      ),
    );

    try {
      final cities = await _repository.fetchCities();

      emit(
        state.copyWith(
          status: CityListStatus.success,
          cities: cities,
        ),
      );
    } catch (e, s) {
      addError(e, s);
      emit(
        state.copyWith(
          status: CityListStatus.failure,
        ),
      );
    }
  }

  Future<void> _onSearchChanged(
    CityListSearchChanged event,
    Emitter<CityListState> emit,
  ) async {
    emit(
      state.copyWith(
        status: CityListStatus.loading,
      ),
    );

    try {
      final cities = await _repository.fetchCities(
        search: event.search,
      );

      emit(
        state.copyWith(
          status: CityListStatus.success,
          cities: cities,
        ),
      );
    } catch (e, s) {
      addError(e, s);
      emit(
        state.copyWith(
          status: CityListStatus.failure,
        ),
      );
    }
  }
}

EventTransformer<E> debounceDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.debounce(duration), mapper);
  };
}
