import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:expence_project/main.dart';
import 'package:expence_project/router.dart';

import '../commons_libs.dart';
import '../styles/styles.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({Key? key, required this.child}) : super(key: key);
  final Widget child;
  static AppStyle get style => _style;
  static AppStyle _style = AppStyle();

  @override
  Widget build(BuildContext context) {
    // Listen to the device size, and update AppStyle when it changes
    MediaQuery.of(context);
    // Set default timing for animations in the app
    Animate.defaultDuration = _style.times.fast;
    // Create a style object that will be passed down the widget tree
    _style = AppStyle(screenSize: context.sizePx);
    return KeyedSubtree(
      key: ValueKey($styles.scale),
      child: Theme(
        data: $styles.colors.toThemeData(),
        // Provide a default texts style to allow Hero's to render text properly
        child: DefaultTextStyle(
          style: $styles.text.body,
          // Use a custom scroll behavior across entire app
          child: ScrollConfiguration(
              behavior: const ScrollBehavior(), child: child),
        ),
      ),
    );
  }
}

// List screenChange(int i) {
//   appRoute.go('/page1');
// }
