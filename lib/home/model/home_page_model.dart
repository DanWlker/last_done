import 'package:last_done/home/entity/home_page_display_mode_entity.dart';
import 'package:last_done/home/entity/last_done_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_page_model.g.dart';

@riverpod
List<LastDoneItem> lastDoneItemList(LastDoneItemListRef ref) {
  return [
    LastDoneItem(id: '001', title: "Wash Clothes"),
    LastDoneItem(id: '001', title: "Find Man Yi for lunch"),
    LastDoneItem(id: '001', title: "Wash Clothes"),
    LastDoneItem(id: '001', title: "Find Man Yi for lunch"),
    LastDoneItem(id: '001', title: "Wash Clothes"),
    LastDoneItem(id: '001', title: "Find Man Yi for lunch"),
    LastDoneItem(id: '001', title: "Wash Clothes"),
    LastDoneItem(id: '001', title: "Find Man Yi for lunch"),
    LastDoneItem(id: '001', title: "Wash Clothes"),
    LastDoneItem(id: '001', title: "Find Man Yi for lunch"),
    LastDoneItem(id: '001', title: "Wash Clothes"),
    LastDoneItem(id: '001', title: "Find Man Yi for lunch"),
  ];
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
