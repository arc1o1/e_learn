// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:e_learn/services/environment_service.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

import 'package:e_learn/services/auth_service.dart';
import 'package:e_learn/services/token_services.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<Dio>(
    () {
      // get api base url from env
      String API_BASE_URL = EnvironmentService.appBaseUrl;

      final dio = Dio(BaseOptions(baseUrl: API_BASE_URL));
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            // Add JWT token to request headers
            final token = await locator<TokenService>().getAccessToken();

            if (token != null) {
              options.headers['Authorization'] = 'Bearer $token';
            }
            return handler.next(options);
          },
        ),
      );
      return dio;
    },
  );

  locator.registerLazySingleton<AuthService>(() => AuthService(locator<Dio>()));
  locator.registerLazySingleton<TokenService>(() => TokenService());
  locator.registerLazySingleton<GetStorage>(() => GetStorage());
}
