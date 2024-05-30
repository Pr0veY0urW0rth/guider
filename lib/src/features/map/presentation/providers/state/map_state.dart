// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

enum MapStatus { initial, loading, success, failure }

class MapState extends Equatable {
  const MapState({
    this.session,
    this.mapObjects = const [],
    this.results = const [],
    this.requestPointsList = const [],
    this.status = MapStatus.initial,
    this.startPoint,
    this.finalPoint,
  });

  final List<MapObject> mapObjects;
  final List<PedestrianSessionResult> results;
  final List<RequestPoint> requestPointsList;
  final PedestrianSession? session;
  final MapStatus status;
  final PlacemarkMapObject? startPoint;
  final PlacemarkMapObject? finalPoint;

  @override
  bool get stringify => true;

  MapState copyWith({
    List<MapObject>? mapObjects,
    List<PedestrianSessionResult>? results,
    List<RequestPoint>? requestPointsList,
    PedestrianSession? session,
    MapStatus? status,
    PlacemarkMapObject? startPoint,
    PlacemarkMapObject? finalPoint,
  }) {
    return MapState(
      mapObjects: mapObjects ?? this.mapObjects,
      results: results ?? this.results,
      requestPointsList: requestPointsList ?? this.requestPointsList,
      session: session ?? this.session,
      status: status ?? this.status,
      startPoint: startPoint ?? this.startPoint,
      finalPoint: finalPoint ?? this.finalPoint,
    );
  }

  @override
  List<Object?> get props =>
      [mapObjects, results, requestPointsList, session, status];
}
