// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:guider/src/features/create_route/domain/create_route_domain.dart';

class CreateRouteState extends Equatable {
  const CreateRouteState(
      {this.selectedMarksList = const [],
      this.marksList = const [],
      this.name = '',
      this.city = '',
      this.marksCount = 0});

  final String city;
  final int marksCount;
  final String name;
  final List<MarkEntity> selectedMarksList;
  final List<MarkEntity> marksList;

  @override
  List<Object> get props =>
      [selectedMarksList, marksList, name, city, marksCount];

  @override
  bool get stringify => true;

  CreateRouteState copyWith({
    List<MarkEntity>? selectedMarksList,
    List<MarkEntity>? marksList,
    String? name,
    String? city,
    int? marksCount,
  }) {
    return CreateRouteState(
      selectedMarksList: selectedMarksList ?? this.selectedMarksList,
      marksList: marksList ?? this.marksList,
      name: name ?? this.name,
      city: city ?? this.city,
      marksCount: marksCount ?? this.marksCount,
    );
  }
}
