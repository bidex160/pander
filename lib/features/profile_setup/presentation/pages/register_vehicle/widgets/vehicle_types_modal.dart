import 'package:flutter/material.dart';
import 'package:pander/core/constants/app_colors.dart';
import 'package:pander/core/constants/app_constants.dart';
import 'package:pander/core/constants/app_styles.dart';

class VehicleTypesModal extends StatelessWidget {
  final Function(String vehicle) onVehicleSelected;
  final String selectedVehicle;

  const VehicleTypesModal({Key key, this.onVehicleSelected, this.selectedVehicle}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      width: MediaQuery.of(context).size.width * 0.7,
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
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
              Row(
                children: [
                  Text(
                    'Select vehicle type',
                    style: AppStyles.textMDBlack.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    )
                  )
                ],
              ),
              SizedBox(height: 18),
              ...AppConstants.VEHICLE_TYPES.map((vehicle) {
                return InkWell(
                  onTap: () {
                    onVehicleSelected(vehicle);
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 8, bottom: 8),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      border: vehicle == selectedVehicle
                        ? Border.all(width: 1, color: AppColors.BLUE)
                        : Border.all(width: 1, color: Colors.grey.withOpacity(0.2)),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        vehicle,
                        style: AppStyles.textMDBlack.copyWith(
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}