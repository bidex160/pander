import 'package:pander/core/base_page.dart';
import 'package:pander/core/pages/home/home.dart';
import 'package:pander/core/pages/home/home_page_provider.dart';
import 'package:pander/core/pages/home/widgets/home_drawer.dart';
import 'package:flutter/material.dart';

class HomeContainer extends StatefulWidget {
  @override
  _HomeContainerState createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  @override
  Widget build(BuildContext context) {
    return BasePage<HomePageProvider>(
      child: null,
      model: HomePageProvider(),
      builder: (context, provider, child) {
        return Scaffold(
          drawer: HomeDrawer(),
          body: Home()
        );
      },
    );
  }
}