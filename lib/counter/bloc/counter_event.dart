sealed class CounterEvent {
  const CounterEvent();
}

final class CounterIncrementPressed extends CounterEvent {
  const CounterIncrementPressed();
}

final class CounterDecrementPressed extends CounterEvent {
  const CounterDecrementPressed();
}
