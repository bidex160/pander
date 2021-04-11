import 'dart:async';

import 'package:flutter/widgets.dart';

class VerifyAccountPageProvider extends ChangeNotifier {
  final FocusNode pinPutFocusNode = FocusNode();
  Duration resendTime = Duration(seconds: 0);
  int tick = 0;

  VerifyAccountPageProvider() {
    setResendTime(Duration(minutes: 3, seconds: 30));
  }

  String getTimeRemaining() {
    int secondsRemaining = resendTime.inSeconds - tick;
    if (secondsRemaining > 60) {
      return '(${secondsRemaining~/60}:${secondsRemaining % 60})';
    } else if (secondsRemaining == 0) {
      return '';
    } else {
      return '($secondsRemaining)';
    }
  }

  void setResendTime(Duration duration) {
    resendTime = duration;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timer.tick >= resendTime.inSeconds) {
        timer.cancel();
        resendTime = Duration(seconds: 0);
        tick = 0;
        notifyListeners();
      } else {
        tick = timer.tick;
        notifyListeners();
      }
    });
  }
}