import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:last_done/home/entity/home_page_display_mode_entity.dart';
import 'package:last_done/home/model/home_page_display_mode_model.dart';

class HomePageDisplayModeButton extends ConsumerWidget {
  const HomePageDisplayModeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        switch (ref.read(homePageDisplayModeProvider)
            as HomePageDisplayModeEntity) {
          case HomePageDisplayModeEntity.grid:
            ref
                .read(homePageDisplayModeProvider.notifier)
                .changeDisplayMode(HomePageDisplayModeEntity.list);
          case HomePageDisplayModeEntity.list:
            ref
                .read(homePageDisplayModeProvider.notifier)
                .changeDisplayMode(HomePageDisplayModeEntity.grid);
        }
      },
      icon: Icon(
        ref.watch(homePageDisplayModeProvider) == HomePageDisplayModeEntity.list
            ? Icons.splitscreen_rounded
            : Icons.grid_view_rounded,
      ),
    );
  }
}
