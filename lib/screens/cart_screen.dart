import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/cart_item.dart' show CartItem;
import '../providers/cart.dart' show Cart;
import '../providers/orders.dart';

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
                    '\$${cart.totalAmount.toStringAsFixed(2)}',
                    style: TextStyle(
                        color: Theme.of(context)
                            .primaryTextTheme
                            .headline6!
                            .color),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                OrderButton(cart: cart),
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

class OrderButton extends StatefulWidget {
  const OrderButton({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  State<OrderButton> createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: _isLoading?CircularProgressIndicator() : Text('Order now'),
      // here we are desabling the button if no items are in cart
      onPressed: (widget.cart.itemCount <= 0 || _isLoading = true)
          //when we point a button to null flutter automatically
          //disable this button
          ? null
          : () async {
              setState(() {
                _isLoading = true
                });
              await Provider.of<Orders>(context, listen: false).addOrder(
                cartProducts: widget.cart.items.values.toList(),
                total: widget.cart.totalAmount,
              );
              setState(() {
                _isLoading = false 
                });
              widget.cart.clear();
            },
      //todo assign color with primary theme color
    );
  }
}
