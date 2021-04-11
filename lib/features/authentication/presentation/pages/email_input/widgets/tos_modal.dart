import 'package:flutter/material.dart';
import 'package:pander/core/constants/app_colors.dart';
import 'package:pander/core/constants/app_styles.dart';

class TOSModal extends StatelessWidget {
  final Function onAccept;
  final Function onDecline;

  const TOSModal({Key key, this.onAccept, this.onDecline}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        )
      ),
      height: MediaQuery.of(context).size.height * 0.85,
      width: MediaQuery.of(context).size.width * 0.7,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Terms of Service',
                      style: AppStyles.textLGBlack.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 20
                      ),
                    ),
                    SizedBox(height: 18),
                    Text(
                      'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words',
                      style: AppStyles.textMDBlack,
                    ),
                    SizedBox(height: 18),
                    Text(
                      'Authorized Users',
                      style: AppStyles.textLGBlack.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 20
                      ),
                    ),
                    SizedBox(height: 18),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                      style: AppStyles.textMDBlack,
                    ),
                  ],
                )
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: RaisedButton(
                    padding: const EdgeInsets.only(top: 12, bottom: 12),
                    color: AppColors.SECONDARY_COLOR,
                    child: Text(
                      'I Accept',
                      style: AppStyles.actionBTNText.copyWith(
                        fontSize: 16
                      ),
                    ),
                    onPressed: onAccept
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: MaterialButton(
                    padding: const EdgeInsets.only(top: 12, bottom: 12),
                    child: Text(
                      'I Decline',
                      style: AppStyles.actionBTNText.copyWith(
                        color: Colors.red,
                        fontSize: 16
                      ),
                    ),
                    onPressed: onDecline,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                      side: BorderSide(
                        color: Colors.red
                      )
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}