import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem(
      {required this.id,
      required this.amount,
      required this.products,
      required this.dateTime});
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> addOrder(
      {required List<CartItem> cartProducts, required double total}) async {
    final url = Uri.parse(
        'https://shop-app-2705c-default-rtdb.firebaseio.com/orders.json');
    final timestamp = DateTime.now();
    final response = await http.post(
      url,
      body: json.encode(
        {
          'amount': total,
          //ISO8601 is just a standart date convention
          'dateTime': timestamp.toIso8601String(),
          'products': cartProducts.map((cartProduct) {
            return <String, dynamic>{
              'id': cartProduct.id,
              'title': cartProduct.title,
              'quantity': cartProduct.quantity,
              'price': cartProduct.price,
            };
          }).toList(),
        },
      ),
    );
    // by default insert add the item at the end of the list
    _orders.insert(
      0,
      OrderItem(
        id: json.decode(response.body)['name'],
        amount: total,
        dateTime: timestamp,
        products: cartProducts,
      ),
    );
    notifyListeners();
  }
}
