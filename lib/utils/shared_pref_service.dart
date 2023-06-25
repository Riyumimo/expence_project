import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static SharedPreferences? _preferences;

  static Future<SharedPreferencesService> getInstance() async {
    _instance ??= SharedPreferencesService();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  // Buat getter dan setter untuk data yang ingin Anda simpan dan ambil

  String? get name => _preferences?.getString('name');
  set name(String? value) => _preferences?.setString('name', value!);

  int? get age => _preferences?.getInt('age');
  set age(int? value) => _preferences?.setInt('age', value!);

  double? get height => _preferences?.getDouble('height');
  set height(double? value) => _preferences?.setDouble('height', value!);
}
