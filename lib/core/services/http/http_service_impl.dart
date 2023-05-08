import 'dart:convert';
import 'package:shop_test/core/exceptions/auth_exception.dart';
import 'package:shop_test/core/models/formatted_response.dart';
import 'package:shop_test/core/services/http/http_service.dart';
import 'package:shop_test/core/services/storage_service/storage_service.dart';
import 'package:shop_test/core/utils/exports.dart';
import 'package:shop_test/core/utils/network_utils.dart' as network_utils;

/// Helper service that abstracts away common HTTP Requests
class HttpServiceImpl extends HttpService {
  // final NavigationService _navigationService = locator<NavigationService>();
  final StorageService _storageService = locator<StorageService>();

  @override
  void setHeader({
    bool formdata = false,
    bool formEncoded = false,
    bool enabledDioLogger = true,
  }) {
    final String storageToken =
        _storageService.getAuthToken(defaultToken: 'null');
    final Map<String, dynamic> header = {
      'content-type': formdata
          ? 'multipart/form-data'
          : formEncoded
              ? 'application/x-www-form-urlencoded'
              : 'application/json',
      'Accept': formdata
          ? 'multipart/form-data'
          : formEncoded
              ? 'application/x-www-form-urlencoded'
              : 'application/json',
    };

    if (storageToken != 'null') {
      header['Authorization'] = 'Bearer $storageToken';
    }

    _dio.options.headers.addAll(header);
    if (enabledDioLogger && dotenv.env['APP_DEBUG'] == 'true') {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 400,
        ),
      );
    }
  }

  final _dio = Dio(BaseOptions(connectTimeout: 100000));

  @override
  void dispose() {
    _dio.interceptors.clear();
    _dio.close(force: true);
  }

  @override
  void clearHeaders() {
    _dio.options.headers.clear();
  }

  @override
  Future<FormattedResponse> getHttp(
    String route, {
    Map<String, dynamic>? params,
    bool refreshed = false,
    bool formdata = false,
  }) async {
    late Response response;
    params?.removeWhere((key, value) => value == null);
    final fullRoute = '${dotenv.env['API']}$route';

    try {
      setHeader(formdata: formdata);
      response = await _dio.get(
        fullRoute,
        queryParameters: params,
        options: Options(
            contentType: 'application/json', responseType: ResponseType.plain),
      );
    } on DioError catch (e) {
      log('HttpService: Failed to GET $fullRoute: Error message: ${e.message}');

      if (e.response?.statusCode == 401) {
        if (Navigator.of(StackedService.navigatorKey!.currentContext!)
            .canPop()) {
          /// Navigate to a default view
        }
        throw const AuthException('Session Expired');
      }

      ErrorHandler.parseError(e);
    } catch (e) {
      log('$e');
    }

    if (response.data.toString().isEmpty) {
      return FormattedResponse(
          success: response.statusCode == 200 ||
              response.statusCode == 201 ||
              response.statusCode == 204,
          data: '');
    }
    try {
      return FormattedResponse(
        success: response.statusCode == 200 ||
            response.statusCode == 201 ||
            response.statusCode == 204,
        data: jsonDecode(
          response.data.toString(),
        ),
      );
    } on FormatException {
      return FormattedResponse(
        success: response.statusCode == 200 ||
            response.statusCode == 201 ||
            response.statusCode == 204,
        data: response.data.toString(),
      );
    }
  }

  @override
  Future<FormattedResponse> postHttp(
    String route,
    Map<String, dynamic> body, {
    Map<String, dynamic>? params,
    bool formdata = false,
    bool formEncoded = false,
    bool decrypt = true,
  }) async {
    late Response response;
    params?.removeWhere((key, value) => value == null);
    body.removeWhere((key, value) => value == null);
    final fullRoute = '${dotenv.env['API']}$route';

    try {
      setHeader(formdata: formdata);
      response = await _dio.post(
        fullRoute,
        data: formdata
            ? FormData.fromMap(body)
            : jsonEncode(formdata ? FormData.fromMap(body) : body),
        queryParameters: params,
        onSendProgress: network_utils.showLoadingProgress,
        onReceiveProgress: network_utils.showLoadingProgress,
        options: Options(
            contentType: formdata
                ? 'multipart/form-data'
                : formEncoded
                    ? 'application/x-www-form-urlencoded'
                    : 'application/json',
            responseType: ResponseType.plain),
      );
    } on DioError catch (e) {
      log('HttpService: Failed to POST ${e.response?.data}');
      if (e.response?.statusCode == 401) {
        if (Navigator.of(StackedService.navigatorKey!.currentContext!)
            .canPop()) {
          /// Navigate to a default view
        }
        throw const AuthException('Session Expired');
      }
      ErrorHandler.parseError(e);
    }

    try {
      return FormattedResponse(
          success: response.statusCode == 200 ||
              response.statusCode == 201 ||
              response.statusCode == 204,
          data: response.data);
    } on FormatException {
      return FormattedResponse(
        success: response.statusCode == 200 ||
            response.statusCode == 201 ||
            response.statusCode == 204,
        data: response.data.toString(),
      );
    }
  }

  @override
  Future<FormattedResponse> downloadHttp(
      String route, dynamic body, String path) async {
    late Response response;
    body?.removeWhere((key, value) => value == null);
    final fullRoute = '${dotenv.env['API']}$route';

    try {
      setHeader();
      response = await _dio.download(
        fullRoute,
        path,
        data: jsonEncode(body),
        options: Options(contentType: 'application/json', method: 'POST'),
      );
    } on DioError catch (e) {
      log('HttpService: Failed to DOWNLOAD ${e.response?.data}');

      if (e.response?.statusCode == 401) {
        if (Navigator.of(StackedService.navigatorKey!.currentContext!)
            .canPop()) {
          /// Navigate to a default view
        }
        throw const AuthException('Session Expired');
      }
      ErrorHandler.parseError(e);
    }

    return FormattedResponse(
      success: response.statusCode == 200,
      data: response.data,
    );
  }

  @override
  Future<FormattedResponse> putHttp(
    String route,
    dynamic body, {
    Map<String, dynamic>? params,
    refreshed = false,
  }) async {
    late Response response;
    params?.removeWhere((key, value) => value == null);
    body?.removeWhere((key, value) => value == null);
    final fullRoute = '${dotenv.env['API']}$route';

    try {
      setHeader();
      response = await _dio.put(
        fullRoute,
        data: jsonEncode(body),
        queryParameters: params,
        onSendProgress: network_utils.showLoadingProgress,
        onReceiveProgress: network_utils.showLoadingProgress,
        options: Options(
            contentType: 'application/json', responseType: ResponseType.plain),
      );
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        if (Navigator.of(StackedService.navigatorKey!.currentContext!)
            .canPop()) {
          /// Navigate to a default view
        }
        throw const AuthException('Session Expired');
      }
      ErrorHandler.parseError(e);
    }

    try {
      return FormattedResponse(
          success: response.statusCode == 200 ||
              response.statusCode == 201 ||
              response.statusCode == 204,
          data: response.data);
    } on FormatException {
      return FormattedResponse(
          success: response.statusCode == 200 ||
              response.statusCode == 201 ||
              response.statusCode == 204,
          data: response.data.toString());
    }
  }

  @override
  Future deleteHttp(
    String route, {
    Map<String, dynamic>? params,
    refreshed = false,
  }) async {
    late Response response;
    params?.removeWhere((key, value) => value == null);

    try {
      setHeader();
      final fullRoute = '${dotenv.env['API']}$route';
      response = await _dio.delete(
        fullRoute,
        queryParameters: params,
        options: Options(
          contentType: 'application/json',
        ),
      );
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {}
      log('HttpService: Failed to DELETE $route: Error message: ${e.message}');
      debugPrint('Http response data is: ${e.response?.data}');
    }

    network_utils.checkForNetworkExceptions(response);
    return network_utils.decodeResponseBodyToJson(response.data as String);
  }
}
