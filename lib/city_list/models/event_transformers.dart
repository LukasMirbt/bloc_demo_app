import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

abstract class EventTransformers {
  static EventTransformer<E> debounceDroppable<E>(Duration duration) {
    return (events, mapper) {
      return droppable<E>().call(events.debounce(duration), mapper);
    };
  }
}
