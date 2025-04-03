import 'package:e_learn/features/payments/notifier/payment_notifier.dart';
import 'package:e_learn/features/payments/widgets/checkout_payment_method_widget.dart';
import 'package:e_learn/features/payments/widgets/topic_checkout_summary.dart';
import 'package:e_learn/features/widgets/section_header.dart';
import 'package:e_learn/utils/constants/color_strings.dart';
import 'package:e_learn/utils/constants/subjects.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentCheckoutScreen extends StatelessWidget {
  const PaymentCheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentNotifier>(
      builder: (context, paymentNotifier, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Checkout',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(15),
          children: [
            // topic summary
            TopicCheckoutSummary(),

            const SizedBox(height: 25),

            // transaction summary
            // ------------------- start
            SectionHeader(title: "Summary: ", showActionButton: false),

            const SizedBox(height: 15),

            // topic price
            CheckoutSummaryRowItem(title: "Topic Price", amount: "3,000.0/="),

            const SizedBox(height: 15),

            // discount
            CheckoutSummaryRowItem(title: "Discount", amount: "0.0/="),

            // const SizedBox(height: 15),

            // fee
            // CheckoutSummaryRowItem(title: "Fee", amount: "100.0/="),

            const SizedBox(height: 5),

            Divider(color: Colors.grey.shade400),

            const SizedBox(height: 5),

            // total
            CheckoutSummaryRowItem(title: "Total", amount: "3,000.0/="),
            // ------------------- end

            SizedBox(height: 30),

            // payment method
            // ------------------- start
            SectionHeader(title: "Payment Method: ", showActionButton: false),

            const SizedBox(height: 20),

            ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemCount: paymentMethods.length,
              separatorBuilder: (_, __) => SizedBox(height: 5),
              itemBuilder: (_, index) => CheckoutPaymentMethodWidget(
                title: paymentMethods[index],
                onTap: () {
                  // clear controller
                  paymentNotifier.paymentNumberController.clear();

                  // select the method again
                  paymentNotifier.selectPaymentMethod(
                    paymentMethodSelected: paymentMethods[index],
                  );
                },
                leadIcon: Icon(
                  Icons.circle,
                  color: paymentNotifier.selectedPaymentMethod ==
                          paymentMethods[index]
                      ? ColorStrings.primary
                      : Colors.white,
                  size: 10,
                ),
                trailIcon: Icon(
                  paymentNotifier.selectedPaymentMethod == paymentMethods[index]
                      ? Icons.keyboard_arrow_down_rounded
                      : Icons.arrow_forward_ios_rounded,
                  size: paymentNotifier.selectedPaymentMethod ==
                          paymentMethods[index]
                      ? 25
                      : 15,
                ),
                visible: paymentNotifier.selectedPaymentMethod ==
                    paymentMethods[index],
                controller: paymentNotifier.paymentNumberController,
              ),
            ),
            // ------------------- end

            const SizedBox(height: 30),

            // checkout button
            SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Proceed to Pay 3,000/= Tshs"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
