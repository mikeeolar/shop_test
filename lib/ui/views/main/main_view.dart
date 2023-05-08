import 'package:shop_test/core/services/utility_service.dart';
import 'package:shop_test/core/utils/exports.dart';
import 'package:shop_test/ui/views/main/main_viewmodel.dart';
import 'package:shop_test/ui/widgets/animation/fade_in.dart';
import 'package:shop_test/ui/widgets/lazy_indexed_stack.dart';
import 'package:shop_test/ui/widgets/partial_builds.dart';

import '../dashboard/dashboard_view.dart';

class MainView extends StatefulWidget {
  const MainView({
    Key? key,
  }) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final List<Widget> _pages = [
    const DashboardView(),
    const DashboardView(),
    const DashboardView(),
    const DashboardView(),
  ];

  final Duration duration = const Duration(milliseconds: 250);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        locator<MainViewModel>().setIndex(0);
        locator<UtilityService>().setShowNav(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ReactivePartialBuild<MainViewModel>(builderr: (context, model) {
      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: Utils.darkWhiteNav,
        child: WillPopScope(
          onWillPop: () async {
            if (model.currentIndex != 0) {
              model.setIndex(0);
              return false;
            }
            return true;
          },
          child: Stack(
            children: [
              AnimatedContainer(
                duration: duration,
                width: 375.w,
                height: 812.h,
                foregroundDecoration: BoxDecoration(
                    color: model.menu
                        ? Colors.black.withOpacity(.3)
                        : Colors.transparent),
                child: Scaffold(
                  body: Stack(
                    children: [
                      Visibility(
                          visible: model.currentIndex == 1,
                          child: _pages[model.currentIndex]),
                      Visibility(
                        visible: model.currentIndex != 1,
                        maintainState: true,
                        child: LazyIndexedStack(
                            itemBuilder: (_, index) =>
                                FadeIn(child: _pages[index]),
                            index: model.currentIndex,
                            itemCount: _pages.length),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
