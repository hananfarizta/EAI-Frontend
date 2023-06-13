import 'package:eai_mobile/models/buy_product_model.dart';
import 'package:eai_mobile/services/buy_product_service.dart';
import 'package:flutter/material.dart';

class BuyProductProvider with ChangeNotifier {
  PaymentModel? _payments;

  PaymentModel? get payments => _payments;

  set payments(PaymentModel? payments) {
    _payments = payments;
    notifyListeners();
  }

  Future<bool> create({
    List<String>? names,
    String? payment,
  }) async {
    try {
      PaymentModel paymentModel = await BuyProductService().createPayment(
        names: names,
        payment: payment,
      );

      _payments = paymentModel;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
