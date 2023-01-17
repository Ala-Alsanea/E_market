import 'dart:convert';
import 'package:flutter/material.dart';

import './model/products.dart';
import './model/store.dart';
import './ConnectApi.dart';

class AppNotifier extends ChangeNotifier {
  var _productsApi = ConnectApi();
//for products
  Future<List<Products>> getAllProducts(entryPoint) async {
    var res = await _productsApi.getAllData(entryPoint);
    var jsonMap = json.decode(res) as Map<String, dynamic>;
    var products = jsonMap['data'] as List;
    return products.map((e) => Products.fromJson(e)).toList();
  }

// for stores
  Future<List<Stores>> getAllStores(entryPoint) async {
    var res = await _productsApi.getAllData(entryPoint);
    var jsonMap = json.decode(res) as Map<String, dynamic>;
    var products = jsonMap['data'] as List;
    return products.map((e) => Stores.fromJson(e)).toList();
  }
}
