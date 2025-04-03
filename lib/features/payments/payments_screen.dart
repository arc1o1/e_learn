import 'package:e_learn/utils/constants/color_strings.dart';
import 'package:flutter/material.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Payments",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(15),
        itemCount: 10,
        separatorBuilder: (_, __) => SizedBox(height: 10),
        itemBuilder: (_, index) => InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // icon
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorStrings.primary),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.attach_money_rounded,
                    color: ColorStrings.primary,
                    size: 14,
                  ),
                ),

                SizedBox(width: 8),

                // texts
                Container(
                  width: MediaQuery.of(context).size.width * 0.79,
                  color: Colors.transparent,
                  child: Text(
                    "Successfully received payment receipt for O-Level, Mathematics Topic - Algebra for Form I class",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
