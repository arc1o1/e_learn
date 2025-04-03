import 'package:e_learn/utils/routes/routes.dart';
import 'package:flutter/material.dart';

class BuyTopicButtonWidget extends StatelessWidget {
  const BuyTopicButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 35,
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: () => router.push('/payment-checkout'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 5),
            ),
            child: Text(
              "Buy Topic, 2,000/= Tshs",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.white, fontSize: 15),
            ),
          ),
        ),

        const SizedBox(height: 5),

        // text widget
        Text(
          "30 Day Money-Back Guarantee. Full Lifetime Access",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
        ),

        const SizedBox(height: 10),
      ],
    );
  }
}
