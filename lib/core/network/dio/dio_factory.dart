

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../local/secure_storage/secure_storage.dart';
import '../../routing/routes.dart';
import '../../utils/constants.dart';
import '../../utils/dialog_utils.dart';
import '../../widgets/shared_constants.dart';
import '../app_configs.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 160);

    if (dio == null) {
      dio = Dio();

      // 🛡️ Allow self-signed SSL certificate in debug mode only
      if (kDebugMode) {
        (dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
            (HttpClient client) {
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
          return client;
        };
      }

      dio!
        ..options.baseUrl = AppConfigs.baseUrl
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;

      addDioHeaders();
      addDioInterceptor();
    }

    return dio!;
  }

  static void addDioHeaders() async {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization':
      'Bearer ${await SecureStorage.getData(key: ConstantsText.userToken)}'
    };
  }

  static void saveNewToken(String token) {
    dio?.options.headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };
  }

  static void removeToken() {
    dio?.options.headers = {
      'Authorization': 'Bearer ',
      'Accept': 'application/json',
    };
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );

    dio?.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        addDioHeaders();
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioException error, handler) async {
        if (error.response?.statusCode == 401) {
          DialogUtils.showMessage(
            navigatorKey.currentState!.context,
            'Your Session is Time Out',
            posActionTitle: "Ok",
            posAction: () async {
              await removeUserLoginInfo();
              await SecureStorage.deleteData(key: ConstantsText.userToken);
              removeToken();
              navigatorKey.currentState?.pushNamed(Routes.loginScreen);
            },
          );
        }

        debugPrint(
            "**${error.response?.statusCode}***${(await SecureStorage.getData(key: ConstantsText.userToken))}***********|||||||||||||||***************** ${error.response?.statusMessage} *****************||||||||||||||************");
        return handler.next(error);
      },
    ));
  }
}

Future<void> setToken(String token) async {
  await SecureStorage.saveData(key: ConstantsText.userToken, value: token);
  DioFactory.saveNewToken(token);
  Constants.showToast(msg: "GEt New Token");
}
