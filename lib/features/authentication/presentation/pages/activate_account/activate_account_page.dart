import 'package:flutter/material.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:pander/core/constants/app_colors.dart';
import 'package:pander/core/constants/app_styles.dart';
import 'package:pander/core/router/route_paths.dart';
import 'package:pander/core/util/routing.dart';
import 'package:pander/core/widgets/generic_appbar.dart';

class ActivateAccountPage extends StatelessWidget {
  final String email;

  const ActivateAccountPage({Key key, this.email}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getBaseAppbar('Activate account'),
      body: Padding(
        padding: const EdgeInsets.only(left: 28, right: 28),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'An activation email has been sent to ',
                          style: AppStyles.textMDBlack.copyWith(
                            fontWeight: FontWeight.bold
                          )
                        ),
                        TextSpan(
                          text: email,
                          style: AppStyles.textMDBlack.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.SECONDARY_COLOR
                          )
                        )
                      ]
                    )
                  ),
                  SizedBox(height: 36),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        child: Text(
                          'Open mail',
                          style: AppStyles.actionBTNText.copyWith(
                            fontSize: 14,
                            color: Colors.black87
                          ),
                        ),
                        elevation: 0,
                        color: Colors.white,
                        padding: const EdgeInsets.fromLTRB(36, 14, 36, 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                          side: BorderSide(
                            color: AppColors.SECONDARY_COLOR,
                            width: 2
                          )
                        ),
                        onPressed: () async {
                          var result = await OpenMailApp.openMailApp();
                          if (!result.didOpen && !result.canOpen) {
                            final snackBar = SnackBar(content: Text('No email apps installed!'));
                            Scaffold.of(context).showSnackBar(snackBar);
                          }
                        }
                      ),
                      SizedBox(width: 18),
                      RaisedButton(
                        child: Text(
                          'Continue',
                          style: AppStyles.actionBTNText.copyWith(
                            fontSize: 14
                          ),
                        ),
                        padding: const EdgeInsets.fromLTRB(36, 14, 36, 14),
                        color: AppColors.SECONDARY_COLOR,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)
                        ),
                        onPressed: () => goToPage(
                          context, 
                          RoutePaths.VerifyAccount, 
                          argument: this.email
                        ),
                      )
                    ],
                  ),
                ],
              )
            ),
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Didn\'t receive the code?\n',
                      style: AppStyles.textMDBlack.copyWith(
                        fontWeight: FontWeight.bold
                      )
                    ),
                    TextSpan(
                      text: 'Resend activation mail',
                      style: AppStyles.textMDBlack.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.SECONDARY_COLOR
                      )
                    )
                  ]
                )
              )
            )
          ],
        ),
      ),
    );
  }
}