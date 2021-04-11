import 'dart:ui';

import 'package:pander/core/constants/app_colors.dart';
import 'package:pander/core/pages/home/home_page_provider.dart';
import 'package:pander/core/router/route_paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends Drawer {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomePageProvider>(context);
    
    return Stack(
      children: [
      //   Positioned(
      //     top: 0,
      //     bottom: 0,
      //     left: 0,
      //     right: 0,
      //     child: GestureDetector(
      //       onTap: () => provider.closeDrawer(context),
      //       child: BackdropFilter(
      //         filter: ImageFilter.blur(
      //           sigmaX: 5.0,
      //           sigmaY: 5.0,
      //         ),
      //         child: Container(
      //           color: Colors.white.withOpacity(0.2),
      //         ),
      //       ),
      //     )
      //   ),
      //   Positioned(
      //     left: 0,
      //     top: 0,
      //     bottom: 0,
      //     child: Center(
      //       child: Container(
      //         width: MediaQuery.of(context).size.width * 0.85,
      //         height: MediaQuery.of(context).size.height * 0.85,
      //         decoration: BoxDecoration(
      //           color: Colors.black,
      //           borderRadius: BorderRadius.only(
      //             topRight: Radius.circular(8.0),
      //             bottomRight: Radius.circular(8.0)
      //           )
      //         ),
      //         child: SingleChildScrollView(
      //                         child: Column(
      //             children: [
      //               InkWell(
      //                 onTap: () => provider.goToPage(
      //                   context, 
      //                   RoutePaths.Profile, 
      //                   shouldProp: true
      //                 ),
      //                 child: DrawerHeader(
      //                   padding: EdgeInsets.fromLTRB(0, -MediaQuery.of(context).padding.top, 0, 0),
      //                   margin: EdgeInsets.all(0),
      //                   child: Container(
      //                     constraints: BoxConstraints.expand(),
      //                     decoration: BoxDecoration(
      //                       // color: Colors.purple,
      //                       image: DecorationImage(
      //                         fit: BoxFit.cover,
      //                         image: AssetImage('assets/worlds-edge.jpg')
      //                       ),
      //                       borderRadius: BorderRadius.only(
      //                         topRight: Radius.circular(8.0)
      //                       )
      //                     ),
      //                     child: Padding(
      //                       padding: const EdgeInsets.all(16.0),
      //                       child: Stack(
      //                         children: [
      //                           Positioned(
      //                             right: 0,
      //                             top: 0,
      //                             child: Icon(
      //                               MdiIcons.arrowRight,
      //                               color: Colors.white,
      //                             )
      //                           ),
      //                           Positioned(
      //                             left: 0,
      //                             top: 0,
      //                             bottom: 0,
      //                             child: Column(
      //                               crossAxisAlignment: CrossAxisAlignment.start,
      //                               mainAxisAlignment: MainAxisAlignment.center,
      //                               children: [
      //                                 Container(
      //                                   width: 72,
      //                                   height: 72,
      //                                   decoration: BoxDecoration(
      //                                     image: DecorationImage(
      //                                       fit: BoxFit.fill,
      //                                       image: AssetImage('assets/chef-3.png')
      //                                     ),
      //                                     shape: BoxShape.circle
      //                                   ),
      //                                 ),
      //                                 SizedBox(height: 16),
      //                                 Text(
      //                                   'Jane Williams',
      //                                   style: TextStyle(
      //                                     color: Colors.white,
      //                                     fontWeight: FontWeight.w500,
      //                                     fontSize: 20,
      //                                   ),
      //                                 ),
      //                                 SizedBox(height: 12),
      //                                 Text(
      //                                   '@janewilliams',
      //                                   style: TextStyle(
      //                                     color: Colors.white70,
      //                                     fontSize: 16,
      //                                   ),
      //                                 )
      //                               ],
      //                             )
      //                           )
      //                         ],
      //                       ),
      //                     )
      //                   )
      //                 ),
      //               ),
      //               SizedBox(height: 24),
      //               ListTile(
      //                 onTap: () => provider.goToPage(context, RoutePaths.Profile, shouldProp: true),
      //                 leading: Icon(
      //                   Icons.person,
      //                   color: Colors.white,
      //                 ),
      //                 title: Text(
      //                   'My Profile',
      //                   style: TextStyle(
      //                     color: Colors.white
      //                   ),
      //                 ),
      //                 trailing: Icon(
      //                   Icons.arrow_forward_ios,
      //                   color: Colors.white,
      //                   size: 16,
      //                 ),
      //               ),
      //               ListTile(
      //                 onTap: () => provider.goToPage(context, RoutePaths.Settings, shouldProp: true),
      //                 leading: Icon(
      //                   Icons.settings,
      //                   color: Colors.white,
      //                 ),
      //                 title: Text(
      //                   'Settings',
      //                   style: TextStyle(
      //                     color: Colors.white
      //                   ),
      //                 ),
      //                 trailing: Icon(
      //                   Icons.arrow_forward_ios,
      //                   color: Colors.white,
      //                   size: 16,
      //                 ),
      //               ),
      //               SizedBox(height: 56),
      //               ListTile(
      //                 title: Text(
      //                   'Notifications',
      //                   style: TextStyle(
      //                     color: Colors.white
      //                   ),
      //                 ),
      //                 trailing: CupertinoSwitch(
      //                   value: false, 
      //                   onChanged: (value) {}
      //                 )
      //               ),
      //               ListTile(
      //                 title: Text(
      //                   'Dark mode',
      //                   style: TextStyle(
      //                     color: Colors.white
      //                   ),
      //                 ),
      //                 trailing: CupertinoSwitch(
      //                   value: true, 
      //                   onChanged: (value) {}
      //                 )
      //               ),
      //               SizedBox(height: 56),
      //               ListTile(
      //                 tileColor: AppColors.GREY,
      //                 title: Text(
      //                   'Logout',
      //                   style: TextStyle(
      //                     color: Colors.white
      //                   ),
      //                 ),
      //                 leading: Icon(
      //                   Icons.close,
      //                   color: AppColors.SECONDARY_COLOR,
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //       ),
      //     )
      //   )
      ],
    );
  }
}