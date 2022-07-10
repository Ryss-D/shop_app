import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: Form(
        child: ListView(
          children: [
            TextFormField(),
            TextFormField(),
          ],
        ),
      ),
    );
  }
}
