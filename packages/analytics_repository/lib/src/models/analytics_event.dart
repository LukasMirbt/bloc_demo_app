import 'package:equatable/equatable.dart';

abstract class AnalyticsEvent extends Equatable {
  const AnalyticsEvent();

  Future<void> send();

  @override
  List<Object?> get props => [];
}
