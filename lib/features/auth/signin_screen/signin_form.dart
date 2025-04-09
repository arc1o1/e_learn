import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:e_learn/features/auth/signin_screen/signin_view_model.dart';
import 'package:e_learn/features/auth/widgets/auth_field_items.dart';
import 'package:e_learn/utils/constants/color_strings.dart';
import 'package:e_learn/utils/validators/validators.dart';

class SigninForm extends StatelessWidget {
  const SigninForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // provider instance
    final signinViewModel = context.watch<SigninViewModel>();

    return Column(
      children: [
        //email or phone
        AuthFieldItems(
          title: "Username/Email Address",
          labelText: "username/email-address",
          controller: signinViewModel.emailController,
          validator: (value) =>
              Validators.validateEmptyText("email/phone-number", value),
          keyboardType: TextInputType.emailAddress,
        ),

        SizedBox(height: 10),

        // password
        AuthFieldItems(
          title: "Password",
          labelText: "password",
          validator: (value) => Validators.validatePassword(value),
          controller: signinViewModel.passwordController,
          obscureText: signinViewModel.hideSigninPassword,
          keyboardType: TextInputType.name,
          suffixIcon: IconButton(
            onPressed: () => signinViewModel.setSigninPasswordVisibility(
              hide: !signinViewModel.hideSigninPassword,
            ),
            icon: Icon(
              signinViewModel.hideSigninPassword
                  ? Icons.visibility_off_rounded
                  : Icons.visibility_rounded,
              size: 17,
            ),
          ),
        ),

        // forgot password
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(100),
              hoverColor: ColorStrings.secondary,
              onTap: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                child: Text(
                  "Forgot Password",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: ColorStrings.primary,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 20),

        // login button
        SizedBox(
          height: 40,
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: () => signinViewModel.signin(context),
            child: Text("Sign-In"),
          ),
        ),
      ],
    );
  }
}
