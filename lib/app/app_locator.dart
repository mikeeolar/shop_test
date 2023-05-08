import 'package:shop_test/core/services/utility_service.dart';
import 'package:shop_test/core/utils/exports.dart';
import 'package:shop_test/ui/views/cart/cart_item_viewmodel.dart';
import 'package:shop_test/ui/views/dashboard/dashboard_viewmodel.dart';
import 'package:shop_test/ui/views/main/main_viewmodel.dart';

GetIt locator = GetIt.instance;
Future<void> setUpLocator({bool test = false}) async {
  final Directory appDocDir =
      test ? Directory.current : await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);

  if (!test) {
    locator.registerLazySingleton<HiveInterface>(() => Hive);
  }

  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<DialogService>(
    () => DialogService(),
  );
  locator.registerLazySingleton<SnackbarService>(
    () => SnackbarService(),
  );
  locator.registerLazySingleton<UtilityService>(() => UtilityService());

  locator.registerSingleton<MainViewModel>(MainViewModel());
  locator.registerSingleton<DashboardViewModel>(DashboardViewModel());
  locator.registerSingleton<CartItemViewModel>(CartItemViewModel());
}
