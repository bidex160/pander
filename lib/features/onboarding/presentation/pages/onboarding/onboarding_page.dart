import 'package:flutter/material.dart';
import 'package:pander/core/base_page.dart';
import 'package:pander/core/constants/app_colors.dart';
import 'package:pander/core/constants/app_styles.dart';
import 'package:pander/core/router/route_paths.dart';
import 'package:pander/core/util/routing.dart';
import 'package:pander/features/onboarding/presentation/pages/onboarding/widgets/onboarding_page_1.dart';
import 'package:pander/features/onboarding/presentation/pages/onboarding/widgets/onboarding_page_2.dart';
import 'package:pander/features/onboarding/presentation/pages/onboarding/widgets/onboarding_page_3.dart';
import 'package:pander/features/onboarding/presentation/providers/onboarding_page_provider.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage<OnboardingPageProvider>(
      child: null,
      model: OnboardingPageProvider(),
      builder: (context, provider, child) {
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: Container(
                  child: PageView(
                    children: [
                      OnboardingPage1(),
                      OnboardingPage2(),
                      OnboardingPage3()
                    ],
                    onPageChanged: provider.pageChanged,
                  ),
                ),
              ),
              SizedBox(height: 38),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3, 
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        curve: Curves.bounceOut,
                        width: provider.activePage == index ? 32 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: provider.activePage == index 
                            ? AppColors.SECONDARY_COLOR
                            : AppColors.SECONDARY_COLOR.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(6)
                        ),
                      ),
                    );
                  }
                )
              ),
              // SizedBox(height: 38),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 38, 16, 18),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        child: Text(
                          'Get Started',
                          style: AppStyles.actionBTNText,
                        ),
                        color: AppColors.SECONDARY_COLOR,
                        padding: EdgeInsets.only(top: 16, bottom: 16),
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                        ),
                        onPressed: () => goToPage(context, RoutePaths.AccountChooser)
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      child: OutlineButton(
                        child: Text(
                          'Login',
                          style: AppStyles.actionBTNTextSecondary,
                        ),
                        padding: EdgeInsets.only(top: 16, bottom: 16),
                        splashColor: AppColors.SECONDARY_COLOR,
                        borderSide: BorderSide(
                          color: AppColors.SECONDARY_COLOR, 
                          width: 2,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        onPressed: () => goToPage(context, RoutePaths.Login)
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        );
      },
    );
  }
}