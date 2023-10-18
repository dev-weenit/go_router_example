// ignore_for_file: public_member_api_docs, sort_constructors_first
class Item {
  final int id;
  final String name;
  final String category;
  final String shop;

  Item({
    required this.id,
    required this.name,
    required this.category,
    required this.shop,
  });

  @override
  String toString() {
    return 'Item(id: $id, name: $name, category: $category, shop: $shop)';
  }
}
