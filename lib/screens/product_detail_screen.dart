import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
      //appBar: AppBar(
      //title: Text(loadedProduct.title),
      //),
      //body: SingleChildScrollView(
// we will add the behabior of non appbar shown ujti you scroll down on page
      body: CustomScrollView(
        // child: Column(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                loadedProduct.title,
              ),
              background: Hero(
                tag: loadedProduct.id,
                child: Image.network(loadedProduct.imageUrl, fit: BoxFit.cover),
              ),
            ),
          ),
          //SliverList is just a listview as part of multiple slivers
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: 300,
                  width: double.infinity,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '\$${loadedProduct.price}',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: Text(
                    loadedProduct.description,
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),
                SizedBox(
                  height: 800,
                ),
              ],
            ),
          ),
        ],
        //Column(
        //children: [
        //   Container(
        //     height: 300,
        //     width: double.infinity,
        //     child: Hero(
        //       //tag shoul be the same in page who lands and on page who
        //       //invoke
        //       tag: loadedProduct.id,
        //       child: Image.network(
        //         loadedProduct.imageUrl,
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //   ),
        //   SizedBox(
        //     height: 10,
        //   ),
        //   Text(
        //     '\$${loadedProduct.price}',
        //     style: TextStyle(
        //       color: Colors.grey,
        //       fontSize: 20,
        //     ),
        //   ),
        //   SizedBox(
        //     height: 10,
        //   ),
        //   Container(
        //     padding: EdgeInsets.symmetric(horizontal: 10),
        //     width: double.infinity,
        //     child: Text(
        //       loadedProduct.description,
        //       textAlign: TextAlign.center,
        //       softWrap: true,
        //     ),
        //   ),
        // ],
      ),
    );
  }
}
