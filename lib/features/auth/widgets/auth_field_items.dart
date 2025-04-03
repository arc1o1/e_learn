import 'package:flutter/material.dart';

class AuthFieldItems extends StatelessWidget {
  const AuthFieldItems({
    super.key,
    required this.title,
    required this.labelText,
    this.controller,
    this.validator,
    this.keyboardType,
    this.suffixIcon,
    this.obscureText,
  });

  final String title, labelText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool? obscureText;

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
              obscureText: obscureText ?? false,
              cursorRadius: Radius.circular(2),
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 15, fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                labelText: labelText,
                labelStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                suffixIcon: suffixIcon,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
