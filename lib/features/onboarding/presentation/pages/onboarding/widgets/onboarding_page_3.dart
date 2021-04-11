import 'package:flutter/material.dart';
import 'package:pander/core/constants/app_styles.dart';

class OnboardingPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Container(
        child: Column(
          children: [
            Expanded(
              child: Image(
                image: AssetImage('assets/onboarding-img-3.png'),
              ),
            ),
            Text(
              'Is it not beautiful',
              style: AppStyles.textLGBlack,
            ),
            SizedBox(height: 12),
            Text(
              'Lorem ipsum dolor sit amet,   elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              style: AppStyles.textMDBlack,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}