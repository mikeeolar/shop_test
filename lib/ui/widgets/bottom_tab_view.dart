import 'package:shop_test/core/services/utility_service.dart';
import 'package:shop_test/core/utils/exports.dart';
import 'package:shop_test/ui/views/main/main_viewmodel.dart';
import 'package:shop_test/ui/widgets/utility_widget.dart';

class BottomTabView extends StatelessWidget {
  const BottomTabView({
    super.key,
    required UtilityService utilityService,
    required this.child,
  }) : _utilityService = utilityService;

  final Widget child;
  final UtilityService _utilityService;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      builder: (ctx, model, c) => Overlay(
        initialEntries: [
          OverlayEntry(
            builder: (context) => Scaffold(
              body: child,
              bottomNavigationBar: model.showNav
                  ? BottomNavigationBar(
                      backgroundColor: HexColor('#EEEFF1'),
                      type: BottomNavigationBarType.fixed,
                      elevation: 10,
                      onTap: (val) {
                        if (locator<MainViewModel>().currentIndex == val) {
                          StackedService.navigatorKey?.currentState
                              ?.popUntil((route) => route.isFirst);
                        } else {
                          _utilityService.setIndex(val);
                          StackedService.navigatorKey?.currentState
                              ?.popUntil((route) => route.isFirst);
                        }
                      },
                      currentIndex: _utilityService.index,
                      selectedLabelStyle:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                      unselectedLabelStyle:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                      unselectedItemColor: HexColor('#959AA8'),
                      selectedItemColor: Colors.black,
                      items: <BottomNavigationBarItem>[
                        bottomBarItem(
                          name: 'Home',
                          icon: 'home'.svg,
                          activeIcon: 'home_fill'.svg,
                          cIndex: _utilityService.index,
                          index: 0,
                          context: context,
                        ),
                        bottomBarItem(
                          name: 'Voucher',
                          icon: 'vouch'.svg,
                          activeIcon: 'vouch_fill'.svg,
                          cIndex: _utilityService.index,
                          index: 1,
                          height: 15,
                          width: 15,
                          context: context,
                        ),
                        bottomBarItem(
                          name: 'Wallet',
                          icon: 'wallet'.svg,
                          activeIcon: 'wallet_fill'.svg,
                          cIndex: _utilityService.index,
                          index: 2,
                          context: context,
                        ),
                        bottomBarItem(
                          name: 'Settings',
                          icon: 'settings'.svg,
                          activeIcon: 'settings_fill'.svg,
                          cIndex: _utilityService.index,
                          index: 3,
                          context: context,
                        ),
                      ],
                    )
                  : const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}
