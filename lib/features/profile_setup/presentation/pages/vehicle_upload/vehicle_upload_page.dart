import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pander/core/base_page.dart';
import 'package:pander/core/constants/app_colors.dart';
import 'package:pander/core/constants/app_styles.dart';
import 'package:pander/core/router/route_paths.dart';
import 'package:pander/core/util/routing.dart';
import 'package:pander/core/widgets/generic_appbar.dart';
import 'package:pander/features/profile_setup/presentation/providers/vehicle_upload_page_provider.dart';

class VehicleUploadPage extends StatefulWidget {
  @override
  _VehicleUploadPageState createState() => _VehicleUploadPageState();
}

class _VehicleUploadPageState extends State<VehicleUploadPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage<VehicleUploadPageProvider>(
      child: null,
      model: VehicleUploadPageProvider(),
      builder: (context, provider, child) {
        return Scaffold(
          appBar: getBaseAppbar('Upload Vehicle Photo'),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(16, 28, 16, 18),
            child: Column(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => provider.getImage(),
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      dashPattern: [10, 3],
                      radius: Radius.circular(8),
                      strokeWidth: 1,
                      color: Colors.black45,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: provider.pickedImage != null 
                          ? DecorationImage(
                            image: FileImage(provider.pickedImage),
                            fit: BoxFit.fill
                          ) : null,
                        ),
                        child: Center(
                          child: provider.pickedImage == null
                          ? Icon(
                              MdiIcons.fileUploadOutline, 
                              size: 36,
                              color: Colors.black45
                            )
                          : null,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 38),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    child: Text(
                      'Continue',
                      style: AppStyles.actionBTNText.copyWith(
                        fontSize: 14
                      ),
                    ),
                    padding: const EdgeInsets.fromLTRB(36, 14, 36, 14),
                    color: provider.pickedImage == null ? Colors.grey : AppColors.SECONDARY_COLOR,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)
                    ),
                    onPressed: () => goToPage(context, RoutePaths.RegisterVehicle),
                  ),
                )
              ],
            ),
          )
        );
      },
    );
  }
}