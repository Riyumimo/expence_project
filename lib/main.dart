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
            create: (context) =>
                AccountBloc(storage)..add(const AccountEvent.started()),
          ),
          BlocProvider(
            create: (context) =>
                UserBloc(storage)..add(const UserEvent.started()),
          ),
          BlocProvider(
            create: (context) => TransactionBloc(storage)
              ..add(const TransactionBlocEvent.getAll()),
          ),
        ],
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            print(state);
            state.map(
                intial: (intial) {},
                authenticated: (value) async {
                  bool? getAccount;
                  await SharedPreferences.getInstance().then((value) {
                    final data = value.getBool('account');
                    getAccount = data;
                  });
                  print(' getAccount $getAccount');
                  getAccount ?? appRoute.go(ScreenPaths.dashboard);
                  getAccount!
                      ? appRoute.go(ScreenPaths.dashboard)
                      : appRoute.go(ScreenPaths.preAddAccount);
                },
                loaded: (loaded) {},
                unauthenticated: (unauthenticated) {
                  appRoute.go(ScreenPaths.login);
                },
                error: (value) {});
          },
          child: BlocListener<AccountBloc, AccountState>(
            listener: (context, state) {
              print(state);
              state.map(
                  initial: (initial) {},
                  loading: (loading) {},
                  loaded: (loaded) {
                    if (loaded.listAccount.isEmpty) {
                      print('Empity Data');
                      appRoute.go(ScreenPaths.preAddAccount);
                    }
                  },
                  error: (error) {});
            },
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
        ));
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
