import 'package:shop_test/core/constants/config.dart';
import 'package:shop_test/core/managers/lifecycle_manager.dart';
import 'package:shop_test/core/services/utility_service.dart';
import 'package:shop_test/styles/theme/theme.dart' as theme;

import 'package:shop_test/core/utils/exports.dart';
import 'package:shop_test/ui/views/main/main_view.dart';
import 'package:shop_test/ui/widgets/bottom_tab_view.dart';

bool get isInDebugMode {
  // Assume you're in production mode.
  bool inDebugMode = false;

  // Assert expressions are only evaluated during development. They are ignored
  // in production. Therefore, this code only sets `inDebugMode` to true
  // in a development environment.
  assert(inDebugMode = true);

  return inDebugMode;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(Utils.lightdarkNav);
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   systemNavigationBarColor: Colors.red,
  // ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Config.loadEnv();
  await setUpLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UtilityService _utilityService = locator<UtilityService>();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (c, _) => LifeCycleManager(
        child: MaterialApp(
          title: 'Shop',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter().onGenerateRoute,
          navigatorKey: StackedService.navigatorKey,
          theme: theme.lightTheme,
          home: const MainView(),
          navigatorObservers: [
            StackedService.routeObserver,
          ],
          builder: (context, child) {
            return BottomTabView(
              utilityService: _utilityService,
              child: child!,
            );
          },
        ),
      ),
    );
  }
}
