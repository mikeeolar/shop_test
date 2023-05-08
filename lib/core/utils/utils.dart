import 'package:encrypt/encrypt.dart';
import 'package:encrypt/encrypt.dart' as prefix0;
import 'package:shop_test/core/utils/exports.dart';

class Utils {
  static final SystemUiOverlayStyle light = Platform.isIOS
      ? const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.dark)
      : const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.dark);

  static final SystemUiOverlayStyle lightWhiteNav = Platform.isIOS
      ? SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: HexColor('#EEEFF1'),
          systemNavigationBarIconBrightness: Brightness.dark)
      : SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: HexColor('#EEEFF1'),
          systemNavigationBarIconBrightness: Brightness.light);

  static final SystemUiOverlayStyle lightdarkNav = Platform.isIOS
      ? SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: HexColor('#EEEFF1'),
          systemNavigationBarIconBrightness: Brightness.light)
      : SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: HexColor('#EEEFF1'),
          systemNavigationBarIconBrightness: Brightness.light);

  static final SystemUiOverlayStyle dark = Platform.isIOS
      ? SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: HexColor('#EEEFF1'),
          systemNavigationBarIconBrightness: Brightness.dark)
      : SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: HexColor('#EEEFF1'),
          systemNavigationBarIconBrightness: Brightness.dark);

  static final SystemUiOverlayStyle darkWhiteNav = Platform.isIOS
      ? SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: HexColor('#EEEFF1'),
          systemNavigationBarIconBrightness: Brightness.light)
      : SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: HexColor('#EEEFF1'),
          systemNavigationBarIconBrightness: Brightness.dark);

  static final SystemUiOverlayStyle greenNav = Platform.isIOS
      ? const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: BrandColors.primary,
          systemNavigationBarIconBrightness: Brightness.light,
        )
      : const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: BrandColors.primary,
          systemNavigationBarIconBrightness: Brightness.dark,
        );

  static final iv = IV.fromUtf8(dotenv.env['IV'] ?? '');

  static Encrypter crypt() {
    final appKey = dotenv.env['ENCRYPTION_APP_KEY'];
    final key = prefix0.Key.fromUtf8(appKey ?? '');
    return Encrypter(AES(key, mode: prefix0.AESMode.cbc));
  }

  static String encryptData(String data) {
    return crypt().encrypt(data, iv: iv).base64;
  }

  static String decryptData(String data) {
    return crypt().decrypt64(data, iv: iv);
  }
}
