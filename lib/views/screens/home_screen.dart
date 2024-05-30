import 'package:flutter/material.dart';
import 'package:returned_project/controller/company_controller.dart';
import 'package:returned_project/form/product_form.dart';

class HomeScreen extends StatefulWidget {
  final CompanyController controller;

  HomeScreen({required this.controller});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.controller.company.company)),
      body: ListView(
        children: [
          Text('Location: ${widget.controller.company.location}', style: TextStyle(fontSize: 18)),
          Divider(),
          Text('Employees', style: TextStyle(fontSize: 22)),
          ...widget.controller.company.employees.map((e) => Card(
            child: ListTile(
              title: Text(e.name),
              subtitle: Text('${e.position}, Age: ${e.age}'),
            ),
          )),
          Divider(),
          Text('Products', style: TextStyle(fontSize: 22)),
          ...widget.controller.company.products.map((p) => Card(
            child: ListTile(
              title: Text(p.name),
              subtitle: Text('\$${p.price} - ${p.inStock ? 'In Stock' : 'Out of Stock'}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProductForm(controller: widget.controller, product: p)),
                      ).then((_) {
                        setState(() {});
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      widget.controller.removeProduct(p.name);
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductForm(controller: widget.controller)),
          ).then((_) {
            setState(() {});
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
