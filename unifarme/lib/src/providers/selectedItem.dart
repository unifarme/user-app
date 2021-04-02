import 'package:flutter/material.dart';
import 'package:unifarme/src/models/product.dart';

class SelectedItemProvider extends ChangeNotifier {
  ProductModel product = ProductModel();

  ProductModel get getProduct => product;

  set setProduct(ProductModel a) {
    product = a;
    notifyListeners();
  }
}
