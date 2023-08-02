import 'package:expence_project/ui/screens/account_screen/account_screen.dart';
import 'package:expence_project/ui/screens/account_screen/add_account_screen.dart';
import 'package:expence_project/ui/screens/account_screen/pre_add_account.dart';
import 'package:expence_project/ui/screens/dashboard/dashboard_screen.dart';
import 'package:expence_project/ui/screens/detail_screen/detail_screen.dart';
import 'package:expence_project/ui/screens/home/home_screens.dart';
import 'package:expence_project/ui/screens/login_screen/login_screen.dart';
import 'package:expence_project/ui/screens/page1%20copy%202.dart';
import 'package:expence_project/ui/screens/page1%20copy.dart';
import 'package:expence_project/ui/screens/profile/profile_screen.dart';
import 'package:expence_project/ui/screens/record_keeping_screen/camera_screen.dart';
import 'package:expence_project/ui/screens/record_keeping_screen/record_keeping_screens.dart';
import 'package:expence_project/ui/screens/transaction_screen/status_screen.dart';
import 'package:expence_project/ui/screens/transaction_screen/transaction_screen.dart';
import 'package:expence_project/ui/screens/register_screen/register_screen.dart';
import 'package:expence_project/ui/screens/verification_screens/verifications_screen.dart';
import 'package:go_router/go_router.dart';
import 'commons_libs.dart';

class ScreenPaths {
  static String splash = '/';
  static String intro = '/welcome';
  static String login = '/login';
  static String register = '/register';
  static String verification = '/verification';
  static String home = '/home';
  static String dashboard = '/dashboard';
  static String record = '/record';
  static String camera = '/camera';
  static String status = '/status';
  static String account = '/account';
  static String addAccount = '/addAccount';
  static String preAddAccount = '/preaddAccount';
  static String transaction = '/transactions';
  static String detail = '/detail';
  static String profile = '/profile';
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
        AppRoute(ScreenPaths.verification, (s) => const VerificationScreen()),
        AppRoute(ScreenPaths.dashboard, (s) => const DashboardScreen()),
        AppRoute(ScreenPaths.camera, (s) => const CameraScreen()),
        AppRoute(ScreenPaths.preAddAccount, (s) => const PreAddAccountScreen()),
        AppRoute(
            ScreenPaths.addAccount,
            (s) => AddAccountScreens(
                  title: s.extra.toString(),
                )),
        AppRoute(ScreenPaths.account, (s) => const AccountScreen()),
        AppRoute(ScreenPaths.profile, (s) => const ProfileScreens()),
        AppRoute(
            ScreenPaths.record,
            (s) => RecordKeppingScreen(
                  title: s.extra.toString(),
                )),
        AppRoute(ScreenPaths.transaction, (s) => const TransactionScreen()),
        AppRoute(ScreenPaths.status, (s) => const FinancialStatusScreen()),
        AppRoute(
            ScreenPaths.detail,
            (s) => DetailScreen(
                  title: s.extra.toString(),
                )),
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
