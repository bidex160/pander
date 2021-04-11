import 'package:flutter/material.dart';
import 'package:pander/core/constants/app_colors.dart';
import 'package:pander/core/constants/app_styles.dart';
import 'package:pander/core/router/route_paths.dart';
import 'package:pander/core/util/routing.dart';
import 'package:pander/features/authentication/presentation/pages/account_chooser/widgets/account_type.dart';

class AccountChooserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 48, 20, 12),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello 👋🏾,',
                style: AppStyles.textLGBlack.copyWith(
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                'Please select an account type',
                style: AppStyles.textLGBlack.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
              SizedBox(height: 38),
              AccountTypeWidget(
                title: 'Service Provider',
                description: 'You are a Laundry or dry cleaning company or a tailor',
                color: AppColors.PRIMARY_COLOR,
                textColor: Colors.white,
                onTap: () => goToPage(context, RoutePaths.EmailInput),
              ),
              SizedBox(height: 38),
              AccountTypeWidget(
                title: 'Delivery Agent',
                description: 'Lorem ipsum dolor sit amet,   elit, s',
                color: Colors.white,
                onTap: () => goToPage(context, RoutePaths.EmailInput),
              ),
            ],
          ),
        ),
      ),
    );
  }
}