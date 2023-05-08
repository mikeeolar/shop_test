import 'package:shop_test/core/utils/exports.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: createMaterialColor(BrandColors.light),
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    background: Color(0xFF212121),
    secondary: Colors.white,
  ),
  fontFamily: 'Montserrat',
  iconTheme: const IconThemeData(color: Colors.white),
  // floatingActionButtonTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
);

ThemeData lightTheme = ThemeData(
  primarySwatch: createMaterialColor(BrandColors.primary),
  primaryColor: BrandColors.primary,
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(background: BrandColors.light),
  scaffoldBackgroundColor: BrandColors.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: AppBarTheme(
    elevation: 0,
    systemOverlayStyle: Utils.darkWhiteNav,
    color: Colors.transparent,
    iconTheme: const IconThemeData(color: Colors.black),
  ),
  textTheme: TextTheme(
    displayLarge: const TextStyle().copyWith(color: Colors.white),
    displayMedium: const TextStyle().copyWith(color: Colors.white),
    displaySmall: const TextStyle().copyWith(color: Colors.white),
    headlineMedium: const TextStyle().copyWith(color: Colors.white),
    headlineSmall: const TextStyle().copyWith(color: Colors.white),
  ),
  primaryTextTheme: TextTheme(
      titleLarge: const TextStyle().copyWith(
    color: Colors.white,
    fontWeight: FontWeight.w600,
  )),
  iconTheme: const IconThemeData(color: Colors.white),
  fontFamily: 'Montserrat',
  dividerColor: Colors.black12,
  cardColor: Colors.white54,
  textSelectionTheme: const TextSelectionThemeData(
      selectionColor: BrandColors.primary,
      cursorColor: BrandColors.primary,
      selectionHandleColor: BrandColors.indigo),
  highlightColor: BrandColors.primary,
);

MaterialColor createMaterialColor(Color color) {
  final List<double> strengths = <double>[.05];
  final Map<int, Color> swatch = <int, Color>{};
  final int r = color.red;
  final int g = color.green;
  final int b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (final strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
