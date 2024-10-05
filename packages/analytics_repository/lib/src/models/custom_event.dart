import 'package:analytics_repository/analytics_repository.dart';

class CustomEvent extends AnalyticsEvent {
  const CustomEvent(
    this.name, {
    this.parameters = const <String, dynamic>{},
  }) : assert(
          name.length <= 40,
          'name must be less than 40 characters',
        );

  final String name;
  final Map<String, dynamic> parameters;

  @override
  Future<void> send() async {}

  @override
  List<Object?> get props => [name, parameters];
}
