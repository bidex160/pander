import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:pander/core/constants/app_colors.dart';
import 'package:pander/core/constants/app_styles.dart';

class UploadPlaceholderWidget extends StatelessWidget {
  final String text;
  final Function onPick;

  const UploadPlaceholderWidget({Key key, this.text, this.onPick}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      elevation: 4,
      borderRadius: BorderRadius.circular(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: onPick,
          child: DottedBorder(
            borderType: BorderType.RRect,
            dashPattern: [10, 3],
            radius: Radius.circular(8),
            strokeWidth: 1,
            color: Colors.black.withOpacity(0.2),
            child: Container(
              height: 90,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cloud_upload_outlined,
                    size: 28,
                    color: AppColors.BLUE,
                  ),
                  SizedBox(height: 8),
                  Text(
                    text,
                    style: AppStyles.textSMBlack,
                  )
                ],
              ),
            )
          ),
        ),
      ),
    );
  }
}