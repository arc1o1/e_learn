import 'package:flutter/material.dart';

class AuthNotifier with ChangeNotifier {
  // sign-in variables
  bool _hideSigninPassword = true;
  bool get hideSigninPassword => _hideSigninPassword;

  // sign-up variables
  bool _hideSignupPassword = true;
  bool get hideSignupPassword => _hideSignupPassword;

  int _currentStep = 0;
  int get currentStep => _currentStep;

  String _role = "Student";
  String get role => _role;

  // --------------------------------------------------------------------------- sign-in
  // set passwod visibility on sign in page
  void setSigninPasswordVisibility({required bool hide}) {
    _hideSigninPassword = hide;
    notifyListeners();
  }

  // --------------------------------------------------------------------------- sign-up
  // set passwod visibility on sign up page
  void setSignupPasswordVisibility({required bool hide}) {
    _hideSignupPassword = hide;
    notifyListeners();
  }

  // set current stepper index
  void setCurrentStep({required int step}) {
    _currentStep = step;
    notifyListeners();
  }

  // set role of the user
  void setRole({required String role}) {
    _role = role;
    notifyListeners();
  }
}
