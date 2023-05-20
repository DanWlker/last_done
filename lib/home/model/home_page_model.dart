import 'package:last_done/home/entity/home_page_display_mode_entity.dart';
import 'package:last_done/home/entity/last_done_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_page_model.g.dart';

@riverpod
class LastDoneItemList extends _$LastDoneItemList {
  @override
  List<LastDoneItem> build() {
    return [
      LastDoneItem(id: '001', title: "Wash Clothes"),
      LastDoneItem(id: '001', title: "Find Man Yi for lunch"),
      LastDoneItem(id: '001', title: "Play games"),
      LastDoneItem(id: '001', title: "Sleep"),
      LastDoneItem(id: '001', title: "Dream"),
      LastDoneItem(id: '001', title: "Consider the existence of cheese"),
      LastDoneItem(id: '001', title: "Debug Code"),
      LastDoneItem(id: '001', title: "Debug More Code"),
      LastDoneItem(id: '001', title: "Debug More Code I guess"),
    ];
  }

  void onReorder(int oldIndex, int newIndex) {
    print("oldIndex: $oldIndex, newIndex: $newIndex");

    final itemInQuestion = state.removeAt(oldIndex);
    state.insert(newIndex, itemInQuestion);
  }
}

@riverpod
class HomePageDisplayMode extends _$HomePageDisplayMode {
  @override
  build() {
    return HomePageDisplayModeEntity.list;
  }

  void changeDisplayMode(HomePageDisplayModeEntity homePageDisplayModeEntity) {
    state = homePageDisplayModeEntity;
  }
}
