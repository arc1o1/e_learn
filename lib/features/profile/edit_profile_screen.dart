import 'package:e_learn/utils/validators/validators.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: EdgeInsets.all(15),
        children: [
          // first name
          EditProfileFieldItems(
            title: "First Name",
            labelText: 'first-name',
            validator: (value) =>
                Validators.validateEmptyText('first name', value),
            keyboardType: TextInputType.name,
          ),

          SizedBox(height: 15),

          // last name
          EditProfileFieldItems(
            title: "Last Name",
            labelText: 'last-name',
            validator: (value) =>
                Validators.validateEmptyText('last name', value),
            keyboardType: TextInputType.name,
          ),

          SizedBox(height: 15),

          // username
          EditProfileFieldItems(
            title: "Username",
            labelText: 'username',
            validator: (value) =>
                Validators.validateEmptyText('username', value),
            keyboardType: TextInputType.name,
          ),

          SizedBox(height: 15),

          // email
          EditProfileFieldItems(
            title: "Email",
            labelText: 'email',
            validator: (value) => Validators.validateEmail('email'),
            keyboardType: TextInputType.name,
          ),

          SizedBox(height: 15),

          // phone number
          EditProfileFieldItems(
            title: "Phone Number",
            labelText: 'phone-number',
            validator: (value) =>
                Validators.validatePhoneNumber('phone number'),
            keyboardType: TextInputType.number,
          ),

          SizedBox(height: 50),

          // submit button
          SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width * 0.7,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Submit"),
            ),
          ),
        ],
      ),
    );
  }
}

class EditProfileFieldItems extends StatelessWidget {
  const EditProfileFieldItems({
    super.key,
    required this.title,
    required this.labelText,
    this.controller,
    this.validator,
    this.keyboardType,
  });

  final String title, labelText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        Text(
          title,
          style:
              Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 15),
        ),

        SizedBox(height: 5),

        Container(
          height: 50,
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          child: Form(
            child: TextFormField(
              controller: controller,
              validator: validator,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                labelText: labelText,
                labelStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
