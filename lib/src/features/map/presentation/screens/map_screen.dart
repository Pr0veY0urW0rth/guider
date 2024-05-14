import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:guider/src/core/router/app_router.dart';
import 'package:yandex_maps_mapkit/mapkit.dart';
import 'package:yandex_maps_mapkit/mapkit_factory.dart';
import 'package:yandex_maps_mapkit/yandex_map.dart';
import 'package:guider/src/features/map/presentation/widgets/map_widgets.dart';

class MapScreen extends ConsumerWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MapWindow? _mapWindow;
    return Scaffold(
        appBar: AppBar(title: const Text('Карта')),
        body: Column(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.98,
            child: YandexMap(onMapCreated: (mapWindow) {
              _mapWindow = mapWindow;
              WidgetsFlutterBinding.ensureInitialized();
              mapkit.onStart();
              _mapWindow?.map.move(const CameraPosition(
                  Point(
                      latitude: 44.61581504084073,
                      longitude: 33.52426368749462),
                  zoom: 17.0,
                  azimuth: 90.0,
                  tilt: 30.0));
            }),
          ),
          Expanded(
              child: Align(
            alignment: const AlignmentDirectional(0, 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MapButton(
                  'Все маршруты',
                  onPressed: () => null,
                ),
                const Gap(20),
                MapButton(
                  'Создать маршрут',
                  onPressed: () =>
                      context.go(GuiderNavigationHelper.createRoutePath),
                ),
              ],
            ),
          ))
        ]));
  }
}
