import 'package:e_learn/services/routes.dart';
import 'package:flutter/material.dart';

import 'package:e_learn/features/auth/signup_screen/signup_form.dart';
import 'package:e_learn/features/auth/widgets/dont_have_account_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SIGN-UP",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 40),
        child: Column(
          children: [
            // form
            SignupForm(),

            SizedBox(height: 25),

            // sign in redirect
            DontHaveAccountWidget(
              title: "Sign-In",
              onTap: () => router.push('/sign-in'),
              isSigninPage: false,
            ),
          ],
        ),
      ),
    );
  }
}
