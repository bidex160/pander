import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class DocumentsUploadPageProvider extends ChangeNotifier {
  File vehicleInsurance;
  File vehicleCAC;

  final picker = ImagePicker();
  // File _pickedImage;
  
  // File get pickedImage => _pickedImage;

  void getInsurance() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      vehicleInsurance = File(pickedFile.path);
      notifyListeners();
    }
  }

  void getCAC() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      vehicleCAC = File(pickedFile.path);
      notifyListeners();
    }
  }

  void clearInsurance() {
    vehicleInsurance = null;
    notifyListeners();
  }

  void clearCAC() {
    vehicleCAC = null;
    notifyListeners();
  }
}