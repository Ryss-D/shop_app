import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // how of is a generic type we can specify what type to listen
    // in this particular case <Products>
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      //SliverGridDelegateWithFixedCrossAxisCount tell to flutter that we want a certain count of columns and he should squeeze then on the screen
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ProductItem(
        id: products[i].id,
        title: products[i].title,
        imageUrl: products[i].imageUrl,
      ),
    );
  }
}
