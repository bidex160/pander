import 'package:flutter/material.dart';
import 'package:pander/core/base_page.dart';
import 'package:pander/core/constants/app_colors.dart';
import 'package:pander/core/constants/app_styles.dart';
import 'package:pander/core/router/route_paths.dart';
import 'package:pander/core/util/routing.dart';
import 'package:pander/features/authentication/presentation/provider/signup_page_provider.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage<SignupPageProvider>(
      child: null,
      model: SignupPageProvider(),
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: AppColors.PRIMARY_COLOR,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 48, 20, 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi  👋🏾,',
                      style: AppStyles.textLGWhite.copyWith(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'We thought it would be nice to know more about you',
                      style: AppStyles.textLGWhite.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                    SizedBox(height: 48),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(18, 36, 18, 36),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Full Name',
                              style: AppStyles.textMDBlack.copyWith(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 16),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: 'Enter your full name',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black.withOpacity(0.2))
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.PRIMARY_COLOR)
                                )
                                // focusedBorder: 
                              ),
                            ),
                            SizedBox(height: 24),
                            Text(
                              'Address',
                              style: AppStyles.textMDBlack.copyWith(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 16),
                            TextFormField(
                              keyboardType: TextInputType.streetAddress,
                              maxLines: 2,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: 'Enter your address',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black.withOpacity(0.2))
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.PRIMARY_COLOR)
                                )
                                // focusedBorder: 
                              ),
                            ),
                            SizedBox(height: 24),
                            Text(
                              'Phone Number',
                              style: AppStyles.textMDBlack.copyWith(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 16),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: 'Enter your phone number',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black.withOpacity(0.2))
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.PRIMARY_COLOR)
                                )
                              ),
                            ),
                            SizedBox(height: 24),
                            Text(
                              'Password',
                              style: AppStyles.textMDBlack.copyWith(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 16),
                            TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: 'Enter password',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black.withOpacity(0.2))
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.PRIMARY_COLOR)
                                )
                                // focusedBorder: 
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 48),
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        child: Text(
                          'Create an account',
                          style: AppStyles.actionBTNText,
                        ),
                        color: AppColors.SECONDARY_COLOR,
                        onPressed: () => goToPage(context, RoutePaths.PictureUploadInstructions),
                        padding: const EdgeInsets.only(top: 16, bottom: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)
                        ),
                      ),
                    ),
                    SizedBox(height: 32),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          style: AppStyles.textMDWhite,
                          children: [
                            TextSpan(
                              text: 'Already have an account?  '
                            ),
                            TextSpan(
                              text: 'Sign In',
                              style: DefaultTextStyle.of(context).style.copyWith(
                                color: AppColors.ORANGE
                              ),
                            )
                          ]
                        )
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}