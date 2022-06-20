// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/item_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int a = 30;
  String s = "Codepur";

  void initState() {
    super.initState();
    loadData();
  }

//Getting data from json file
  loadData() async {
    //await Future.delayed(Duration(seconds: 1));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodeData = jsonDecode(catalogJson);
    var productsData = decodeData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      //Progress indicator
      body: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
          ? Center(
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 14,
                    ),
                    itemBuilder: (context, index) {
                      final item = CatalogModel.items[index];
                      return Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: GridTile(
                          child: Image.network(item.image),
                          header: Container(
                            child: Text(
                              item.name,
                              style: TextStyle(color: Colors.white),
                            ),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 94, 255),
                            ),
                          ),
                          footer: Container(
                            child: Text(
                              item.price.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: CatalogModel.items.length,
                  )
                  //  ListView.builder(
                  //   itemCount: CatalogModel.items.length,
                  //   itemBuilder: (context, index) {
                  //     return ItemWidget(
                  //       item: CatalogModel.items[index],
                  //     );
                  //   },
                  // ),
                  ),
            )
          //Progress indicator
          : Center(
              child: CircularProgressIndicator(),
            ),
      drawer: MyDrawer(),
    );
  }
}
