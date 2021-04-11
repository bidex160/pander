import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePageProvider extends ChangeNotifier {
  int _currentIndex = 0;
  String _currentIndexTitle = 'Some title';

  int get currentIndex => _currentIndex;
  String get currentIndexTitle => _currentIndexTitle;
  bool get shouldShowBack => _currentIndex != 0;

  void setCurrentIndex(int index, BuildContext context) {
    _currentIndex = index;
    _currentIndexTitle = getTitleForIndex(index);
    notifyListeners();
  }

  void setCurrentIndexTitle(String title) {
    _currentIndexTitle = title;
    notifyListeners();
  }

  void toggleDrawer(BuildContext context) {
    var scaffoldState = Scaffold.of(context);
    if (scaffoldState.isDrawerOpen) {
      Navigator.of(context).pop();
    } else {
      print('drawer opened');
      scaffoldState.openDrawer();
    }
  }

  void closeDrawer(BuildContext context) {
    Navigator.of(context).pop();
  }

  void goToPage(BuildContext context, String route, {bool shouldProp: false}) {
    if (shouldProp) {
      Navigator.of(context).popAndPushNamed(route);
    } else {
      Navigator.of(context).pushNamed(route);
    }
  }

  String getTitleForIndex(int index) {
    switch (index) {
      case 3:
        return 'Booking History';
      default:
        return 'Some title';
    }
  }
}