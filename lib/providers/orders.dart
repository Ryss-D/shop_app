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
  final String authToken;
  final String userId;
  List<OrderItem> get orders {
    return [..._orders];
  }

  Orders(this.authToken, this.userId, this._orders);

  Future<void> fetchAndSetOrders() async {
    //TODO: create env files
    final url = Uri.parse(
        'https://shop-app-2705c-default-rtdb.firebaseio.com/orders/$userId.json?auth=$authToken');
    try {
      final response = await http.get(url);
      if (json.decode(response.body) == null) {
        return;
      }
      final extractedData =
          (json.decode(response.body) as Map<String, dynamic>);
      final List<OrderItem> loadedOrders = [];
      extractedData.forEach(
        (orderId, orderData) {
          loadedOrders.add(
            OrderItem(
              id: orderId,
              amount: orderData['amount'],
              //parse by default try to cdecode basen on ISO8601
              dateTime: DateTime.parse(orderData['dateTime']),
              products: (orderData['products'] as List<dynamic>).map((product) {
                return CartItem(
                  id: product['id'],
                  title: product['title'],
                  quantity: product['quantity'],
                  price: product['price'],
                );
              }).toList(),
            ),
          );
        },
      );
      _orders = loadedOrders.reversed.toList();
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> addOrder(
      {required List<CartItem> cartProducts, required double total}) async {
    final url = Uri.parse(
        'https://shop-app-2705c-default-rtdb.firebaseio.com/orders/$userId.json');
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
