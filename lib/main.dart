import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:last_done/home/home_page.dart';
import 'package:last_done/theme/model/theme_model.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Last Done',
      theme: ThemeData(
        brightness: ref.watch(themeBrightnessProvider),
      ),
      home: const HomePage(),
    );
  }
}
