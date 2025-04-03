import 'package:e_learn/features/auth/notifier/auth_notifier.dart';
import 'package:e_learn/features/auth/widgets/auth_field_items.dart';
import 'package:e_learn/utils/constants/color_strings.dart';
import 'package:e_learn/utils/routes/routes.dart';
import 'package:e_learn/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigninForm extends StatelessWidget {
  const SigninForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthNotifier>(
      builder: (context, authNotifier, child) => Column(
        children: [
          //email or phone
          AuthFieldItems(
            title: "Email Address or Phone Number",
            labelText: "email-address/phone-number",
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
            obscureText: authNotifier.hideSigninPassword,
            keyboardType: TextInputType.name,
            suffixIcon: IconButton(
              onPressed: () => authNotifier.setSigninPasswordVisibility(
                hide: !authNotifier.hideSigninPassword,
              ),
              icon: Icon(
                authNotifier.hideSigninPassword
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
              onPressed: () => router.go("/"),
              child: Text("Sign-In"),
            ),
          ),
        ],
      ),
    );
  }
}
