import 'dart:io';

import 'package:e_learn/features/auth/provider/auth_provider.dart';
import 'package:e_learn/services/routes.dart';
import 'package:e_learn/utils/constants/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupViewModel extends ChangeNotifier {
  // var
  bool _hideSignupPassword = true;
  bool get hideSignupPassword => _hideSignupPassword;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool initiateSignupChecks = false;

  String _role = "Student";
  String get role => _role;

  String _classLevel = "Nursery";
  String get classLevel => _classLevel;

  // controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController schoolNameController = TextEditingController();
  final TextEditingController nidaIdController = TextEditingController();
  final TextEditingController taiIdController = TextEditingController();

  // form key
  GlobalKey<FormState> namesKey = GlobalKey<FormState>();
  GlobalKey<FormState> usernamesKey = GlobalKey<FormState>();
  GlobalKey<FormState> othersKey = GlobalKey<FormState>();

  // files
  File? profileImage;
  File? taiIdImage;

  // set passwod visibility on sign up page
  void setSignupPasswordVisibility({required bool hide}) {
    _hideSignupPassword = hide;
    notifyListeners();
  }

  // set role of the user
  void setRole({required String role}) {
    _role = role;
    notifyListeners();
  }

  // set class level of the student
  void setClassLevel({required String classLevel}) {
    _classLevel = classLevel;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void checkSignupForm(BuildContext context) {
    if (firstNameController.text.isEmpty) {
      CustomLoader.errorSnackbar(
          title: "First Name Field is missing",
          message: "First Name Field is Empty. All Fields are mandatory",
          context: context);
      return;
    }

    if (lastNameController.text.isEmpty) {
      CustomLoader.errorSnackbar(
          title: "Last Name Field is missing",
          message: "Last Name Field is Empty. All Fields are mandatory",
          context: context);
      return;
    }

    if (usernameController.text.isEmpty) {
      CustomLoader.errorSnackbar(
          title: "Username Field is missing",
          message: "Username Field is Empty. All Fields are mandatory",
          context: context);
      return;
    }

    if (phoneNumberController.text.isEmpty) {
      CustomLoader.errorSnackbar(
          title: "Phone Number Field is missing",
          message: "Phone Number Field is Empty. All Fields are mandatory",
          context: context);
      return;
    }

    if (emailController.text.isEmpty) {
      CustomLoader.errorSnackbar(
          title: "Email Field is missing",
          message: "Email Field is Empty. All Fields are mandatory",
          context: context);
      return;
    }

    if (passwordController.text.isEmpty) {
      CustomLoader.errorSnackbar(
          title: "Password Field is missing",
          message: "Password Field is Empty. All Fields are mandatory",
          context: context);
      return;
    }

    if (schoolNameController.text.isEmpty) {
      CustomLoader.errorSnackbar(
          title: "School Name Field is missing",
          message: "School Name Field is Empty. All Fields are mandatory",
          context: context);
      return;
    }
  }

  // initiating signup mechanism
  Future<void> signup(BuildContext context) async {
    // initiate form check sequence
    checkSignupForm(context);

    // setLoading status
    setLoading(true);

    // initiate provider
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    final success = await authProvider.signup(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      username: usernameController.text.trim(),
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      phoneNumber: phoneNumberController.text.trim(),
      role: _role,
      schoolName: schoolNameController.text.trim(),
      classLevel: _classLevel,
      nidaId: nidaIdController.text.trim(),
      taiId: taiIdController.text.trim(),
      context: context,
    );

    // removing loading status
    setLoading(false);
    debugPrint(success.toString());

    if (success) {
      router.go('/');
    } else {
      return;
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    nidaIdController.dispose();
    taiIdController.dispose();
    schoolNameController.dispose();
    _classLevel = "Nursery";
    _role = "Student";
    super.dispose();
  }
}
