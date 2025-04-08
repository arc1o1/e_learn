import 'package:e_learn/features/auth/widgets/dont_have_account_widget.dart';
import 'package:e_learn/features/auth/signin_screen/signin_form.dart';
import 'package:e_learn/services/routes.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SIGN-IN",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
            15, MediaQuery.of(context).size.height * 0.160, 15, 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // welcome back
            Text(
              "Welcome back!",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontSize: 45),
            ),

            SizedBox(height: 50),

            SigninForm(),

            SizedBox(height: 25),

            DontHaveAccountWidget(
              title: "Sign-Up",
              onTap: () => router.push('/sign-up'),
            ),
          ],
        ),
      ),
    );
  }
}
