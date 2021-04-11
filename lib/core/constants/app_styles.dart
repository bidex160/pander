import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pander/core/constants/app_colors.dart';

class AppStyles {
  static final TextStyle brandText = GoogleFonts.raleway(
    color: Colors.white,
    fontSize: 20
  );

  static final TextStyle btnTextMDWhite = GoogleFonts.raleway(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.5
  );

  static final TextStyle actionBTNText = GoogleFonts.raleway(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle actionBTNTextSecondary = GoogleFonts.raleway(
    color: AppColors.SECONDARY_COLOR,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle textMDWhite = GoogleFonts.raleway(
    color: Colors.white,
    fontSize: 16
  );

  static final TextStyle textLGWhite = GoogleFonts.raleway(
    color: Colors.white,
    fontSize: 20
  );

  static final TextStyle textExtraLGWhite = GoogleFonts.raleway(
    color: Colors.white,
    fontSize: 36,
  );

  static final TextStyle textSMBlack = GoogleFonts.raleway(
    color: Colors.black87,
    fontSize: 14
  );

  static final TextStyle textSMWhite = GoogleFonts.raleway(
    color: Colors.white,
    fontSize: 14
  );

  static final TextStyle textMDBlack = GoogleFonts.raleway(
    color: Colors.black87,
    fontSize: 16
  );

  static final TextStyle textLGBlack = GoogleFonts.raleway(
    // color: Colors.black87,
    fontSize: 24,
    fontWeight: FontWeight.w700
  );

  static final TextStyle textExtraLGBlack = GoogleFonts.raleway(
    color: Colors.black87,
    fontSize: 36,
  );

  static final TextStyle textMDPrimary = GoogleFonts.raleway(
    color: AppColors.PRIMARY_COLOR,
    fontSize: 16
  );

  static final TextStyle textLGPrimary = GoogleFonts.raleway(
    color: AppColors.PRIMARY_COLOR,
    fontSize: 20
  );

  static final TextStyle textExtraLGPrimary = GoogleFonts.raleway(
    color: AppColors.PRIMARY_COLOR,
    fontSize: 36,
  );
}