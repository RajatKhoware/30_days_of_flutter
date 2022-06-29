import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart_model.dart';
import 'package:velocity_x/velocity_x.dart';
import '../core/my_store.dart';

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
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            builder: ((context, _, BuildContext) {
              return "\$${_cart.totalPrice}"
                  .text
                  .xl4
                  .semiBold
                  .color(context.theme.colorScheme.primaryContainer)
                  .make();
            }),
            mutations: {RemoveMutation},
            notifications: {},
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: "       Buying not supported yet..."
                    .text
                    .color(context.accentColor)
                    .make(),
                duration: Duration(milliseconds: 1200),
              ));
            },
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

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Cart is Empty".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                onPressed: () => RemoveMutation(_cart.items[index]),
                icon: Icon(Icons.remove_circle_rounded),
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
