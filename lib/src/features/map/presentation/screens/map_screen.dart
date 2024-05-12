import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yandex_maps_mapkit/mapkit.dart';
import 'package:yandex_maps_mapkit/mapkit_factory.dart';
import 'package:yandex_maps_mapkit/yandex_map.dart';

class MapScreen extends ConsumerWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MapWindow? _mapWindow;
    return Scaffold(
        appBar: AppBar(title: const Text('Карта')),
        body: YandexMap(onMapCreated: (mapWindow) {
          _mapWindow = mapWindow;
          WidgetsFlutterBinding.ensureInitialized();
          mapkit.onStart();
        }));
  }
}
