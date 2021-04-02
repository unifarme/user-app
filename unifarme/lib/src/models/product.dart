import 'dart:ffi';

import 'package:unifarme/src/models/category.dart';
import 'package:unifarme/src/models/user.dart';

class ProductModel {
  String product_name;
  String nick_name;
  double price;
  double rating;
  List<CategoryModel> categories;
  double price_per_quantity;
  double quantity_per_measure;
  UserModel farmer_id;
  String product_pic;
  int reviews;

  ProductModel(
      {this.categories,
      this.farmer_id,
      this.nick_name,
      this.price,
      this.price_per_quantity,
      this.product_name,
      this.quantity_per_measure,
      this.rating,
      this.product_pic,
      this.reviews});

  ProductModel.fromJson(parsedJson) {
    product_name =
        parsedJson["product_name"] != null ? parsedJson["product_name"] : "";
    nick_name = parsedJson["nick_name"] != null ? parsedJson["nick_name"] : "";
    price = parsedJson["price"] != null ? parsedJson["price"] : 0;
    rating = parsedJson["rating"] != null ? parsedJson["rating"] : 5;
    price_per_quantity = parsedJson["price_per_quantity"] != null
        ? parsedJson["price_per_quantity"]
        : 0;
    quantity_per_measure = parsedJson["quantity_per_measure"] != null
        ? parsedJson["quantity_per_measure"]
        : 0;
    // farmer_id = parsedJson["farmer_id"] != null ? parsedJson["farmer_id"] : "";
    product_pic =
        parsedJson["product_pic"] != null ? parsedJson["product_pic"] : "";
    reviews = parsedJson["reviews"] != null ? parsedJson["reviews"] : 10;
  }
}
