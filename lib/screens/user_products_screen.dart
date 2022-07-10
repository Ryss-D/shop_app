import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../widgets/app_drawer.dart';
import '../widgets/user_product_item.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your products'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Consumer<Products>(
          builder: (context, products, child) {
            return ListView.builder(
              itemCount: products.items.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    UserProductItem(
                      title: products.items[index].title,
                      imageUrl: products.items[index].imageUrl,
                    ),
                    Divider()
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
