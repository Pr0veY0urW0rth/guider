import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:guider/src/core/router/app_router.dart';
import 'package:guider/src/features/map/presentation/providers/map_state_providers.dart';
import 'package:guider/src/features/map/presentation/widgets/map_widgets.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends ConsumerWidget {
  MapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapObjects = ref.watch(mapNotifierProvider).mapObjects;
    final startPoint = ref.watch(mapNotifierProvider).startPoint;
    final finalPoint = ref.watch(mapNotifierProvider).finalPoint;

    SchedulerBinding.instance.addPostFrameCallback((_) {
      // Some provider code that gets/sets some state
      ref.read(mapNotifierProvider.notifier).initTest();
      ref.read(mapNotifierProvider.notifier).requestRoutes();
    });
    return Scaffold(
      appBar: AppBar(title: const Text('Карта')),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.95,
            child: YandexMap(
              mapObjects: mapObjects,
              onMapCreated: (YandexMapController yandexMapController) async {
                if (startPoint != null && finalPoint != null) {
                  final geometry = Geometry.fromBoundingBox(BoundingBox(
                      northEast: startPoint.point,
                      southWest: finalPoint.point));

                  await yandexMapController
                      .moveCamera(CameraUpdate.newGeometry(geometry));
                }
                await yandexMapController.moveCamera(CameraUpdate.zoomOut());
              },
            ),
          ),
          Expanded(
            child: Align(
              alignment: const AlignmentDirectional(0, 1),
              child: Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MapButton(
                      'Все маршруты',
                      onPressed: () =>
                          context.go(GuiderNavigationHelper.routesListPath),
                    ),
                    Gap(MediaQuery.of(context).size.width * 0.05),
                    MapButton(
                      'Создать маршрут',
                      onPressed: () =>
                          context.go(GuiderNavigationHelper.createRoutePath),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
