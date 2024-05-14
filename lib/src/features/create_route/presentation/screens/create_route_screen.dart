import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:guider/src/core/router/app_router.dart';
import 'package:guider/src/features/create_route/presentation/providers/create_route_state_providers.dart';
import 'package:guider/src/features/create_route/presentation/widgets/create_route_widgets.dart';

class CreateRouteScreen extends ConsumerWidget {
  const CreateRouteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final marks = ref.watch(createRouteNotifierProvider).marksList;
    final checkedMarks =
        ref.watch(createRouteNotifierProvider).selectedMarksList;
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              IconButton(
                  onPressed: () => context.go(GuiderNavigationHelper.mapPath),
                  icon: const Icon(Icons.arrow_back)),
              const Gap(10),
              const Text('Введите данные маршрута')
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                CreateRouteTextField(
                  label: 'Название',
                  hintText: 'Название',
                  onChanged: (name) => ref
                      .read(createRouteNotifierProvider.notifier)
                      .updateName(name),
                ),
                const Gap(8),
                CreateRouteTextField(
                  label: 'Город',
                  hintText: 'Город',
                  onChanged: (city) => ref
                      .read(createRouteNotifierProvider.notifier)
                      .updateCity(city),
                ),
                const Gap(8),
                const Text('Выберите метки маршрута'),
                const Gap(8),
                ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: marks.length,
                    itemBuilder: (context, index) {
                      return CreateRouteMark(
                        name: marks[index].name,
                        addres: marks[index].addres,
                        isMarked: checkedMarks.contains(marks[index]),
                        onChanged: (checked) => ref
                            .read(createRouteNotifierProvider.notifier)
                            .updateMarks(marks[index]),
                      );
                    })
              ],
            ),
          ),
        ));
  }
}
