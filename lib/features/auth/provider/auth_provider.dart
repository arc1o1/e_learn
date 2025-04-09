import 'package:e_learn/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  AuthProvider(this._authService);

  final AuthService _authService;

  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  // signin
  Future<bool> signin({required String email, required String password}) async {
    var success = await _authService.signin(email: email, password: password);
    debugPrint(success.toString());

    if (success) {
      _isAuthenticated = true;
      // await _updateUser();
      notifyListeners();
    }

    return success;
  }

  // signup
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
    var success = await _authService.signup(
      email: email,
      password: password,
      username: username,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      role: role,
      schoolName: schoolName,
      classLevel: classLevel,
      nidaId: nidaId,
      taiId: taiId,
      context: context,
    );
    debugPrint('sign-up completed successful: $success');

    if (success) {
      _isAuthenticated = true;
      // await _updateUser();
      notifyListeners();
    }

    return success;
  }

  // sign out
  Future<void> signout() async {
    await _authService.signout();
    _isAuthenticated = false;
    notifyListeners();
  }
}
