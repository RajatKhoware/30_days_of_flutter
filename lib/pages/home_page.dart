import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/drawer.dart';

// We learn about trees and build context
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int a = 30;
    String s = "Codepur";

    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Center(
        child: Container(
          child: Text(
            "Welcome to $a days of flutter by $s ",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
