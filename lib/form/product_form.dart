import 'package:flutter/material.dart';
import 'package:returned_project/controller/company_controller.dart';
import 'package:returned_project/model/product.dart';

class ProductForm extends StatefulWidget {
  final CompanyController controller;
  final Product? product;

  ProductForm({required this.controller, this.product});

  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();
  late String name;
  late double price;
  late bool inStock;

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      name = widget.product!.name;
      price = widget.product!.price;
      inStock = widget.product!.inStock;
    } else {
      name = '';
      price = 0.0;
      inStock = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.product != null ? 'Edit Product' : 'Add Product')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: name,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) {
                  name = value!;
                },
              ),
              TextFormField(
                initialValue: price.toString(),
                decoration: InputDecoration(labelText: 'Price'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a price';
                  }
                  return null;
                },
                onSaved: (value) {
                  price = double.parse(value!);
                },
              ),
              CheckboxListTile(
                title: Text('In Stock'),
                value: inStock,
                onChanged: (value) {
                  setState(() {
                    inStock = value!;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (widget.product == null) {
                      widget.controller.addProduct(
                          Product(name: name, price: price, inStock: inStock));
                    } else {
                      widget.controller.updateProduct(widget.product!.name,
                          Product(name: name, price: price, inStock: inStock));
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text(widget.product != null ? 'Save' : 'Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
