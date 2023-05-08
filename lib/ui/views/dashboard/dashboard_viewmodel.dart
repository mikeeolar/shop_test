import 'package:shop_test/core/services/utility_service.dart';
import 'package:shop_test/core/utils/exports.dart';

class DashboardViewModel extends ReactiveViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final UtilityService _utilityService = locator<UtilityService>();

  void navigateToDashItemView() {
    locator<UtilityService>().setShowNav(false);
    _navigationService.navigateTo(Routes.cartItem);
    // Navigator.of(context).push(CustomPageRoute(
    //   child: const CartItemView(),
    //   direction: AxisDirection.up,
    // ));
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _utilityService,
      ];
}
