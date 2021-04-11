import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pander/core/base_page.dart';
import 'package:pander/core/constants/app_colors.dart';
import 'package:pander/core/constants/app_styles.dart';
import 'package:pander/core/router/route_paths.dart';
import 'package:pander/core/util/routing.dart';
import 'package:pander/features/authentication/presentation/provider/login_page_provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage<LoginPageProvider>(
      child: null,
      model: LoginPageProvider(),
      builder: (context, provider, child) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          resizeToAvoidBottomPadding: true,
          backgroundColor: AppColors.PRIMARY_COLOR,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 48, 20, 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back 😎,',
                      style: AppStyles.textLGWhite.copyWith(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Let\'s continue from where you stopped',
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
                              'Email Address',
                              style: AppStyles.textMDBlack,
                            ),
                            SizedBox(height: 16),
                            TextFormField(
                              // onChanged: provider.setEmail,
                              keyboardType: TextInputType.emailAddress,
                              // validator: provider,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: 'Enter email address here',
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
                              'Password',
                              style: AppStyles.textMDBlack,
                            ),
                            SizedBox(height: 16),
                            TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: !provider.shouldShowPassword,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: 'Enter password',
                                suffixIcon: InkResponse(
                                  onTap: () => provider.toggleShowPassword(),
                                  child: Icon(
                                    provider.shouldShowPassword 
                                      ? MdiIcons.eyeOffOutline 
                                      : MdiIcons.eyeOutline,
                                    size: 24,
                                  )
                                ),
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
                          'Login',
                          style: AppStyles.actionBTNText,
                        ),
                        color: AppColors.SECONDARY_COLOR,
                        onPressed: () => goToPage(context, RoutePaths.Home),
                        padding: const EdgeInsets.only(top: 16, bottom: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}