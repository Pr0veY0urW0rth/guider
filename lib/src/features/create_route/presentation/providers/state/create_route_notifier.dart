import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guider/src/features/create_route/domain/create_route_domain.dart';
import 'package:guider/src/features/create_route/presentation/providers/state/create_route_state.dart';

class CreateRouteNotifier extends StateNotifier<CreateRouteState> {
  CreateRouteNotifier() : super(const CreateRouteState());

  void updateMarks(MarkEntity mark) {
    List<MarkEntity> newList = [];
    if (state.selectedMarksList.contains(mark)) {
      List<MarkEntity> newList = [];
      newList.addAll(
          state.selectedMarksList.where((element) => element.id != mark.id));
      state = state.copyWith(
          selectedMarksList: newList, marksCount: newList.length);
    } else {
      newList.addAll(state.selectedMarksList);
      newList.add(mark);
      state = state.copyWith(
          selectedMarksList: newList, marksCount: newList.length);
    }
  }

  void updateName(String name) {
    state = state.copyWith(name: name);
  }

  void updateCity(String city) {
    state = state.copyWith(city: city);
  }

  void initRoute() {
    const List<MarkEntity> initMarks = [
      MarkEntity(
          id: 0,
          latitude: 0,
          longitude: 0,
          addres: 'Ул пушкина 1',
          name: 'Памятник пушкина 1',
          shortDescription: 'Памятник пушкина 2',
          description: 'Памятник пушкина 2'),
      MarkEntity(
          id: 1,
          latitude: 0,
          longitude: 0,
          addres: 'Ул пушкина 2',
          name: 'Памятник пушкина 2',
          shortDescription: 'Памятник пушкина 2',
          description: 'Памятник пушкина '),
      MarkEntity(
          id: 2,
          latitude: 0,
          longitude: 0,
          addres: 'Ул пушкина 3',
          name: 'Памятник пушкина 3',
          shortDescription: 'Памятник пушкина 3',
          description: 'Памятник пушкина 3'),
      MarkEntity(
          id: 3,
          latitude: 0,
          longitude: 0,
          addres: 'Ул пушкина 4',
          name: 'Памятник пушкина 4',
          shortDescription: 'Памятник пушкина 4',
          description: 'Памятник пушкина 4'),
    ];
    state = state.copyWith(marksList: initMarks);
  }
}

final createRouteNotifierProvider =
    StateNotifierProvider<CreateRouteNotifier, CreateRouteState>((ref) {
  final notifier = CreateRouteNotifier();
  notifier.initRoute();
  return notifier;
});
