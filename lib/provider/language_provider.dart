import 'package:attendance_manager/preferences/shared_pref_controller.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String lang =
      SharedPrefController().getValueFor<String>(key: PrefKeys.lang.name) ??
          'en';

  void changeLang(String lang) {
    this.lang = lang;
    SharedPrefController().setLanguage(lang: lang);
    notifyListeners();
  }
}
