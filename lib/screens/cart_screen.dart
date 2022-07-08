import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/cart_item.dart' show CartItem;
import '../providers/cart.dart' show Cart;

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart of items'),
      ),
      body: Column(children: [
        Card(
          margin: EdgeInsets.all(15),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(fontSize: 20),
                ),
                //SizedBox(width: 10),
                Spacer(),
                Chip(
                  label: Text(
                    '\$${cart.totalAmount.toString()}',
                    style: TextStyle(
                        color: Theme.of(context)
                            .primaryTextTheme
                            .headline6!
                            .color),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                TextButton(
                  child: Text('Order now'),
                  onPressed: () {},
                  //todo assign color with primary theme color
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (context, index) => CartItem(
                    //.values.toList() was added to acces to concrete values on map
                    id: cart.items.values.toList()[index].id,
                    productId: cart.items.keys.toList()[index],
                    price: cart.items.values.toList()[index].price,
                    quantity: cart.items.values.toList()[index].quantity,
                    title: cart.items.values.toList()[index].title,
                  )),
        ),
      ]),
    );
  }
}
