import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:last_done/last_done_card/entity/last_done_item.dart';

class LastDoneCardListVariant extends ConsumerWidget {
  final LastDoneItem item;
  final VoidCallback? onTap;

  const LastDoneCardListVariant({
    super.key,
    required this.item,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {},
        child: Padding(
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
      ),
    );
  }
}
