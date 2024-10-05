import 'package:bloc_demo_app/counter/counter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<CounterIncrementPressed>(_onIncrementPressed);
    on<CounterDecrementPressed>(_onDecrementPressed);
  }

  void _onIncrementPressed(
    CounterIncrementPressed event,
    Emitter<CounterState> emit,
  ) {
    emit(
      state.copyWith(
        count: state.count + 1,
      ),
    );
  }

  void _onDecrementPressed(
    CounterDecrementPressed event,
    Emitter<CounterState> emit,
  ) {
    emit(
      state.copyWith(
        count: state.count - 1,
      ),
    );
  }
}
