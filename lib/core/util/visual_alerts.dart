import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void showAlertFlash(
  BuildContext context, 
  String message,
  {
    int durationInSeconds = 2,
    Color background = Colors.white,
    Color color = Colors.black87
  }
) {
    showFlash(
      context: context, 
      duration: Duration(seconds: durationInSeconds),
      builder: (_, controller) {
        return Flash(
          backgroundColor: background,
          controller: controller, 
          child: DefaultTextStyle(
            style: TextStyle(color: Colors.black), 
            child: FlashBar(
              message: Text(
                message,
                style: TextStyle(
                  color: color
                ),
              )
            )
          )
        );
      }
    );
  }

  void showLoadingDialog(String message, {Widget indicator}) {
    if (indicator != null) {
      EasyLoading.show(status: message, indicator: indicator);
    } else {
      EasyLoading.show(status: message);
    }
  }

  void dismissLoadingDialog() {
    EasyLoading.dismiss();
  }