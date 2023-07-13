import 'package:expence_project/main.dart';
import 'package:expence_project/ui/app_scafold.dart';
import 'package:expence_project/ui/screens/dashboard/dashboard_screen.dart';
import 'package:expence_project/ui/screens/home/home_screens.dart';
import 'package:expence_project/ui/screens/login_screen/login_screen.dart';
import 'package:expence_project/ui/screens/page1%20copy%202.dart';
import 'package:expence_project/ui/screens/page1%20copy.dart';
import 'package:expence_project/ui/screens/record_keeping/record_keeping_screens.dart';
import 'package:expence_project/ui/screens/transaction/page1.dart';
import 'package:expence_project/ui/screens/register_screen/register_screen.dart';
import 'package:expence_project/ui/screens/verification_screens/verifications_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'commons_libs.dart';
import 'logic/auth/authentication_bloc.dart';

class ScreenPaths {
  static String splash = '/';
  static String intro = '/welcome';
  static String login = '/login';
  static String register = '/register';
  static String verification = '/verification';
  static String home = '/home';
  static String dashboard = '/dashboard';
  static String record = '/record';
}

final appRoute = GoRouter(redirect: _handleRedirect, routes: [
  ShellRoute(
      builder: (context, state, child) {
        return AppScaffold(child: child);
      },
      routes: [
        AppRoute(
            ScreenPaths.splash,
            (s) => Container(
                  color: $styles.colors.greyStrong,
                )),
        AppRoute(
          ScreenPaths.login,
          (s) => const LoginScreens(),
        ),
        AppRoute(ScreenPaths.home, (s) => const HomeScreens()),
        AppRoute(ScreenPaths.register, (s) => const RegisterScreen()),
        AppRoute(ScreenPaths.dashboard, (s) => DashboardScreen()),
        AppRoute(
            ScreenPaths.record,
            (s) => RecordKeppingScreen(
                  title: s.extra.toString(),
                )),
        AppRoute('/page0', (s) => Page1()),
        AppRoute('/page1', (s) => const Page2()),
        AppRoute('/page2', (s) => const Page3()),
      ])
]);

/// Custom GoRoute sub-class to make the router declaration easier to read
class AppRoute extends GoRoute {
  AppRoute(String path, Widget Function(GoRouterState s) builder,
      {List<GoRoute> routes = const [], this.useFade = false})
      : super(
          path: path,
          routes: routes,
          pageBuilder: (context, state) {
            final pageContent = Scaffold(
              body: builder(state),
              resizeToAvoidBottomInset: false,
            );
            if (useFade) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: pageContent,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            }
            return MaterialPage(child: pageContent);
          },
        );

  final bool useFade;
}

String? _handleRedirect(BuildContext context, GoRouterState state) {
  // Prevent anyone from navigating away from `/` if app is starting up.
  if (!appLogic.isBootstrapComplete && state.location != ScreenPaths.splash) {
    return ScreenPaths.splash;
  }
  debugPrint('Navigate to: ${state.location}');
  return null; // do nothing
}
