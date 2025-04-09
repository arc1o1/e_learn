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

            // List of public endpoints that do NOT need a token
            final publicPaths = ['sign-up/', 'token/', 'token_refresh/'];

            bool isPublic = publicPaths.any(
              (path) => options.path.contains(path),
            );

            // if it is not a public path and token is not null
            if (!isPublic && token != null) {
              options.headers['Authorization'] = 'Bearer $token';
            }

            return handler.next(options);
          },
          onError: (DioException e, handler) async {
            // If token expired
            if (e.response?.statusCode == 401 ||
                e.response?.statusCode == 403) {
              final newToken = await locator<AuthService>().refreshToken();
              if (newToken != null) {
                final retryOptions = e.requestOptions;
                retryOptions.headers['Authorization'] = 'Bearer $newToken';

                final cloneReq = await dio.fetch(retryOptions);
                return handler.resolve(cloneReq);
              }
            }
            return handler.next(e);
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
