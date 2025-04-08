import 'package:e_learn/features/auth/provider/auth_provider.dart';
import 'package:e_learn/services/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigninViewModel extends ChangeNotifier {
  // var
  bool _hideSigninPassword = true;
  bool get hideSigninPassword => _hideSigninPassword;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // set loading value to either true or false
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // set passwod visibility on sign in page
  void setSigninPasswordVisibility({required bool hide}) {
    _hideSigninPassword = hide;
    notifyListeners();
  }

  // signin function
  Future<void> signin(BuildContext context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // check if email and password are not empty
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please Fill all the required fields')),
      );
      return;
    }

    // set loading to true
    setLoading(true);

    // initiate login sequence
    final success = await authProvider.signin(email: email, password: password);

    // set loading to false
    setLoading(false);

    if (success) {
      // navigate to bottom nav menu
      router.go("/");
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed!. Please try again.')),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
