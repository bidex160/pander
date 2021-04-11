import 'package:flutter/widgets.dart';

class EmailInputPageProvider extends ChangeNotifier {
  bool isEmailValid = false;
  String email = '';
  
  String validateEmail(String email) {
    bool emailValid = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(email);
    if (!emailValid){
      isEmailValid = false;
      return 'Invalid email';
    } else {
      isEmailValid = true;
    }
  }

  void setEmail(String email) {
    this.email = email;
    validateEmail(email);
    notifyListeners();
  }
}