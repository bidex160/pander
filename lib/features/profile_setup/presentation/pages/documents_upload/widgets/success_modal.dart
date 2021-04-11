import 'package:flutter/material.dart';
import 'package:pander/core/constants/app_colors.dart';
import 'package:pander/core/constants/app_styles.dart';
import 'package:pander/core/router/route_paths.dart';

class DocumentsSuccessModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.55,
      width: MediaQuery.of(context).size.width * 0.7,
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(18)
                ),
              ),
              SizedBox(height: 24),
              Image.asset('assets/star.png'),
              SizedBox(height: 24),
              Text(
                'Account created successfully!',
                style: AppStyles.textMDBlack.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
              SizedBox(height: 10),
              Text(
                'It is a long established fact that a reader will be distracted',
                textAlign: TextAlign.center,
                style: AppStyles.textSMBlack,
              ),
              SizedBox(height: 56),
              Container(
                width: double.infinity,
                child: RaisedButton(
                  child: Text(
                    'Proceed to Login',
                    style: AppStyles.actionBTNText.copyWith(
                      fontSize: 16
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(36, 14, 36, 14),
                  color: AppColors.SECONDARY_COLOR,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      RoutePaths.Login, (route) => false
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}