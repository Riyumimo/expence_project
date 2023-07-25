import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import '../router.dart';

class AuthenticationScreenRouter {
  void handleAuthentication() async {
    String? getAuths;
    bool? getAccount;
    await SharedPreferences.getInstance().then(
      (value) {
        final getAuth = value.getString(
          'auth',
        );
        print(getAuth);
        if (getAuth != null) {
          getAuths = getAuth;
        }

        final account = value.getBool('account');
        print(' account $account');
        getAccount = account;
      },
    );

    // print("S$getAuths");
    if (getAuths != null) {
      if (repo.firebaseAuth.currentUser?.uid != null) {
        print(repo.firebaseAuth.currentUser?.uid);
        if (getAuths == repo.firebaseAuth.currentUser?.uid) {
          if (getAccount != null) {
            getAccount!
                ? appRoute.go(ScreenPaths.dashboard)
                : appRoute.go(ScreenPaths.home);
          } else {
            appRoute.go(ScreenPaths.home);
          }
        } else {
          appRoute.go(ScreenPaths.login);
        }
      } else {
        appRoute.go(ScreenPaths.login);
      }
    } else {
      appRoute.go(ScreenPaths.login);
    }
    print('getAccount $getAccount');
  }

  void redirectToScreen(String path) {
    appRoute.go(path);
  }
}
