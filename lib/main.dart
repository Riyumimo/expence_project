import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:expence_project/data/firebase_service/storage_repository.dart';
import 'package:expence_project/logic/app_logic.dart';
import 'package:expence_project/data/firebase_service/auth_repository.dart';
import 'package:expence_project/router.dart';
import 'package:expence_project/styles/styles.dart';
import 'package:expence_project/ui/app_scafold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';

import 'commons_libs.dart';
import 'firebase_options.dart';
import 'logic/account_bloc/account_bloc.dart';
import 'logic/auth_bloc/authentication_bloc.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationBloc(
            repo,
            connectivity,
          )..add(AuthenticationEvent.getSignIn(repo.firebaseAuth)),
        ),
        BlocProvider(
          create: (context) => AccountBloc()..add(const AccountEvent.started()),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              print(state);
              state.map(
                  intial: (intial) {},
                  authenticated: (value) {},
                  loaded: (loaded) {},
                  unauthenticated: (unauthenticated) {
                    appRoute.go(ScreenPaths.login);
                  },
                  error: (value) {});
            },
          ),
          BlocListener<AccountBloc, AccountState>(
            listener: (context, state) {
              print(state);
              state.map(
                  initial: (initial) {},
                  loading: (loading) {},
                  loaded: (loaded) {
                    if (loaded.listAccount.isEmpty) {
                      print('Empity Data');
                      appRoute.go(ScreenPaths.home);
                    } else {
                      appRoute.go(ScreenPaths.dashboard);
                    }
                  },
                  error: (error) {});
            },
          )
        ],
        child: MaterialApp.router(
          routeInformationProvider: appRoute.routeInformationProvider,
          routeInformationParser: appRoute.routeInformationParser,
          // showSemanticsDebugger: true,
          debugShowCheckedModeBanner: false,
          routerDelegate: appRoute.routerDelegate,
          theme: ThemeData(
            // fontFamily: //.text.body.fontFamily,
            useMaterial3: true,
          ),
        ),
      ),
    );
  }
}

void registerSingletons() {
  // Top level app controller
  GetIt.I.registerLazySingleton<AppLogic>(() => AppLogic());
  GetIt.I.registerLazySingleton<Connectivity>(() => Connectivity());
  GetIt.I.registerLazySingleton<FirebaseAuthenticationRepository>(
      () => FirebaseAuthenticationRepository());
  GetIt.I.registerLazySingleton<FirebaseStorageRepository>(() =>
      FirebaseStorageRepository(
          FirebaseFirestore.instance, FirebaseAuth.instance));
}

/// Add syntax sugar for quickly accessing the main "logic" controllers in the app
/// We deliberately do not create shortcuts for services, to discourage their use directly in the view/widget layer.
AppLogic get appLogic => GetIt.I.get<AppLogic>();
Connectivity get connectivity => GetIt.I.get<Connectivity>();
FirebaseAuthenticationRepository get repo =>
    GetIt.I.get<FirebaseAuthenticationRepository>();
FirebaseStorageRepository get storage =>
    GetIt.I.get<FirebaseStorageRepository>();
AppStyle get $styles => AppScaffold.style;
