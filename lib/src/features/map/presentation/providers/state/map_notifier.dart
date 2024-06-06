import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guider/src/features/map/presentation/providers/state/map_state.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapNotifier extends StateNotifier<MapState> {
  MapNotifier() : super(const MapState());

  void addRequestPoints(List<RequestPoint> list) {
    state = state.copyWith(requestPointsList: list);
  }

  Future<void> requestRoutes() async {
    final result = await YandexPedestrian.requestRoutes(
        points: state.requestPointsList, timeOptions: const TimeOptions());
    state = state.copyWith(session: result.$1);
    final sessionResult = await result.$2;
    final List<PedestrianSessionResult>? newResults = [
      ...state.results,
      sessionResult
    ];
    state = state.copyWith(results: newResults);
    final List<MapObject> newMapObjects = [...state.mapObjects];
    if (sessionResult.routes != null) {
      sessionResult.routes!.asMap().forEach((i, route) {
        newMapObjects.add(PolylineMapObject(
          mapId: MapObjectId('route_${i}_polyline'),
          polyline: route.geometry,
          strokeColor: Colors.redAccent,
          strokeWidth: 3,
        ));
      });
      state =
          state.copyWith(mapObjects: newMapObjects, status: MapStatus.success);
      state.mapObjects.forEach((e) => print('e is $e'));
    }
  }

  void initTest() {
    state = state.copyWith(mapObjects: [], status: MapStatus.loading);
    final PlacemarkMapObject startPlacemark = PlacemarkMapObject(
      mapId: const MapObjectId('start_placemark'),
      point: const Point(latitude: 44.604545, longitude: 33.547978),
      icon: PlacemarkIcon.single(PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage(
              'assets/images/route_start.png'))),
    );
    final PlacemarkMapObject stopByPlacemark = PlacemarkMapObject(
      mapId: const MapObjectId('stop_by_placemark'),
      point: const Point(latitude: 44.616794, longitude: 33.510526),
      icon: PlacemarkIcon.single(PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage(
              'assets/images/route_stop_by.png'))),
    );
    final PlacemarkMapObject endPlacemark = PlacemarkMapObject(
      mapId: const MapObjectId('end_placemark'),
      point: const Point(latitude: 44.601535, longitude: 33.461924),
      icon: PlacemarkIcon.single(PlacemarkIconStyle(
          image:
              BitmapDescriptor.fromAssetImage('assets/images/route_end.png'))),
    );

    final points = [
      RequestPoint(
          point: startPlacemark.point,
          requestPointType: RequestPointType.wayPoint),
      RequestPoint(
          point: stopByPlacemark.point,
          requestPointType: RequestPointType.viaPoint),
      RequestPoint(
          point: endPlacemark.point,
          requestPointType: RequestPointType.wayPoint),
    ];

    state = state.copyWith(
        startPoint: startPlacemark,
        finalPoint: endPlacemark,
        requestPointsList: points,
        mapObjects: [startPlacemark, stopByPlacemark, endPlacemark]);
  }
}

final mapNotifierProvider =
    StateNotifierProvider<MapNotifier, MapState>((ref) => MapNotifier());
