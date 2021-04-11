import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pander/core/base_page.dart';
import 'package:pander/core/constants/app_colors.dart';
import 'package:pander/core/constants/app_styles.dart';
import 'package:pander/core/router/route_paths.dart';
import 'package:pander/core/util/routing.dart';
import 'package:pander/core/widgets/generic_appbar.dart';
import 'package:pander/features/authentication/presentation/provider/verify_account_page_provider.dart';
import 'package:pinput/pin_put/pin_put.dart';

class VerifyAccountPage extends StatefulWidget {
  final String email;

  const VerifyAccountPage({Key key, this.email}) : super(key: key);
  
  @override
  _VerifyAccountPageState createState() => _VerifyAccountPageState();
}

class _VerifyAccountPageState extends State<VerifyAccountPage> {
  final BoxDecoration pinPutDecoration = BoxDecoration(
    // color: const Color.fromRGBO(119, 125, 226, 1),
    color: Colors.white,
    borderRadius: BorderRadius.circular(5.0),
  );
  
  @override
  Widget build(BuildContext context) {
    return BasePage<VerifyAccountPageProvider>(
      child: null,
      model: VerifyAccountPageProvider(),
      builder: (context, provider, child) {
        // provider.setResendTime(Duration(minutes: 1));
        
        return Scaffold(
          appBar: getBaseAppbar(''),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(12, 48, 18, 12),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'An activation code has been sent to ',
                          style: AppStyles.textMDBlack.copyWith(
                            fontWeight: FontWeight.bold
                          )
                        ),
                        TextSpan(
                          text: widget.email,
                          style: AppStyles.textMDBlack.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.SECONDARY_COLOR
                          )
                        )
                      ]
                    )
                  ),
                ),
                SizedBox(height: 36),
                Text(
                  'Enter your activation code below',
                  style: AppStyles.textSMBlack.copyWith(),
                ),
                SizedBox(height: 64),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: PinPut(
                    fieldsCount: 5,
                    preFilledWidget: Icon(MdiIcons.minus),
                    textStyle: AppStyles.textMDBlack.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontSize: 24
                    ),
                    eachFieldWidth: 70.0,
                    eachFieldHeight: 50.0,
                    // onSubmit: (String pin) => _showSnackBar(pin),
                    focusNode: provider.pinPutFocusNode,
                    submittedFieldDecoration: pinPutDecoration,
                    selectedFieldDecoration: pinPutDecoration,
                    followingFieldDecoration: pinPutDecoration,
                  ),
                ),
                SizedBox(height: 96),
                Padding(
                  padding: const EdgeInsets.only(left: 28, right: 28),
                  child: Container(
                    width: double.infinity,
                    child: RaisedButton(
                      child: Text(
                        'Verify Email',
                        style: AppStyles.actionBTNText.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      padding: const EdgeInsets.fromLTRB(36, 14, 36, 14),
                      color: AppColors.SECONDARY_COLOR,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)
                      ),
                      onPressed: () => goToPage(context, RoutePaths.Signup),
                    ),
                  ),
                ),
                SizedBox(height: 28),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Didn\'t receive the code? ',
                        style: AppStyles.textSMBlack.copyWith(
                          fontWeight: FontWeight.bold
                        )
                      ),
                      TextSpan(
                        text: 'Resend code${'${provider.getTimeRemaining()}'}',
                        style: AppStyles.textSMBlack.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          decoration: TextDecoration.underline
                        )
                      )
                    ]
                  )
                )
              ],
            ),
          ),
        );
      },
    );
  }
}