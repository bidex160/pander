import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pander/core/base_page.dart';
import 'package:pander/core/constants/app_colors.dart';
import 'package:pander/core/constants/app_styles.dart';
import 'package:pander/core/router/route_paths.dart';
import 'package:pander/core/util/routing.dart';
import 'package:pander/features/profile_setup/presentation/providers/picture_upload_page_provider.dart';

class PictureUploadPage extends StatefulWidget {
  @override
  _PictureUploadPageState createState() => _PictureUploadPageState();
}

class _PictureUploadPageState extends State<PictureUploadPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage<PictureUploadPageProvider>(
      child: null,
      model: PictureUploadPageProvider(),
      builder: (context, provider, child) {
        if (provider.controller == null && !provider.cameraInitError) {
          provider.initCamera();
        }
        
        return Scaffold(
          appBar: AppBar(
            leading: InkResponse(
              onTap: () => Navigator.of(context).pop(),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Center(
                  child: Text(
                    'Close',
                    style: AppStyles.textMDBlack.copyWith(
                      color: AppColors.BLUE
                    ),
                  ),
                ),
              ),
            ),
            title: Text(
              'Upload selfie',
              style: AppStyles.textMDBlack.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(MdiIcons.cameraOutline, color: AppColors.BLUE),
              )
            ],
            centerTitle: true,
            brightness: Brightness.light,
            backgroundColor: ThemeData.from(colorScheme: ColorScheme.light()).backgroundColor,
            iconTheme: ThemeData.from(colorScheme: ColorScheme.light()).iconTheme,
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(16, 28, 16, 28),
            child: Center(
              child: Column(
                children: [
                  // Expanded(child: Container()),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: provider.controller.value.aspectRatio,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CameraPreview(provider.controller),
                        ),
                      )
                    ),
                  ),
                  SizedBox(height: 48),
                  InkResponse(
                    onTap: () => goToPage(context, RoutePaths.VehicleUpload),
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: AppColors.SECONDARY_COLOR,
                        shape: BoxShape.circle
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  // color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white, width: 2)
                                ),
                              ),
                            )
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}