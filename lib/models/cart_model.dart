import 'package:flutter_application_1/core/my_store.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // catalog field
  late CatalogModel _catalog;

  // collection of Ids = store Ids of each line
  final List<int> _itemIds = [];

  // getter Catalog
  CatalogModel get catalog => _catalog;

  // setter Catalog
  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // formula for Getting total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
}
