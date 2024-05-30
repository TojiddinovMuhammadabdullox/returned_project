import 'package:flutter/material.dart';
import 'package:returned_project/model/company.dart';

class HomeScreen extends StatelessWidget {
  final Company company;

  HomeScreen({required this.company});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(company.company)),
      body: ListView(
        children: [
          Text('Location: ${company.location}', style: TextStyle(fontSize: 18)),
          Divider(),
          Text('Employees', style: TextStyle(fontSize: 22)),
          ...company.employees.map((e) => Card(
            child: ListTile(
              title: Text(e.name),
              subtitle: Text('${e.position}, Age: ${e.age}'),
            ),
          )),
          Divider(),
          Text('Products', style: TextStyle(fontSize: 22)),
          ...company.products.map((p) => Card(
            child: ListTile(
              title: Text(p.name),
              subtitle: Text('\$${p.price} - ${p.inStock ? 'In Stock' : 'Out of Stock'}'),
            ),
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your action for adding new employee or product
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
