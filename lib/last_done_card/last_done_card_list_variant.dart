import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:last_done/last_done_card/entity/last_done_item.dart';

class LastDoneCardListVariant extends ConsumerWidget {
  final LastDoneItem item;
  final Widget Function(BuildContext, void Function({Object? returnValue}))
      openBuilder;
  final Color? openColor;
  final Color? closeColor;

  const LastDoneCardListVariant({
    super.key,
    required this.item,
    required this.openBuilder,
    this.openColor,
    this.closeColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OpenContainer(
      closedShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      openShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      openColor: openColor ?? Theme.of(context).cardColor,
      closedColor: closeColor ?? Theme.of(context).cardColor,
      transitionType: ContainerTransitionType.fade,
      openBuilder: openBuilder,
      closedBuilder: (context, action) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: item.indicatorColor,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              item.title,
            ),
          ],
        ),
      ),
    );
  }
}
