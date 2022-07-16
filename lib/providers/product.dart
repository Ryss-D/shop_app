import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imageUrl,
      this.isFavorite = false});

  void _setFavValue(bool newValue) {
    isFavorite = newValue;
    notifyListeners();
  }

  Future<void> toogleFavoriteStatus() async {
    final _oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    //TODO: create env files
    final url = Uri.parse(
        'https://shop-app-2705c-default-rtdb.firebaseio.com/products/$id.json');
    try {
      final response = await http.patch(
        url,
        body: json.encode(
          {
            'isFavorite': isFavorite,
          },
        ),
      );
      if (response.statusCode >= 400) {
        _setFavValue(_oldStatus);
        throw HttpException('Favorites failed on update!');
      }
    } catch (error) {
      _setFavValue(_oldStatus);
    }
  }
}
