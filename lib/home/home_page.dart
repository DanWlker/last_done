import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:last_done/home/entity/home_page_display_mode_entity.dart';
import 'package:last_done/home/model/home_page_display_mode_model.dart';
import 'package:last_done/home/model/last_done_item_list_model.dart';
import 'package:last_done/home/widget/home_page_display_mode_button.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:reorderable_grid/reorderable_grid.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home'),
        centerTitle: true,
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
                  return child.animate().scaleXY(end: 1.1);
                },
                itemBuilder: (context, index) {
                  return Container(
                    key: ValueKey('reorderable$index'),
                    child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(ref
                                    .watch(lastDoneItemListProvider)[index]
                                    .title),
                              ),
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
                  return child.animate().scaleXY(end: 1.1);
                },
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
                      child: Text(
                          ref.watch(lastDoneItemListProvider)[index].title),
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
                onReorder:
                    ref.read(lastDoneItemListProvider.notifier).onReorder,
              ),
      ),
    );
  }
}
