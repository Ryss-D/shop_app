import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/edit_product_screen.dart';
import '../providers/products.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  UserProductItem(
      {required this.id, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    // we have to add this scaffol ad final to pin it to a specific context
    // and be able to invoke que ScaffoldMessenger into a future
    final scaffold = ScaffoldMessenger.of(context);
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(children: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(EditProductScreen.routeName, arguments: id);
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              try {
                Provider.of<Products>(context, listen: false).deleteProduct(id);
              } catch (error) {
                // we have to add this scaffol ad final to pin it to a specific context
                // and be able to invoke que ScaffoldMessenger into a future
                scaffold.showSnackBar(
                  SnackBar(
                    content: Text(
                      'Deleting failed',
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }
              ;
            },
            color: Theme.of(context).colorScheme.error,
          )
        ]),
      ),
    );
  }
}
