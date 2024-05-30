import 'package:returned_project/model/employee.dart';
import 'package:returned_project/model/product.dart';

class Company {
  String company;
  String location;
  List<Employee> employees;
  List<Product> products;

  Company({required this.company, required this.location, required this.employees, required this.products});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      company: json['company'],
      location: json['location'],
      employees: List<Employee>.from(json['employees'].map((x) => Employee.fromJson(x))),
      products: List<Product>.from(json['products'].map((x) => Product.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'company': company,
      'location': location,
      'employees': employees.map((e) => e.toJson()).toList(),
      'products': products.map((p) => p.toJson()).toList(),
    };
  }
}