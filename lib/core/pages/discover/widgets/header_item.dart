import 'package:flutter/material.dart';
import 'package:pander/core/constants/app_colors.dart';
import 'package:pander/core/constants/app_styles.dart';

class HeaderItem extends StatelessWidget {
  final bool isActive;
  final String title;
  final Function onClick;

  const HeaderItem({Key key, this.isActive, this.title, this.onClick}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    if (!isActive ?? false) {
      return InkWell(
        onTap: onClick,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                title,
                style: AppStyles.textMDBlack,
              ),
            ),
          ),
        ),
      );
    } else {
      return InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.SECONDARY_COLOR.withOpacity(0.07),
            border: Border(
              bottom: BorderSide(
                color: AppColors.SECONDARY_COLOR, 
                width: 2
              )
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                title,
                style: AppStyles.textMDBlack.copyWith(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}