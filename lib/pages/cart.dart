import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: context.canvasColor,
        title: "Cart".text.make(),
        elevation: 0,
      ),
      body: Column(
        children: [
          _CartItems().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$9999"
              .text
              .xl4
              .semiBold
              .color(context.theme.colorScheme.primaryContainer)
              .make(),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(context.theme.colorScheme.primary),
              shape: MaterialStateProperty.all(
                StadiumBorder(),
              ),
            ),
            child: "Buy".text.color(Colors.white).make(),
          ).wh(130, 50)
        ],
      ),
    );
  }
}

class _CartItems extends StatelessWidget {
  const _CartItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.remove_circle_rounded),
        ),
        title: "Items ...".text.make(),
      ),
    );
  }
}
