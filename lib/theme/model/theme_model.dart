import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_model.g.dart';

@riverpod
class ThemeBrightness extends _$ThemeBrightness {
  @override
  Brightness build() {
    return Brightness.dark;
  }

  switchTheme() {
    state = state == Brightness.light ? Brightness.dark : Brightness.light;
  }
}
