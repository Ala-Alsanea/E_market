import 'dart:convert';
import 'package:flutter/material.dart';

import './model/products.dart';
import './ConnectApi.dart';

class AppNotifier extends ChangeNotifier {
  var _productsApi = ConnectApi();

  Future<List<Products>> getAllProducts(entryPoint) async {
    var res = await _productsApi.getAllData(entryPoint);
    var jsonMap = json.decode(res) as Map<String, dynamic>;
    var products = jsonMap['data'] as List;
    return products.map((e) => Products.fromJson(e)).toList();
  }
}
