import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_home_page_model.g.dart';

@riverpod
class Counter extends _$Counter {
  @override
  int build() => 0;

  void increment() => state++;
}

@riverpod
bool shouldShowHelloWorldText(ShouldShowHelloWorldTextRef ref) {
  return ref.watch(counterProvider) % 2 == 0;
}

@riverpod
Future<int> networkApiToGetAnswerToEverything(
    NetworkApiToGetAnswerToEverythingRef ref) async {
  await Future.delayed(const Duration(seconds: 3));
  return 42;
}
