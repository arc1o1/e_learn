import 'package:e_learn/features/auth/signup_screen/signup_view_model.dart';
import 'package:e_learn/features/auth/signup_screen/widgets/class_level_category_view.dart';
import 'package:e_learn/features/auth/signup_screen/widgets/signup_category_view.dart';
import 'package:e_learn/features/auth/widgets/auth_field_items.dart';
import 'package:e_learn/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // provider instance
    final signupViewModel = context.watch<SignupViewModel>();

    return Column(
      children: [
        // names
        Row(
          children: [
            // first name
            Expanded(
              child: AuthFieldItems(
                title: "First Name",
                labelText: "first-name",
                controller: signupViewModel.firstNameController,
                validator: (value) =>
                    Validators.validateEmptyText("first-name", value),
                keyboardType: TextInputType.name,
              ),
            ),

            SizedBox(width: 10),

            // last name
            Expanded(
              child: AuthFieldItems(
                title: "Last Name",
                labelText: "last-name",
                controller: signupViewModel.lastNameController,
                validator: (value) =>
                    Validators.validateEmptyText("last-name", value),
                keyboardType: TextInputType.name,
              ),
            ),
          ],
        ),

        SizedBox(height: 10),

        // username and phone number
        Row(
          children: [
            // username
            Expanded(
              child: AuthFieldItems(
                title: "Username",
                labelText: "username",
                controller: signupViewModel.usernameController,
                validator: (value) =>
                    Validators.validateEmptyText("username", value),
                keyboardType: TextInputType.name,
              ),
            ),

            SizedBox(width: 10),

            // phone
            Expanded(
              child: AuthFieldItems(
                title: "Phone Number",
                labelText: "phone",
                controller: signupViewModel.phoneNumberController,
                validator: (value) => Validators.validatePhoneNumber(value),
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),

        SizedBox(height: 10),

        // email
        AuthFieldItems(
          title: "Email",
          labelText: "email",
          controller: signupViewModel.emailController,
          validator: (value) => Validators.validateEmail(value),
          keyboardType: TextInputType.emailAddress,
        ),

        SizedBox(height: 10),

        // password
        AuthFieldItems(
          title: "Password",
          labelText: "password",
          controller: signupViewModel.passwordController,
          validator: (value) => Validators.validatePassword(value),
          keyboardType: TextInputType.name,
          suffixIcon: IconButton(
            onPressed: () => signupViewModel.setSignupPasswordVisibility(
              hide: !signupViewModel.hideSignupPassword,
            ),
            icon: Icon(
              signupViewModel.hideSignupPassword
                  ? Icons.visibility_off_rounded
                  : Icons.visibility_rounded,
              size: 17,
            ),
          ),
        ),
        SizedBox(height: 10),

        // school name
        AuthFieldItems(
          title: "School Name",
          labelText: "school-name",
          controller: signupViewModel.schoolNameController,
          validator: (value) =>
              Validators.validateEmptyText("school-name", value),
          keyboardType: TextInputType.name,
        ),

        SizedBox(height: 10),

        // scholar role
        SignupCategoryView(),

        SizedBox(height: 10),

        // scholar class level
        ClassLevelCategoryView(),

        // SizedBox(height: 10),

        // // if teacher....nida number
        // Visibility(
        //   visible: signupViewModel.role != "Student",
        //   child: AuthFieldItems(
        //     title: "NIDA",
        //     labelText: "nida-id number",
        //     controller: signupViewModel.nidaIdController,
        //     validator: (value) => Validators.validateEmptyText(
        //       'nida-id number',
        //       value,
        //     ),
        //     keyboardType: TextInputType.emailAddress,
        //   ),
        // ),

        SizedBox(height: 10),

        // teachers association id
        Visibility(
          visible: signupViewModel.role == "Teacher",
          child: AuthFieldItems(
            title: "Teachers Association ID Number",
            labelText: "TAI ID",
            controller: signupViewModel.taiIdController,
            validator: (value) => Validators.validateEmptyText('TAI ID', value),
            keyboardType: TextInputType.number,
          ),
        ),

        SizedBox(height: 30),

        // login button
        SizedBox(
          height: 40,
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: () => signupViewModel.signup(context),
            child: Text("Sign-Up"),
          ),
        ),
      ],
    );
  }
}
