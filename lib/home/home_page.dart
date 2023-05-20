import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:last_done/home/entity/home_page_display_mode_entity.dart';
import 'package:last_done/home/model/home_page_model.dart';
import 'package:last_done/home/widget/home_page_display_mode_button.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          HomePageDisplayModeButton(
            extraOnPressed: () {
              Navigator.of(context)
                  .pushReplacement(_createRoute(const HomePage()));
            },
          )
        ],
      ),
      body: ref.read(homePageDisplayModeProvider) ==
              HomePageDisplayModeEntity
                  .list //!* using ref.watch here will affect the navigation push replacement animation, so we have to use ref.read
          ? ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: ref.watch(lastDoneItemListProvider).length,
              itemBuilder: (context, index) {
                return Hero(
                  tag: index,
                  child: Card(
                    child:
                        Text(ref.watch(lastDoneItemListProvider)[index].title),
                  ),
                );
              },
            )
          : GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: ref.watch(lastDoneItemListProvider).length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Hero(
                  tag: index,
                  child: Card(
                    child:
                        Text(ref.watch(lastDoneItemListProvider)[index].title),
                  ),
                );
              },
            ),
    );
  }
}

// Credits:
// https://stackoverflow.com/questions/60370915/animation-when-switch-grid-view-to-list-view-flutter
// https://dartpad.dev/05785dfd91a02e55d68a6cd086dcbf0b
//
// Note will refactor to use Hero transition in the same page once flutter fixes it
// See: https://github.com/flutter/flutter/issues/54200
Route _createRoute(Widget destination) {
  return PageRouteBuilder(
    pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) =>
        destination,
    transitionDuration: const Duration(milliseconds: 300),
    reverseTransitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      return FadeTransition(
        opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutCirc,
            reverseCurve: Curves.easeOutCirc.flipped),
        child: child,
      );
    },
  );
}

class CustomRectTween extends MaterialRectCenterArcTween {
  CustomRectTween({required this.a, required this.b}) : super(begin: a, end: b);
  final Rect a, b;

  @override
  Rect lerp(double t) {
    final double myCurve = Curves.easeOutCirc.transform(t);

    return Rect.fromLTRB(
      lerpDouble(a.left, b.left, myCurve),
      lerpDouble(a.top, b.top, myCurve),
      lerpDouble(a.right, b.right, myCurve),
      lerpDouble(a.bottom, b.bottom, myCurve),
    );
  }

  double lerpDouble(num a, num b, double t) {
    return a + (b - a) * t;
  }
}
