import 'package:analytics_repository/analytics_repository.dart';

class AnalyticsRepository {
  const AnalyticsRepository();

  Future<void> send(AnalyticsEvent event) async {
    await event.send();
  }
}
