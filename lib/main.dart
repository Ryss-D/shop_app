import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/products_overiew_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/user_products_screen.dart';
import './screens/edit_product_screen.dart';
import './screens/orders_screen.dart';
import './screens/auth_screen.dart';
import './screens/cart_screen.dart';
import './providers/products.dart';
import './providers/orders.dart';
import './providers/cart.dart';
import './providers/auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple),
      fontFamily: 'Lato',
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Auth(),
        ),
        //ChangeNotifierProvider(
        // ChangeNotifierProxyProvider allowus to create a Provider who depends
        // of other provider
        //<Type you depends, type you will provide>
        ChangeNotifierProxyProvider<Auth, Products>(
          //here we provide to builder a new instance of the class mixed with ChangeNofifier
          create: (ctx) =>
              Products(Provider.of<Auth>(ctx, listen: false).token, '', []),
          // update is of type (context, myModel, myNotifier)
          update: (context, auth, previousProducts) => Products(
              auth.token,
              auth.userId,
              previousProducts == null ? [] : previousProducts.items),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          create: (ctx) => Orders(
            Provider.of<Auth>(ctx, listen: false).token,
            [],
          ),
          update: (context, auth, previousOrders) => Orders(
              auth.token, previousOrders == null ? [] : previousOrders.orders),
        ),
      ],
      // if we are reusing a object we prefer to use ChangeNotifier.value but if we are creating a new instace every
      // time we should prefer user the normal method
      child: Consumer<Auth>(
        builder: (context, auth, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Shop App',
          theme: theme.copyWith(
            colorScheme:
                theme.colorScheme.copyWith(secondary: Colors.deepOrange),
          ),
          home: auth.isAuth ? ProductOverviewScreen() : AuthScreen(),
          routes: {
            ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
            CartScreen.routeName: (context) => CartScreen(),
            OrdersScreen.routeName: (context) => OrdersScreen(),
            UserProductsScreen.routeName: (context) => UserProductsScreen(),
            EditProductScreen.routeName: (context) => EditProductScreen(),
            AuthScreen.routeName: (context) => AuthScreen(),
          },
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
      ),
      body: const Center(
        child: Text('Lets build a shop app'),
      ),
    );
  }
}
