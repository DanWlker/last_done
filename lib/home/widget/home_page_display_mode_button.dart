import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:last_done/home/entity/home_page_display_mode_entity.dart';
import 'package:last_done/home/model/home_page_display_mode_model.dart';

class HomePageDisplayModeButton extends ConsumerStatefulWidget {
  const HomePageDisplayModeButton({
    super.key,
  });

  @override
  ConsumerState<HomePageDisplayModeButton> createState() =>
      _HomePageDisplayModeButtonState();
}

class _HomePageDisplayModeButtonState
    extends ConsumerState<HomePageDisplayModeButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return IconButton(
      onPressed: () {
        switch (ref.read(homePageDisplayModeProvider)
            as HomePageDisplayModeEntity) {
          case HomePageDisplayModeEntity.grid:
            controller.reverse();
            ref
                .read(homePageDisplayModeProvider.notifier)
                .changeDisplayMode(HomePageDisplayModeEntity.list);
          case HomePageDisplayModeEntity.list:
            controller.forward();
            ref
                .read(homePageDisplayModeProvider.notifier)
                .changeDisplayMode(HomePageDisplayModeEntity.grid);
        }
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.list_view,
        progress: animation,
      ),
    );
  }
}
