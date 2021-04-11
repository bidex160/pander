import 'package:flutter/material.dart';

class RegisterVehiclePageProvider extends ChangeNotifier {
  String selectedVehicle;
  TextEditingController vehicleController = TextEditingController();

  void setSelectedVehicle(String vehicle) {
    selectedVehicle = vehicle;
    vehicleController.text = vehicle;
    notifyListeners();
  }
}