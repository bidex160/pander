import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pander/core/pages/discover/widgets/laundry_section.dart';
import 'package:pander/core/pages/home/home_container.dart';
import 'package:pander/core/router/route_paths.dart';
import 'package:pander/core/widgets/image_viewer.dart';
import 'package:pander/features/authentication/presentation/pages/account_chooser/account_chooser_page.dart';
import 'package:pander/features/authentication/presentation/pages/activate_account/activate_account_page.dart';
import 'package:pander/features/authentication/presentation/pages/email_input/email_input_page.dart';
import 'package:pander/features/authentication/presentation/pages/login/login_page.dart';
import 'package:pander/features/authentication/presentation/pages/signup/signup_page.dart';
import 'package:pander/features/authentication/presentation/pages/verify_account/verify_account_page.dart';
import 'package:pander/features/booking/pages/order_items/order_items_page.dart';
import 'package:pander/features/onboarding/presentation/pages/onboarding/onboarding_page.dart';
import 'package:pander/features/profile_setup/presentation/pages/documents_upload/documents_upload_page.dart';
import 'package:pander/features/profile_setup/presentation/pages/picture_upload/picture_upload_page.dart';
import 'package:pander/features/profile_setup/presentation/pages/picture_upload_instructions/picture_upload_instructions.dart';
import 'package:pander/features/profile_setup/presentation/pages/register_vehicle/register_vehicle_page.dart';
import 'package:pander/features/profile_setup/presentation/pages/vehicle_upload/vehicle_upload_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Home:
        return MaterialPageRoute(builder: (_) => HomeContainer());
      case RoutePaths.ImageViewer:
        var argument = settings.arguments as File;
        if (argument != null) {
          return MaterialPageRoute(builder: (_) => ImageViewerWidget(image: argument));
        }
        return MaterialPageRoute(builder: (_) => ImageViewerWidget());
      case RoutePaths.Login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case RoutePaths.Onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingPage());
      case RoutePaths.AccountChooser:
        return MaterialPageRoute(builder: (_) => AccountChooserPage());
      case RoutePaths.EmailInput:
        return MaterialPageRoute(builder: (_) => EmailInputPage());
      case RoutePaths.ActivateAccount:
        var argument = settings.arguments as String;
        if (argument != null) {
          return MaterialPageRoute(builder: (_) 
            => ActivateAccountPage(email: argument));  
        }
        return MaterialPageRoute(builder: (_) 
          => ActivateAccountPage(email: 'the email you provided'));
      case RoutePaths.VerifyAccount:
        var argument = settings.arguments as String;
        if (argument != null) {
          return MaterialPageRoute(builder: (_) 
            => VerifyAccountPage(email: argument));  
        }
        return MaterialPageRoute(builder: (_) 
          => VerifyAccountPage(email: 'the email you provided'));
      case RoutePaths.PictureUploadInstructions:
        return MaterialPageRoute(builder: (_) => PictureUploadInstructionsPage());
      case RoutePaths.PictureUpload:
        return MaterialPageRoute(builder: (_) => PictureUploadPage());
      case RoutePaths.VehicleUpload:
        return MaterialPageRoute(builder: (_) => VehicleUploadPage());
      case RoutePaths.RegisterVehicle:
        return MaterialPageRoute(builder: (_) => RegisterVehiclePage());
      case RoutePaths.UploadDocuments:
        return MaterialPageRoute(builder: (_) => DocumentsUploadPage());
      case RoutePaths.Signup:
        return MaterialPageRoute(builder: (_) => SignupPage());
      case RoutePaths.OrderDetails:
        var argument = settings.arguments as CategoryCard;
        if (argument != null) {
          return MaterialPageRoute(builder: (_) 
            => OrderItemsPage(categoryCard: argument));  
        }
        return MaterialPageRoute(builder: (_) => OrderItemsPage(categoryCard: null));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          )
        );
    }
  }
}