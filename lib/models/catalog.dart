class CatalogModel {
  static final items = [
  Item(
    id: "Codepur001",
    name: "iPhone 13  Pro",
    desc: "Apple iPhone 13th generation",
    price: 999,
    color: "#33505a",
    image: "https://5.imimg.com/data5/SELLER/Default/2021/11/QV/QS/QL/141494617/brand-new-apple-iphone-13-pro-max-128gb-256gb-512gb-1tb-500x500.jpg",
  )
];
}

class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}

