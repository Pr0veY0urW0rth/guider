import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:guider/src/core/router/app_router.dart';
import 'package:guider/src/features/routes_list/domain/routes_list_domain.dart';
import 'package:guider/src/features/routes_list/presentation/widgets/routes_list_widgets.dart';

class RoutesListScreen extends ConsumerWidget {
  const RoutesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const List<RouteEntity> routes = [
      RouteEntity(
          id: 0, name: 'Достопримечательности', cityName: 'Севастополь'),
      RouteEntity(id: 1, name: 'Памятники ВОВ', cityName: 'Симферополь'),
      RouteEntity(id: 2, name: 'Черноморские батареи', cityName: 'Севастополь'),
      RouteEntity(id: 3, name: 'По парку Нахимова', cityName: 'Севастополь'),
    ];
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () => context.go(GuiderNavigationHelper.mapPath),
                  icon: const Icon(Icons.arrow_back)),
              const Text('Маршруты'),
              IconButton(onPressed: () => null, icon: const Icon(Icons.search)),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: routes.length,
                itemBuilder: (context, index) {
                  return RouteTile(
                    name: routes[index].name,
                    cityName: routes[index].cityName,
                    onTap: () => context.go(GuiderNavigationHelper.mapPath),
                  );
                }),
          ),
        ));
  }
}
