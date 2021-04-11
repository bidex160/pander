import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pander/core/constants/app_colors.dart';
import 'package:pander/core/constants/app_styles.dart';

class AccountTypeWidget extends StatelessWidget {
  final String title;
  final String description;
  final Color color;
  final Color textColor;
  final Function onTap;

  const AccountTypeWidget({
    Key key, 
    this.title, 
    this.description, 
    this.color, 
    this.textColor, 
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      elevation: 4,
      color: color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 30, 18, 30),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.PRIMARY_COLOR)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(
                    'assets/box.svg'
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppStyles.textMDWhite.copyWith(
                        fontWeight: FontWeight.w700,
                        color: textColor ?? Colors.black
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      description,
                      style: AppStyles.textMDWhite.copyWith(
                        fontWeight: FontWeight.w100,
                        fontSize: 14,
                        color: textColor ?? Colors.black
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16),
              Icon(
                Icons.arrow_right_alt,
                color: textColor ?? Colors.black,
                size: 36,
              )
            ],
          ),
        ),
      ),
    );
  }
}