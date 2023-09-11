import 'package:flutter/material.dart';


class ButtonModel extends ChangeNotifier {
  bool _isChecked = false;

  bool get isChecked => _isChecked;

  void toggle() {
    _isChecked = true;
    notifyListeners();
  }
}

