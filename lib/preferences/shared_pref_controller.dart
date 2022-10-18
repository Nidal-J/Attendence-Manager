import 'package:attendance_manager/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys {
  loggedIn,
  id,
  userName,
  email,
  password,
  lang,
  mode,
}

class SharedPrefController {
  SharedPrefController._();

  static SharedPrefController? _instance;
  late SharedPreferences _sharedPreferences;

  factory SharedPrefController() {
    return _instance ??= SharedPrefController._();
  }

  Future<void> initPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> save({required User user}) async {
    await _sharedPreferences.setBool(PrefKeys.loggedIn.name, true);
    await _sharedPreferences.setInt(PrefKeys.id.name, user.id);
    await _sharedPreferences.setString(PrefKeys.userName.name, user.userName);
    await _sharedPreferences.setString(PrefKeys.email.name, user.email);
    await _sharedPreferences.setString(PrefKeys.password.name, user.password);
  }

  bool get loggedIn =>
      _sharedPreferences.getBool(PrefKeys.loggedIn.name) ?? false;

  T? getValueFor<T>({required String key}) {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.get(key) as T?;
    }
    return null;
  }

  Future<bool> setLanguage({required String lang}) async {
    return _sharedPreferences.setString(PrefKeys.lang.name, lang);
  }

  Future<bool> setMode({required String mode}) async {
    return _sharedPreferences.setString(PrefKeys.mode.name, mode);
  }

  Future<bool> removeValueFor({required String key}) async {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.remove(key);
    }
    return false;
  }

  Future<bool> clear() async {
    return _sharedPreferences.clear();
  }
}
