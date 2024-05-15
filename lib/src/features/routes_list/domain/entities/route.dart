import 'package:equatable/equatable.dart';

class RouteEntity extends Equatable {
  final int id;
  final String name;
  final String cityName;
  const RouteEntity({
    required this.id,
    required this.name,
    required this.cityName,
  });

  RouteEntity copyWith({
    int? id,
    String? name,
    String? cityName,
  }) {
    return RouteEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      cityName: cityName ?? this.cityName,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, name, cityName];
}
