import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;
  ProductsGrid(this.showFavs);
  @override
  Widget build(BuildContext context) {
    // how of is a generic type we can specify what type to listen
    // in this particular case <Products>
    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.favoriteItems : productsData.items;
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
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        //if we are not using the context for the providet we can user
        //ChangeNotifierProvider.value instead of ChangeNotifierProvider
        //an user value: MyChangeNotifier() instead of create:
        //create: (context) => products[i],
        value: products[i],
        child: ProductItem(),
      ),
    );
  }
}
