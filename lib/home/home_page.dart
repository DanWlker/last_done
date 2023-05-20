import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:last_done/home/entity/home_page_display_mode_entity.dart';
import 'package:last_done/home/model/home_page_model.dart';
import 'package:last_done/home/widget/home_page_display_mode_button.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home'),
        centerTitle: true,
        actions: const [HomePageDisplayModeButton()],
      ),
      body: ref.watch(homePageDisplayModeProvider) ==
              HomePageDisplayModeEntity.list
          ? ReorderableListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: ref.watch(lastDoneItemListProvider).length,
              itemBuilder: (context, index) {
                return Container(
                  key: ValueKey('reorderable$index'),
                  child: Card(
                          child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child:
                        Text(ref.watch(lastDoneItemListProvider)[index].title),
                  ))
                      .animate()
                      .slide(
                        delay: Duration(milliseconds: index * 40),
                        duration: const Duration(milliseconds: 200),
                        begin: const Offset(0, 1),
                        end: const Offset(0, 0),
                        curve: Curves.easeOut,
                      )
                      .fadeIn(),
                );
              },
              onReorder: (int oldIndex, int newIndex) {},
            )
          : ReorderableGridView.builder(
              dragWidgetBuilderV2: DragWidgetBuilderV2(
                  isScreenshotDragWidget: true,
                  builder: (index, child, screenshot) {
                    return screenshot != null
                        ? Image(image: screenshot)
                        : const SizedBox.shrink();
                  }),
              physics: const BouncingScrollPhysics(),
              itemCount: ref.watch(lastDoneItemListProvider).length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return Container(
                  key: ValueKey('reorderable$index'),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child:
                        Text(ref.watch(lastDoneItemListProvider)[index].title),
                  )
                      .animate()
                      .scaleXY(
                        delay: Duration(milliseconds: index * 40),
                        begin: 0,
                        end: 1,
                        curve: Curves.easeOut,
                      )
                      .fadeIn(),
                );
              },
              onReorder: (int oldIndex, int newIndex) {},
            ),
    );
  }
}
