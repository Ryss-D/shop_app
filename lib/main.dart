import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/products_overiew_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/cart_screen.dart';
import './providers/products.dart';
import './providers/products.dart';
import './providers/cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            //here we provide to builder a new instance of the class mixed with ChangeNofifier
            create: (context) => Products(),
          ),
          ChangeNotifierProvider(
            create: (context) => Cart(),
          ),
        ],
        // if we are reusing a object we prefer to use ChangeNotifier.value but if we are creating a new instace every
        // time we should prefer user the normal method
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Shop App',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.purple,
              ).copyWith(secondary: Colors.deepOrange),
              fontFamily: 'Lato',
            ),
            home: ProductOverviewScreen(),
            routes: {
              ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
              CartScreen.routeName: (context) => CartScreen(),
            }));
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
