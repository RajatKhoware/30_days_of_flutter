// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/catalog.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';

class MyDetails extends StatelessWidget {
  const MyDetails({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Trending products",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 204, 204),
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        titleSpacing: 0,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.xl4.red800.bold.make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                      StadiumBorder(),
                    )),
                    child: "Buy".text.make())
                .wh(110, 50)
          ],
        ).p12(),
      ),
      // backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        bottom: false,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                      tag: Key(catalog.id.toString()),
                      child: Image.network(catalog.image)
                          .box
                          .size(350, 60)
                          .rounded
                          .p12
                          .color(context.cardColor)
                          .make()
                          .h40(context)
                          .centered())
                  .py12(),
              Expanded(
                  child: VxArc(
                      height: 0.0,
                      arcType: VxArcType.CONVEX,
                      edge: VxEdge.TOP,
                      child: Container(
                        color: (context.cardColor),
                        width: context.screenWidth,
                        child: Column(
                          children: [
                            catalog.name.text.xl3.bold
                                .color(context.accentColor)
                                .make(),
                            catalog.desc.text.lg
                                .textStyle(context.captionStyle)
                                .color(context.accentColor)
                                .make(),
                            10.heightBox,
                            "Syllable flirt thee this into lie or a. the more of sure i i door there, nearly though never but him. Has disaster angels and croaking till, before tapping still farther door."
                                .text
                                .textStyle(
                                  context.captionStyle,
                                )
                                .make()
                                .px24(),
                          ],
                        ).py12(),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
