import 'package:flutter/cupertino.dart';

class PickImageProvider extends ChangeNotifier {
  String imgPath = 'assets/images/courses_icon.png';

  void changeImage(String imgPath) {
    this.imgPath = imgPath;
    notifyListeners();
  }
}
