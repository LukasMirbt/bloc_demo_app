import 'package:analytics_repository/analytics_repository.dart';
import 'package:recase/recase.dart';

class ScreenView extends AnalyticsEvent {
  const ScreenView._(this.screenName);

  factory ScreenView.from(String name) {
    final routeName = ReCase(name).snakeCase;
    assert(
      routeName.length <= 40,
      'routeName must be less than or equal to 40 characters',
    );
    return ScreenView._(routeName);
  }

  final String screenName;

  String get eventName => '${screenName}_page_viewed';

  @override
  Future<void> send() async {}
}
