import 'package:flutter/widgets.dart';

class OnboardingPageProvider extends ChangeNotifier {
  PageController pageController = PageController();

  int activePage = 0;

  void pageChanged(int index) {
    activePage = index;
    notifyListeners();
  }
}