import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pander/core/base_page.dart';
import 'package:pander/core/pages/discover/discover.dart';
import 'package:pander/core/pages/home/widgets/home_drawer.dart';
import 'package:pander/core/pages/home/home_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomePageProvider>(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: provider.currentIndex,
        onTap: (index) => provider.setCurrentIndex(index, context),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.red,
        type: BottomNavigationBarType.shifting,
        items: [
          getBottomNavigationBarItem(
            0, 
            provider.currentIndex, 
            Icons.home_outlined,
            'Home'
          ),
          getBottomNavigationBarItem(
            1, 
            provider.currentIndex, 
            MdiIcons.cartOutline,
            'Orders'
          ),
          getBottomNavigationBarItem(
            2, 
            provider.currentIndex, 
            Icons.person_outline,
            'Profile'
          ),
          getBottomNavigationBarItem(
            3, 
            provider.currentIndex, 
            Icons.settings_outlined,
            'Settings'
          ),
        ],
      ),
      body: getWidgetForIndex(provider.currentIndex),
    );
  }
}

Widget getWidgetForIndex(int index) {
  switch (index) {
    case 0:
      return DiscoverPage();
    case 1:
      return Center(
        child: Text('Hello, another page!'),
      );  
    case 2:
      return Center(
        child: Text('Hello, another page!'),
      );
    case 3:
      return Center(
        child: Text('Hello, another page!'),
      );
    default:
      return Center(
        child: Text('Don\'t know what to tell ya. You\'re lost!'),
      );
  }
}

BottomNavigationBarItem getBottomNavigationBarItem(
  int index, 
  int currentIndex, 
  IconData icon,
  String label
) {
  return BottomNavigationBarItem(
    label: label,
    icon: Container(
      decoration: BoxDecoration(
        boxShadow: currentIndex == index 
          ? [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]
          : null,
        color: currentIndex == index ? Color(0xFFFC1E19) : null,
        shape: BoxShape.circle,
      ),
      padding: EdgeInsets.all(8.0),
      child: Icon(
        icon,
        // color: Colors.black,
        color: currentIndex == index ? Colors.white : Colors.black54,
      ),
    ),
  );
}