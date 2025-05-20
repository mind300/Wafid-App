import 'dart:io';


import 'package:dio/dio.dart';

import '../../local/shared_preferences/shared_pref_services.dart';
import '../app_configs.dart';
import '../dio/dio_factory.dart';
import '../dio/error_handler.dart';

class ApiService {
  final Dio _dio = DioFactory.getDio();
  //
  // Future<Map<String, dynamic>> login(
  //   String email,
  //   String password,
  //   bool rememberMe,
  // ) async {
  //   try {
  //     final response = await _dio.post(
  //       AppConfigs.login,
  //       data: {'email': email, 'password': password, 'remember_me': rememberMe},
  //     );
  //
  //     return response.data;
  //   } on DioException catch (e) {
  //     throw ErrorHandler.handle(e);
  //   }
  // }



}
