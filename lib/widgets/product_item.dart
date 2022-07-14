import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../providers/product.dart';
import '../providers/cart.dart';

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
    final cart = Provider.of<Cart>(context, listen: false);
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
          leading: Consumer<Product>(builder: (ctx, product, child) {
            //child argument is used when we have parths into the widget that dont
            //want to rebuild when values change
            return IconButton(
              color: Theme.of(context).colorScheme.secondary,
              //color: Colors.deepOrange,
              icon: Icon(
                  //   color: Theme.of(context).colorScheme.secondary,
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
              onPressed: () {
                product.toogleFavoriteStatus();
              },
            );
            //We define it ouside and later use ti inside return expression
            //child: Text()
          }),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: Consumer<Cart>(builder: (ctx, cart, child) {
            return IconButton(
              color: Theme.of(context).colorScheme.secondary,
              //color: Colors.deepOrange,
              icon: Icon(
                Icons.shopping_cart,
                //color: Theme.of(context).colorScheme.secondary,
              ),
              onPressed: () {
                cart.addItem(
                  product.id,
                  product.price,
                  product.title,
                );
                // this inmediatly remove the old scackbar
                ScaffoldMessenger.of(context).hideCurrentSnackBar;
                //this allow us to create a popupmenssage
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(
                        'Added item to cart',
                      ),
                      duration: Duration(seconds: 2),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          cart.removeSingleItem(product.id);
                        },
                      )),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
