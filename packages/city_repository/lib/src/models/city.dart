import 'package:equatable/equatable.dart';

enum Area {
  usa,
  sweden,
  australia,
}

class City extends Equatable {
  const City({
    required this.name,
    required this.area,
  });

  final String name;
  final Area area;

  @override
  List<Object> get props => [name, area];
}
