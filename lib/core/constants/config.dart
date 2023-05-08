import 'package:shop_test/core/utils/exports.dart';

abstract class Config {
  static Future<void> loadEnv() async {
    const String env = String.fromEnvironment('app.env');
    log('Mode: $env');
    const envFile = 'env/$env.env';
    await dotenv.load(fileName: envFile);
  }
}
