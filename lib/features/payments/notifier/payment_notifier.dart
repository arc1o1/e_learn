import 'package:e_learn/utils/constants/subjects.dart';
import 'package:flutter/material.dart';

class PaymentNotifier extends ChangeNotifier {
  String _selectedPaymentMethod = paymentMethods[0];
  String get selectedPaymentMethod => _selectedPaymentMethod;

  final paymentNumberController = TextEditingController();

  // select category functio
  void selectPaymentMethod({required String paymentMethodSelected}) {
    if (_selectedPaymentMethod == paymentMethodSelected) {
      _selectedPaymentMethod = "";
      notifyListeners();
    } else {
      _selectedPaymentMethod = paymentMethodSelected;
      notifyListeners();
    }
  }
}
