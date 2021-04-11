import 'package:flutter/widgets.dart';

void goToPage(
  BuildContext context, 
  String route, 
  {
    bool shouldPop = false,
    Object argument
  }
) {
  if (shouldPop) {
    Navigator.of(context).popAndPushNamed(route, arguments: argument);
  } else {
    Navigator.of(context).pushNamed(route, arguments: argument);
  }
}