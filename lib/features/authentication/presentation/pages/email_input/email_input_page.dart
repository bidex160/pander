import 'package:flutter/material.dart';
import 'package:pander/core/base_page.dart';
import 'package:pander/core/constants/app_colors.dart';
import 'package:pander/core/constants/app_styles.dart';
import 'package:pander/core/router/route_paths.dart';
import 'package:pander/core/util/routing.dart';
import 'package:pander/features/authentication/presentation/pages/email_input/widgets/tos_modal.dart';
import 'package:pander/features/authentication/presentation/provider/email_input_page_provider.dart';

class EmailInputPage extends StatefulWidget {
  @override
  _EmailInputPageState createState() => _EmailInputPageState();
}

class _EmailInputPageState extends State<EmailInputPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: null,
      model: EmailInputPageProvider(),
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: AppColors.PRIMARY_COLOR,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 48, 20, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello 👋🏾,',
                    style: AppStyles.textLGWhite.copyWith(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Let\'s have your email address',
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
                            onChanged: provider.setEmail,
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
                        'Validate Email Address',
                        style: AppStyles.actionBTNText,
                      ),
                      color: provider.isEmailValid ? AppColors.SECONDARY_COLOR : Colors.grey,
                      onPressed: () {
                        if (provider.isEmailValid) {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              )
                            ),
                            builder: (BuildContext context) {
                              return TOSModal(
                                onAccept: () {
                                  Navigator.of(context).pop();
                                  goToPage(
                                    context, 
                                    RoutePaths.ActivateAccount,
                                    argument: provider.email
                                  );
                                },
                                onDecline: () => Navigator.of(context).pop(),
                              );
                            }
                          );
                        }
                      },
                      padding: const EdgeInsets.only(top: 18, bottom: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}