import 'package:flutter/material.dart';

class LastDoneItem {
  String id;
  String title;
  Color indicatorColor;

  LastDoneItem({
    required this.id,
    required this.title,
    this.indicatorColor = const Color.fromARGB(255, 191, 97, 110),
  });
}
