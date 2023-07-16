import 'package:shared_preferences/shared_preferences.dart';

class SavePermissionHandler {
  Future<void> savePermissionStatus(String key, bool status) async {
    await SharedPreferences.getInstance()
        .then((value) => value.setBool(key, status));
  }
}
