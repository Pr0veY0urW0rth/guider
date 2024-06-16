import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guider/src/core/supabase/supabase_injection.dart';
import 'package:guider/src/features/create_route/domain/create_route_domain.dart';
import 'package:guider/src/features/create_route/presentation/providers/state/create_route_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

  void initRoute() async {
    if (state.marksList.isEmpty) {
      final supabase = sl.get<Supabase>().client;
      final List<Map<String, dynamic>> data =
          await supabase.from('Mark').select().order('MarkID', ascending: true);
      final List<MarkEntity> marks = [];
      for (var element in data) {
        marks.add(MarkEntity.fromMap(element));
      }
      state = state.copyWith(marksList: marks);
    }
  }
}

final createRouteNotifierProvider =
    StateNotifierProvider<CreateRouteNotifier, CreateRouteState>((ref) {
  final notifier = CreateRouteNotifier();
  notifier.initRoute();
  return notifier;
});
