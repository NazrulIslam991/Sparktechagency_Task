import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../../data/sources/shares_preference/shared_preference.dart';
import '../routes/route_name.dart';
import 'api_clients.dart';
import 'api_end_points.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;
  static bool _isRefreshing = false;
  static Completer<bool>? _refreshCompleter;

  AuthInterceptor(this.dio);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 &&
        err.requestOptions.path != '/${ApiEndpoints.refreshToken}') {
      if (_isRefreshing) {
        log(
          "\n\n*********************** Refresh already in progress, waiting...*********************",
        );
        final isSuccess = await _refreshCompleter?.future;
        if (isSuccess == true) {
          return handler.resolve(await _retry(err.requestOptions));
        }
      }

      log(
        "\n\n***********************  401 Error detected. Trying to refresh...*********************** ",
      );
      _isRefreshing = true;
      _refreshCompleter = Completer<bool>();

      bool isRefreshed = await _handleTokenRefresh();

      _isRefreshing = false;
      _refreshCompleter?.complete(isRefreshed);

      if (isRefreshed) {
        return handler.resolve(await _retry(err.requestOptions));
      } else {
        log(
          "\n\n*********************** Refresh failed. Logging out...*********************** ",
        );
        await SharedPreferenceData.removeToken();
        await SharedPreferenceData.removeRefreshToken();
        if (navigatorKey.currentState != null) {
          navigatorKey.currentState!.pushNamedAndRemoveUntil(
            RouteName.loginScreen,
            (route) => false,
          );
        }
      }
    }
    return handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        error: "Session expired. Please login again.",
        type: DioExceptionType.cancel,
      ),
    );
  }

  Future<bool> _handleTokenRefresh() async {
    try {
      log(
        "\n\n*********************** Refresh Token API call start...*********************** ",
      );
      final refreshToken = await SharedPreferenceData.getRefreshToken();

      if (refreshToken == null || refreshToken.isEmpty) {
        log("No refresh token found.");
        return false;
      }

      final freshDio = Dio(BaseOptions(baseUrl: ApiEndpoints.baseUrl));
      final response = await freshDio.post(
        '/${ApiEndpoints.refreshToken}',
        data: {"refreshToken": refreshToken},
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        log(
          "\n\n***********************  Token Refreshed Successfully!*********************** ",
        );
        final newToken = response.data['access_token'];
        final newRefreshToken = response.data['refresh_token'];

        await SharedPreferenceData.setToken(newToken);
        if (newRefreshToken != null) {
          await SharedPreferenceData.setRefreshToken(newRefreshToken);
        }

        await ApiClient.headerSet(newToken);
        return true;
      }
      return false;
    } catch (e) {
      log(
        "\n\n***********************  Refresh token process failed: $e *********************** ",
      );
      return false;
    }
  }

  Future<Response> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: ApiClient.headers,
    );
    return dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
