import 'package:flutter/material.dart';
import 'package:returned_project/model/company.dart';
import 'package:returned_project/views/screens/home_screen.dart';

void main() {
  Company company = Company.fromJson({
    "company": "Tech Solutions",
    "location": "San Francisco",
    "employees": [
      {
        "name": "Alice",
        "age": 30,
        "position": "Developer",
        "skills": ["Dart", "Flutter", "Firebase"]
      },
      {
        "name": "Bob",
        "age": 25,
        "position": "Designer",
        "skills": ["Photoshop", "Illustrator"]
      }
    ],
    "products": [
      {
        "name": "Product A",
        "price": 29.99,
        "inStock": true
      },
      {
        "name": "Product B",
        "price": 49.99,
        "inStock": false
      }
    ]
  });

  runApp(MyApp(company: company));
}

class MyApp extends StatelessWidget {
  final Company company;

  MyApp({required this.company});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tech Solutions',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(company: company),
    );
  }
}
