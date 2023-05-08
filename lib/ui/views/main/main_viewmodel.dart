import 'package:shop_test/core/services/utility_service.dart';
import 'package:shop_test/core/utils/exports.dart';

class MainViewModel extends ReactiveViewModel {
  final UtilityService _utilityService = locator<UtilityService>();
  bool get showNav => _utilityService.showNav;
  int get currentIndex => _utilityService.index;
  bool menu = false;

  void showMenu() {
    menu = !menu;
    rebuildUi();
  }

  void setIndex(int val) {
    _utilityService.setIndex(val);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_utilityService];
}
