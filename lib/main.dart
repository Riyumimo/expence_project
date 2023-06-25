import 'package:expence_project/logic/app_logic.dart';
import 'package:expence_project/router.dart';
import 'package:expence_project/styles/styles.dart';
import 'package:expence_project/ui/app_scafold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';

import 'commons_libs.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //start app
  registerSingletons();
  runApp(MyApp());
  await appLogic.bootstrap();

  //remove splash
  return FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget with GetItMixin {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: appRoute.routeInformationProvider,
      routeInformationParser: appRoute.routeInformationParser,
      // showSemanticsDebugger: true,
      debugShowCheckedModeBanner: false,
      routerDelegate: appRoute.routerDelegate,
      theme: ThemeData(
        fontFamily: $styles.text.body.fontFamily,
        useMaterial3: true,
      ),
    );
  }
}

void registerSingletons() {
  // Top level app controller
  GetIt.I.registerLazySingleton<AppLogic>(() => AppLogic());
}

/// Add syntax sugar for quickly accessing the main "logic" controllers in the app
/// We deliberately do not create shortcuts for services, to discourage their use directly in the view/widget layer.
AppLogic get appLogic => GetIt.I.get<AppLogic>();

AppStyle get $styles => AppScaffold.style;
