import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../widgets/app_drawer.dart';
import '../widgets/user_product_item.dart';
import '../screens/edit_product_screen.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context, listen: false).fetchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your products'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      // the RefreshIndicator widget allowus to create  the pull-to-refresh
      // behavior inside our apps
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Consumer<Products>(
            builder: (context, products, child) {
              return ListView.builder(
                itemCount: products.items.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      UserProductItem(
                        id: products.items[index].id,
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
      ),
    );
  }
}
