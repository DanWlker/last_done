import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:last_done/last_done_card/entity/last_done_item.dart';

class LastDoneCardGridVariant extends ConsumerWidget {
  final LastDoneItem item;
  final Widget Function(BuildContext, void Function({Object? returnValue}))
      openBuilder;
  final Color? openColor;
  final Color? closeColor;

  const LastDoneCardGridVariant({
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
      openColor: Theme.of(context).cardColor,
      closedColor: Theme.of(context).cardColor,
      transitionType: ContainerTransitionType.fade,
      openBuilder: openBuilder,
      closedBuilder: (context, action) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: item.indicatorColor,
                ),
              ),
              Text(
                item.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        );
      },
    );
  }
}
