import 'package:shop_test/core/utils/exports.dart';

import 'package:shop_test/core/utils/network_utils.dart' as network_utils;

class ErrorHandler {
  static parseError(dynamic e, [bool decrypt = true]) {
    Map data = network_utils.decodeResponseBodyToJson(
        decrypt ? Utils.decryptData(e.response?.data) : e.response?.data);
    if (e.response == null) {
      throw const NetworkException('Connection error');
    }
    if (data is String) {
      if (data['errors'] is String) {
        throw NetworkException(
          data.isNotEmpty
              ? data['errors'] != null
                  ? data['errors'][0]
                  : e.message
              : e.message,
        );
      } else if (data['errors'].runtimeType is List) {
        String error = '';
        for (String item in data['errors']) {
          bool nextLine = error.isNotEmpty;
          error = '$error$item${nextLine ? '\n' : ''}';
        }
        throw NetworkException(error);
      } else {
        String error = '';
        Map<String, dynamic> errors = data['errors'];
        for (String item in errors.keys) {
          bool nextLine = error.isNotEmpty;
          error = '$error${errors[item]}${nextLine ? '\n' : ''}';
        }
        throw NetworkException(error);
      }
    } else {
      if (data['errors'] is String) {
        throw NetworkException(data.isEmpty
            ? data['errors'] != null
                ? data['errors'][0]
                : e.message
            : e.message);
      } else if (data['errors'] is List) {
        String error = '';
        for (String item in data['errors']) {
          bool nextLine = error.isNotEmpty;
          error = '$error$item${nextLine ? '\n' : ''}';
        }
        throw NetworkException(error);
      } else {
        String error = '';
        Map<String, dynamic> errors = data['errors'];
        for (String item in errors.keys) {
          bool nextLine = error.isNotEmpty;
          error = '$error${errors[item]}${nextLine ? '\n' : ''}';
        }
        throw NetworkException(error);
      }
    }
  }
}
