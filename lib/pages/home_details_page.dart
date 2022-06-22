import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/theme.dart';
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
          "Catalog App",
          style: TextStyle(
              color: MyTheme.darkBluishColor, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
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
        ).p24(),
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
                      .color(Color.fromARGB(255, 235, 238, 238))
                      .make()
                      .h40(context)
                      .centered()).py20(),
              Expanded(
                  child: VxArc(
                      height: 5.0,
                      arcType: VxArcType.CONVEX,
                      edge: VxEdge.TOP,
                      child: Container(
                        color: Color.fromARGB(255, 255, 255, 255),
                        width: context.screenWidth,
                        child: Column(
                          children: [
                            catalog.name.text.xl3.bold
                                .color(MyTheme.darkBluishColor)
                                .make(),
                            catalog.desc.text.lg
                                .textStyle(context.captionStyle)
                                .make(),
                            10.heightBox,
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
