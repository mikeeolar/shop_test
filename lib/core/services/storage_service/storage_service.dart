import 'package:shop_test/core/utils/exports.dart';

class StorageService {
  final _hiveService = locator<HiveInterface>();

  bool get _isBoolBoxOpen => _hiveService.isBoxOpen(HiveBox.bools);
  Box<bool> get _boolBox => _hiveService.box<bool>(HiveBox.bools);

  bool get _isStringBoxOpen => _hiveService.isBoxOpen(HiveBox.strings);
  Box<String> get _stringsBox => _hiveService.box<String>(HiveBox.strings);

  static const String authToken = "TOKEN";
  static const String authRefreshToken = "REFRESH_TOKEN";

  Future<void> init() async {
    if (!_isBoolBoxOpen) {
      await _hiveService.openBox<bool>(HiveBox.bools);
    }
    if (!_isStringBoxOpen) {
      await _hiveService.openBox<String>(HiveBox.strings);
    }
  }

  void setAuthToken({required String token}) {
    _stringsBox.put(authToken, token);
  }

  String getAuthToken({String? defaultToken}) {
    String? value = _stringsBox.get(authToken);
    if (value == null) {
      return defaultToken!;
    }
    return value;
  }

  void addString(String key, String value) {
    _stringsBox.put(key, value);
  }

  String? getString(String key) {
    return _stringsBox.get(key);
  }

  void removeString(String key) {
    _stringsBox.delete(key);
  }

  void addBool(String key, bool value) {
    _boolBox.put(key, value);
  }

  bool? getBool(String key) {
    return _boolBox.get(key);
  }

  void removeBool(String key) {
    _boolBox.delete(key);
  }
}
