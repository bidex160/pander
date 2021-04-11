import 'package:flutter/material.dart';
import 'package:pander/core/base_page.dart';
import 'package:pander/core/constants/app_colors.dart';
import 'package:pander/core/constants/app_styles.dart';
import 'package:pander/core/router/route_paths.dart';
import 'package:pander/core/util/routing.dart';
import 'package:pander/core/widgets/generic_appbar.dart';
import 'package:pander/features/profile_setup/presentation/pages/register_vehicle/widgets/vehicle_types_modal.dart';
import 'package:pander/features/profile_setup/presentation/providers/register_vehicle_page_provider.dart';

class RegisterVehiclePage extends StatefulWidget {
  @override
  _RegisterVehiclePageState createState() => _RegisterVehiclePageState();
}

class _RegisterVehiclePageState extends State<RegisterVehiclePage> {
  @override
  Widget build(BuildContext context) {
    return BasePage<RegisterVehiclePageProvider>(
      child: null,
      model: RegisterVehiclePageProvider(),
      builder: (context, provider, child) {
        return Scaffold(
          appBar: getBaseAppbar('Register Vehicle'),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 48, 20, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Vehicle Type',
                    style: AppStyles.textMDBlack.copyWith(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 16),
                  InkWell(
                    onTap: () {
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
                          return VehicleTypesModal(
                            selectedVehicle: provider.selectedVehicle,
                            onVehicleSelected: (selectedVehicle) 
                              => provider.setSelectedVehicle(selectedVehicle),
                          );
                        }
                      );
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(6)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              provider.selectedVehicle ?? 'What type of vehicle do you drive?',
                              style: AppStyles.textMDBlack.copyWith(
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            Icon(Icons.arrow_drop_down)
                          ],
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: 28),
                  Text(
                    'Vehicle Make',
                    style: AppStyles.textMDBlack.copyWith(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Enter make of vehicle',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black.withOpacity(0.2))
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.PRIMARY_COLOR)
                      )
                      // focusedBorder: 
                    ),
                  ),
                  SizedBox(height: 28),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Vehicle Model',
                              style: AppStyles.textMDBlack.copyWith(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 16),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: 'Enter model',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black.withOpacity(0.2))
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.PRIMARY_COLOR)
                                )
                                // focusedBorder: 
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 18),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Year',
                              style: AppStyles.textMDBlack.copyWith(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 16),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: 'Enter year',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black.withOpacity(0.2))
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.PRIMARY_COLOR)
                                )
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 28),
                  Text(
                    'Phone Number',
                    style: AppStyles.textMDBlack.copyWith(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Enter phone number',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black.withOpacity(0.2))
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.PRIMARY_COLOR)
                      )
                      // focusedBorder: 
                    ),
                  ),
                  SizedBox(height: 28),
                  Text(
                    'Vehicle Color',
                    style: AppStyles.textMDBlack.copyWith(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Enter color of vehicle',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black.withOpacity(0.2))
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.PRIMARY_COLOR)
                      )
                      // focusedBorder: 
                    ),
                  ),
                  SizedBox(height: 48),
                  Container(
                    width: double.infinity,
                    child: RaisedButton(
                      child: Text(
                        'Continue',
                        style: AppStyles.actionBTNText,
                      ),
                      color: AppColors.SECONDARY_COLOR,
                      onPressed: () => goToPage(context, RoutePaths.UploadDocuments),
                      padding: const EdgeInsets.only(top: 12, bottom: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        );
      },
    );
  }
}