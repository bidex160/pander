import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pander/core/constants/app_colors.dart';
import 'package:pander/core/constants/app_styles.dart';
import 'package:pander/core/router/route_paths.dart';
import 'package:pander/core/util/routing.dart';
import 'package:pander/core/widgets/generic_appbar.dart';

class PictureUploadInstructionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getBaseAppbar('Upload selfie'),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(18, 28, 18, 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image(
                image: AssetImage('assets/chad.png')
              ),
            ),
            SizedBox(height: 18),
            Text(
              'Upload a Selfie',
              style: AppStyles.textLGBlack.copyWith(
                fontSize: 20
              ),
            ),
            SizedBox(height: 38),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1. Make sure your face is in frame',
                    style: AppStyles.textSMBlack.copyWith(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '2. Make sure your photo is not blurry',
                    style: AppStyles.textSMBlack.copyWith(
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 42),
                  Padding(
                    padding: const EdgeInsets.only(left: 18, right: 18),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.SECONDARY_COLOR.withOpacity(0.05)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Icon(
                              MdiIcons.lightbulbOn,
                              size: 24,
                              color: AppColors.SECONDARY_COLOR,
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            'Tips: Take in good lighting and take off your glasses',
                            style: AppStyles.textSMBlack.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(child: Container()),
            Container(
              width: double.infinity,
              child: RaisedButton(
                child: Text(
                  'Proceed to Camera',
                  style: AppStyles.actionBTNText.copyWith(
                    fontSize: 14
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(36, 14, 36, 14),
                color: AppColors.SECONDARY_COLOR,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)
                ),
                onPressed: () => goToPage(context, RoutePaths.PictureUpload),
              ),
            )
          ],
        ),
      ),
    );
  }
}