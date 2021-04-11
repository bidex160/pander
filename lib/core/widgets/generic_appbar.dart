import 'package:flutter/material.dart';
import 'package:pander/core/constants/app_styles.dart';

AppBar getBaseAppbar(String title, {List<Widget> actions, bool hasElevation = false}) {
  return AppBar(
    elevation: hasElevation ? null : 0,
    title: Text(
      title,
      style: AppStyles.textMDBlack.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 18
      )
    ),
    centerTitle: true,
    brightness: Brightness.light,
    backgroundColor: ThemeData.from(colorScheme: ColorScheme.light()).backgroundColor,
    iconTheme: ThemeData.from(colorScheme: ColorScheme.light()).iconTheme,
    actions: actions,
  );
}