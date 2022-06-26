import 'package:flutter_application_1/models/catalog.dart';

class CartModel {
  // Creating a single ton
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;


  //catalog field
  late CatalogModel _catalog;

//collection of Ids = store Ids of each line
  final List<int> _itemIds = [];

  //Get Catalog
  CatalogModel get catalog => _catalog;

  //set Catalog
  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

//formula for Getting total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

// Add Item
  void add(Item item) {
    _itemIds.add(item.id);
  }

// Removing items
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
