import 'package:stacked/stacked.dart';

class UtilityService with ListenableServiceMixin {
  bool _showNav = false;
  bool get showNav => _showNav;
  int index = 0;

  UtilityService() {
    listenToReactiveValues([
      _showNav,
    ]);
  }

  void setShowNav(bool val) {
    _showNav = val;
    notifyListeners();
  }

  void setIndex(int val) {
    index = val;
    notifyListeners();
  }
}
