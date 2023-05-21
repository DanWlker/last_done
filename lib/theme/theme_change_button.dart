import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:last_done/theme/model/theme_model.dart';

class ThemeChangeButton extends ConsumerWidget {
  const ThemeChangeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        ref.read(themeBrightnessProvider.notifier).switchTheme();
      },
      icon: Icon(
        Theme.of(context).brightness == Brightness.dark
            ? Icons.brightness_2
            : Icons.wb_sunny,
      ),
    );
  }
}
