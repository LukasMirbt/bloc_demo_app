import 'dart:developer';

import 'package:analytics_repository/analytics_repository.dart';
import 'package:recase/recase.dart';

class DefaultEvent extends AnalyticsEvent {
  const DefaultEvent._(this.name);

  factory DefaultEvent.from(Type type) {
    final name = ReCase(type.toString()).snakeCase;
    assert(
      name.length <= 40,
      'name must be less than 40 characters',
    );
    return DefaultEvent._(name);
  }

  final String name;

  @override
  Future<void> send() async {
    log('Sent analytic: $name');
  }
}
