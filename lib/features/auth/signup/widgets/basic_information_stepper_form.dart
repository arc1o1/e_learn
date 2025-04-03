import 'package:e_learn/features/auth/notifier/auth_notifier.dart';
import 'package:e_learn/features/auth/widgets/auth_field_items.dart';
import 'package:e_learn/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasicInformationStepperForm extends StatelessWidget {
  const BasicInformationStepperForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthNotifier>(
      builder: (context, authNotifier, child) => SingleChildScrollView(
        child: Column(
          children: [
            // first name
            AuthFieldItems(
              title: "First Name",
              labelText: "first-name",
              validator: (value) =>
                  Validators.validateEmptyText("first-name", value),
              keyboardType: TextInputType.name,
            ),

            SizedBox(height: 10),

            // last name
            AuthFieldItems(
              title: "Last Name",
              labelText: "last-name",
              validator: (value) =>
                  Validators.validateEmptyText("last-name", value),
              keyboardType: TextInputType.name,
            ),

            SizedBox(height: 10),

            // email
            AuthFieldItems(
              title: "Email",
              labelText: "email",
              validator: (value) => Validators.validateEmail(value),
              keyboardType: TextInputType.emailAddress,
            ),

            SizedBox(height: 10),

            // phone
            AuthFieldItems(
              title: "Phone Number",
              labelText: "phone",
              validator: (value) => Validators.validatePhoneNumber(value),
              keyboardType: TextInputType.number,
            ),

            SizedBox(height: 10),

            // password
            AuthFieldItems(
              title: "Password",
              labelText: "password",
              validator: (value) => Validators.validatePassword(value),
              keyboardType: TextInputType.name,
              suffixIcon: IconButton(
                onPressed: () => authNotifier.setSignupPasswordVisibility(
                  hide: !authNotifier.hideSignupPassword,
                ),
                icon: Icon(
                  authNotifier.hideSignupPassword
                      ? Icons.visibility_off_rounded
                      : Icons.visibility_rounded,
                  size: 17,
                ),
              ),
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
