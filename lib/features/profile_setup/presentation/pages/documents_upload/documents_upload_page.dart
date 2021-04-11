import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pander/core/base_page.dart';
import 'package:pander/core/constants/app_colors.dart';
import 'package:pander/core/router/route_paths.dart';
import 'package:pander/core/util/routing.dart';
import 'package:pander/features/profile_setup/presentation/pages/documents_upload/widgets/success_modal.dart';
import 'package:pander/features/profile_setup/presentation/pages/register_vehicle/widgets/vehicle_types_modal.dart';
import 'package:path/path.dart' as p;
import 'package:pander/core/constants/app_styles.dart';
import 'package:pander/core/widgets/generic_appbar.dart';
import 'package:pander/features/profile_setup/presentation/pages/documents_upload/widgets/upload_item.dart';
import 'package:pander/features/profile_setup/presentation/pages/documents_upload/widgets/upload_widget.dart';
import 'package:pander/features/profile_setup/presentation/providers/documents_upload_page_provider.dart';

class DocumentsUploadPage extends StatefulWidget {
  @override
  _DocumentsUploadPageState createState() => _DocumentsUploadPageState();
}

class _DocumentsUploadPageState extends State<DocumentsUploadPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage<DocumentsUploadPageProvider>(
      child: null,
      model: DocumentsUploadPageProvider(),
      builder: (context, provider, child) {
        return Scaffold(
          appBar: getBaseAppbar('Upload Vehicle Documents'),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(16, 48, 16, 28),
            child: Column(
              children: [
                Text(
                  'Upload the required lorem upsum is lorem simply dummy document',
                  style: AppStyles.textMDBlack,
                ),
                SizedBox(height: 48),
                Visibility(
                  visible: provider.vehicleInsurance == null,
                  child: UploadPlaceholderWidget(
                    text: 'Upload vehicle\'s insurance',
                    onPick: () => provider.getInsurance(),
                  ),
                ),
                Visibility(
                  visible: provider.vehicleInsurance != null,
                  child: UploadItemWidget(
                    filename: 'vehicle_insurance${p.extension(provider.vehicleInsurance == null ? '' : provider.vehicleInsurance.path )}',
                    onDelete: () => provider.clearInsurance(),
                    onViewImage: () => goToPage(context, RoutePaths.ImageViewer, argument: provider.vehicleInsurance),
                  ),
                ),
                SizedBox(height: 28),
                Visibility(
                  visible: provider.vehicleCAC == null,
                  child: UploadPlaceholderWidget(
                    text: 'Upload CAC document',
                    onPick: () => provider.getCAC(),
                  )
                ),
                Visibility(
                  visible: provider.vehicleCAC != null,
                  child: UploadItemWidget(
                    filename: 'vehicle_CAC${p.extension(provider.vehicleCAC == null ? '' : provider.vehicleCAC.path)}',
                    onDelete: () => provider.clearCAC(),
                    onViewImage: () => goToPage(context, RoutePaths.ImageViewer, argument: provider.vehicleCAC),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      child: RaisedButton(
                        child: Text(
                          'Continue',
                          style: AppStyles.actionBTNText.copyWith(
                            fontSize: 14
                          ),
                        ),
                        padding: const EdgeInsets.fromLTRB(36, 14, 36, 14),
                        color: shouldContinue(provider) ? AppColors.SECONDARY_COLOR : Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)
                        ),
                        onPressed: () {
                          if (shouldContinue(provider)) {
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
                                return DocumentsSuccessModal();
                                // Column(
                                //   children: [
                                //     Image.asset('assets/star.png')
                                //   ],
                                // );
                              }
                            );
                          }
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

bool shouldContinue(DocumentsUploadPageProvider provider) {
  if (provider.vehicleCAC == null || provider.vehicleInsurance == null) {
    return false;
  } else {
    return true;
  }
}