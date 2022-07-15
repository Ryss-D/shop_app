import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart' show Orders;
import '../widgets/app_drawer.dart';
import '../widgets/order_item.dart';

class OrdersScreen extends StatefulWidget {
  static const routeName = '/orders';

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  // we add this property and use a statefull widget to avoid the continuous
  // http request if any method trigger multiple times the build inside the
  // widget
  late Future _ordersFuture;
  Future _obtainOrdersFuture() {
    return Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
  }

  @override
  initState() {
    _ordersFuture = _obtainOrdersFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final ordersData = Provider.of<Orders>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Your orders'),
        ),
        drawer: AppDrawer(),
        body: FutureBuilder(
            future: _ordersFuture,
            builder: (context, dataSnapshot) {
              // dataSnapshot is the current state of future
              if (dataSnapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                if (dataSnapshot.error == null) {
                  return Center(child: Text('An error occurred'));
                  //TODO: Error handling
                } else {
                  return Consumer<Orders>(
                    builder: (ctx, ordersData, child) => ListView.builder(
                        itemBuilder: (context, index) =>
                            OrderItem(ordersData.orders[index]),
                        itemCount: ordersData.orders.length),
                  );
                }
              }
            })
//_isLoading
        //         ? Center(child: CircularProgressIndicator())
        //        : ListView.builder(
        //           itemBuilder: (context, index) =>
        //              OrderItem(ordersData.orders[index]),
        //         itemCount: ordersData.orders.length,
        //      ),
        );
  }
}
