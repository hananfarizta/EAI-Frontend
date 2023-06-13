import 'package:eai_mobile/models/product_model.dart';
import 'package:eai_mobile/services/add_product_service.dart';
import 'package:flutter/material.dart';

class AddProductProvider with ChangeNotifier {
  ShowProduct? _products;

  ShowProduct? get products => _products;

  set products(ShowProduct? products) {
    _products = products;
    notifyListeners();
  }

  Future<bool> create({
    String? name,
    String? description,
    int? price,
  }) async {
    try {
      ShowProduct? products = await AddProductService().create(
        name: name,
        description: description,
        price: price,
      );

      _products = products;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
