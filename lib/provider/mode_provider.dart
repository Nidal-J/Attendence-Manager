import 'package:attendance_manager/preferences/shared_pref_controller.dart';
import 'package:flutter/material.dart';

class ModeProvider extends ChangeNotifier {
  String mode =
      SharedPrefController().getValueFor<String>(key: PrefKeys.mode.name) ??
          'light';

  void changeMode(String mode) {
    this.mode = mode;
    SharedPrefController().setMode(mode: mode);
    notifyListeners();
  }
}
