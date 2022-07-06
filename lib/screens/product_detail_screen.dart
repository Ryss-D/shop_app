import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  static const routeName = '/product-detail';
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: Container(),
    );
  }
}
