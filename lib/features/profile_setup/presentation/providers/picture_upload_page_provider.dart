import 'package:camera/camera.dart';
import 'package:flutter/widgets.dart';

class PictureUploadPageProvider extends ChangeNotifier {
  bool cameraInitError = false;
  int activeCamera = 0;
  List<CameraDescription> cameras;
  CameraController controller;
  
  void initCamera() async {
    try {
      cameraInitError = false;

      cameras = await availableCameras();
      controller = CameraController(cameras[activeCamera], ResolutionPreset.medium);
      await controller.initialize();
      notifyListeners();
    } on CameraException catch(e) {
      cameraInitError = true;
      controller = null;
      notifyListeners();
    }
  }

  // void swapCamera() async {
  //   if (cameras.length > 1 && controller != null) {
  //     try {
  //       controller.dispose();
  //       cameraInitError = false;
  //       switch (activeCamera) {
  //         case 0:
  //           controller = CameraController(cameras[1], ResolutionPreset.medium);
  //           break;
  //         case 1:
  //           controller = CameraController(cameras[0], ResolutionPreset.medium);
  //       }

  //       await controller.initialize();
  //       notifyListeners();
  //     } on CameraException catch(e) {
  //       cameraInitError = true;
  //       controller = null;
  //       notifyListeners();
  //     }
  //   }
  // }

  @override
  void dispose() {
    print('provider dispose called');
    controller.dispose();
    super.dispose();
  }
}