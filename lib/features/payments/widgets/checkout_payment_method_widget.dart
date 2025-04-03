import 'package:e_learn/utils/constants/color_strings.dart';
import 'package:e_learn/utils/validators/validators.dart';
import 'package:flutter/material.dart';

class CheckoutPaymentMethodWidget extends StatelessWidget {
  const CheckoutPaymentMethodWidget({
    super.key,
    required this.title,
    this.onTap,
    required this.leadIcon,
    required this.trailIcon,
    required this.visible,
    required this.controller,
  });

  final String title;
  final void Function()? onTap;
  final Icon leadIcon, trailIcon;
  final bool visible;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // payment method
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: ColorStrings.secondary),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorStrings.primary),
                        shape: BoxShape.circle,
                      ),
                      child: leadIcon,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontSize: 17),
                    ),
                  ],
                ),

                // icon
                trailIcon
              ],
            ),
          ),
        ),

        // enter payment number
        Visibility(
          visible: visible,
          child: Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 10),
            child: Container(
              height: 50,
              padding:
                  const EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 5),
              child: Form(
                child: TextFormField(
                  controller: controller,
                  validator: (value) => Validators.validatePhoneNumber(value),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle:
                        Theme.of(context).textTheme.headlineSmall!.copyWith(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CheckoutSummaryRowItem extends StatelessWidget {
  const CheckoutSummaryRowItem({
    super.key,
    required this.title,
    required this.amount,
  });

  final String title, amount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 17),
            ),
            Text(
              amount,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 17),
            ),
          ],
        ),
      ],
    );
  }
}
