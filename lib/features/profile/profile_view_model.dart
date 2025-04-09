import 'package:e_learn/features/auth/provider/auth_provider.dart';
import 'package:e_learn/services/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileViewModel extends ChangeNotifier {
  // var
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // set loading var
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // sign out
  Future<void> signout(BuildContext context) async {
    // setLoading status
    setLoading(true);

    // initiate provider
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    // sign out the user
    authProvider.signout();

    // route navigate
    router.go("/sign-in");
  }
}
