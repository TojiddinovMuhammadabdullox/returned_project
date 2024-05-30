import 'package:returned_project/model/company.dart';
import 'package:returned_project/model/employee.dart';
import 'package:returned_project/model/product.dart';

class CompanyController {
  Company company;

  CompanyController({required this.company});

  void addEmployee(Employee employee) {
    company.employees.add(employee);
  }

  void removeEmployee(String employeeName) {
    company.employees.removeWhere((employee) => employee.name == employeeName);
  }

  void addProduct(Product product) {
    company.products.add(product);
  }

  void removeProduct(String productName) {
    company.products.removeWhere((product) => product.name == productName);
  }

  void updateProduct(String productName, Product newProduct) {
    int index = company.products.indexWhere((product) => product.name == productName);
    if (index != -1) {
      company.products[index] = newProduct;
    }
  }
}
