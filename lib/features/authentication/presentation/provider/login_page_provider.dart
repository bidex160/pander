import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPageProvider extends ChangeNotifier {
  bool shouldShowPassword = false;

  void toggleShowPassword() {
    shouldShowPassword = !shouldShowPassword;
    notifyListeners();
  }
}