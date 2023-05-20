import 'package:last_done/home/entity/home_page_display_mode_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_page_display_mode_model.g.dart';

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
