import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:last_done/home/entity/home_page_display_mode_entity.dart';
import 'package:last_done/home/model/home_page_display_mode_model.dart';
import 'package:last_done/home/model/last_done_item_list_model.dart';
import 'package:last_done/home/widget/home_page_display_mode_button.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:last_done/last_done_card/last_done_card_grid_variant.dart';
import 'package:last_done/last_done_card/last_done_card_list_variant.dart';
import 'package:last_done/theme/theme_change_button.dart';
import 'package:reorderable_grid/reorderable_grid.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        foregroundColor: Theme.of(context).textTheme.bodyMedium?.color,
        title: const Text('Home'),
        centerTitle: true,
        elevation: 0,
        leading: const ThemeChangeButton(),
        actions: const [HomePageDisplayModeButton()],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: ref.watch(homePageDisplayModeProvider) ==
                HomePageDisplayModeEntity.list
            ? ReorderableListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: ref.watch(lastDoneItemListProvider).length,
                proxyDecorator: (child, index, animation) {
                  return Container(
                    child: child.animate().scaleXY(end: 1.05).shake(
                          rotation: 0.03,
                          delay: const Duration(milliseconds: 300),
                        ),
                  );
                },
                itemBuilder: (context, index) {
                  return Container(
                    key: ValueKey('reorderable$index'),
                    child: LastDoneCardListVariant(
                      item: ref.watch(lastDoneItemListProvider)[index],
                    )
                        .animate(
                          delay: Duration(milliseconds: index * 40),
                        )
                        .slide(
                          duration: const Duration(milliseconds: 200),
                          begin: const Offset(0, 1),
                          end: const Offset(0, 0),
                          curve: Curves.easeOut,
                        )
                        .fadeIn(),
                  );
                },
                onReorder: (oldIndex, newIndex) {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }

                  ref
                      .read(lastDoneItemListProvider.notifier)
                      .onReorder(oldIndex, newIndex);
                },
              )
            : ReorderableGridView.builder(
                proxyDecorator: (child, index, animation) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: ref
                            .watch(lastDoneItemListProvider)[index]
                            .indicatorColor,
                        width: 2,
                      ),
                    ),
                    child: child,
                  ).animate().scaleXY(end: 1.1).shake(
                        rotation: 0.03,
                        delay: const Duration(milliseconds: 300),
                      );
                },
                physics: const BouncingScrollPhysics(),
                itemCount: ref.watch(lastDoneItemListProvider).length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    key: ValueKey('reorderable$index'),
                    child: LastDoneCardGridVariant(
                      item: ref.watch(lastDoneItemListProvider)[index],
                    )
                        .animate(
                          delay: Duration(milliseconds: index * 20),
                        )
                        .scaleXY(
                          begin: 0,
                          end: 1,
                          curve: Curves.easeOut,
                        )
                        .fadeIn(),
                  );
                },
                onReorder:
                    ref.read(lastDoneItemListProvider.notifier).onReorder,
              ),
      ),
    );
  }
}
