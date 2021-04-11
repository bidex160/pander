import 'package:flutter/widgets.dart';

class DiscoverPageProvider extends ChangeNotifier {
  int currentPage = 0;
  PageController controller = PageController(initialPage: 0);

  void changePage(int newPage) {
    if (newPage == currentPage) return;

    controller.animateToPage(
      newPage, 
      duration: Duration(milliseconds: 500), 
      curve: Curves.easeIn
    );
    currentPage = newPage;
    notifyListeners();
  }

  void onPageChanged(int newPage) {
    if (newPage == currentPage) return;
    
    currentPage = newPage;
    notifyListeners();
  }
}