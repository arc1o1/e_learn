import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:e_learn/features/auth/model/user.dart';
import 'package:e_learn/utils/constants/custom_loader.dart';

import 'package:e_learn/services/token_services.dart';
import 'package:flutter/material.dart';

class AuthService {
  AuthService(this._dio);

  // ignore: prefer_final_fields
  Dio _dio = Dio();

  final scholar = User.empty();

  // login service
  Future<bool> signin({required String email, required String password}) async {
    try {
      final response = await _dio.post(
        '/token',
        data: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final token = response.data;
        if (token != null) {
          // decode the token
          var decodedToken = jsonDecode(token);

          // save the token
          await TokenService().saveAccessToken(decodedToken['access']);
          await TokenService().saveRefreshToken(decodedToken['refresh']);

          // return true
          return true;
        }
      }
    } catch (e) {
      debugPrint('Sign-In Attempt Failed with an error: $e');
    }
    return false;
  }

  // sign up aervice
  Future<bool> signup({
    required String email,
    required String password,
    required String username,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String role,
    required String schoolName,
    required String classLevel,
    required String nidaId,
    required String taiId,
    required BuildContext context,
  }) async {
    try {
      // signup data
      final Map<String, dynamic> signupData = {
        'email': email,
        'password': password,
        'username': username,
        'first_name': firstName,
        'last_name': lastName,
        'phone_number': phoneNumber,
        'role': role,
        'school_name': schoolName,
        'class_level': classLevel,
        'nida_id': nidaId,
        'tai_id': taiId,
      };

      debugPrint("payload being sent is: $signupData");

      // create a response request
      final response = await _dio.post(
        '/api/sign-up/',
        data: jsonEncode(signupData),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = response.data;
        if (responseData != null) {
          // decode the token
          var decodedResponse = jsonDecode(responseData);

          // save the token
          await TokenService().saveAccessToken(decodedResponse['token']);
          await TokenService().saveRefreshToken(decodedResponse['refresh']);

          // save user

          // return true
          return true;
        }
      }
    } catch (e) {
      debugPrint('Sign-Up Attempt Failed: $e');
      CustomLoader.errorSnackbar(
        title: 'Sign-Up Attempt Failed',
        message: e.toString(),
        // ignore: use_build_context_synchronously
        context: context,
      );
    }
    return false;
  }

  Future<void> signout() async {
    await TokenService().deleteAccessToken();
  }

  // decode payload from jwt
  Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('Invalid token');
    }
    final payload =
        utf8.decode(base64Url.decode(base64Url.normalize(parts[1])));
    return json.decode(payload);
  }
}
