import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
//  final String id;
//  final String title;
  // final String imageUrl;

  // const ProductItem({
  //  required this.id,
  //  required this.title,
  //  required this.imageUrl,
  // });
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    //another way to use the provider is via Consumer, it have the advantage of
    // we can only warap the especific part we want to rebuild
    // in this case the fav icon, and for example we will use Provider.of just
    // to load data the first time
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          //here is the consumer implementation
          leading: Consumer<Product>(builder: (context, product, child) {
            //child argument is used when we have parths into the widget that dont
            //want to rebuild when values change
            return IconButton(
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
              onPressed: () {
                product.toogleFavoriteStatus();
              },
              color: Theme.of(context).colorScheme.secondary,
            );
            //We define it ouside and later use ti inside return expression
            //child: Text()
          }),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
