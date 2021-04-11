import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pander/core/base_page.dart';
import 'package:pander/core/constants/app_colors.dart';
import 'package:pander/core/constants/app_styles.dart';
import 'package:pander/core/pages/discover/discover_page_provider.dart';
import 'package:pander/core/pages/discover/widgets/header_item.dart';
import 'package:pander/core/pages/discover/widgets/laundry_section.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage<DiscoverPageProvider>(
      child: null,
      model: DiscoverPageProvider(),
      builder: (context, provider, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 48, 20, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello 👋🏾,',
                              style: AppStyles.textLGBlack.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: 20
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'John Doe',
                              style: AppStyles.textLGBlack.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(MdiIcons.bell),
                        color: Colors.black54, 
                        onPressed: () {}
                      ),
                      // SizedBox(width: 16),
                      IconButton(
                        icon: Icon(MdiIcons.phone), 
                        color: Colors.black54, 
                        onPressed: () {}
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Select the kind of service you want',
                    style: AppStyles.textLGBlack.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.BLUE
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: HeaderItem(
                          onClick: () => provider.changePage(0),
                          isActive: provider.currentPage == 0,
                          title: 'All'
                        )
                      ),
                      Expanded(
                        child: HeaderItem(
                          onClick: () => provider.changePage(1),
                          isActive: provider.currentPage == 1,
                          title: 'Laundry'
                        )
                      ),
                      Expanded(
                        child: HeaderItem(
                          onClick: () => provider.changePage(2),
                          isActive: provider.currentPage == 2,
                          title: 'Clothcare'
                        )
                      ),
                    ]
                  ),
                  SizedBox(height: 24),
                  // TODO: use sliverlists
                  Expanded(
                    child: PageView(
                      controller: provider.controller,
                      onPageChanged: provider.onPageChanged,
                      children: [
                        LaundrySection(),
                        LaundrySection(),
                        LaundrySection(),
                      ],
                    ),
                  ),
                  // Text(
                  //   'Special Offers',
                  //   style: AppStyles.textMDBlack.copyWith(
                  //     color: Colors.black54
                  //   ),
                  // ),
                  // SizedBox(height: 86),
                  // Text(
                  //   'Special Offers',
                  //   style: AppStyles.textMDBlack.copyWith(
                  //     color: Colors.black54
                  //   ),
                  // ),
                  
                ],
              ),
            )
          )
        );
      },
    );
  }
}