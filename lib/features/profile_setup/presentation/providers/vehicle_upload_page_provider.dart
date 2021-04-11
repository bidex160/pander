import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class VehicleUploadPageProvider extends ChangeNotifier {
  final picker = ImagePicker();
  File _pickedImage;
  
  File get pickedImage => _pickedImage;

  void getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _pickedImage = File(pickedFile.path);
      notifyListeners();
    }
  }
}