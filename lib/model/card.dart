
class Cart {
  final String id;
  final String name;
  final String descri;
  final int price;
  final String resto;
  final String url;

  final int quantity;

  Cart(
      {required this.id,
      required this.name,
      required this.descri,
      required this.price,
      required this.resto,
      required this.url,
      required this.quantity});

  Cart.fromMap(Map<dynamic, dynamic> res)
      : id = res['id'],
        name = res['name'],
        descri = res['descri'],
        price = res['price'],
        resto = res['resto'],
        url = res['url'],
        quantity = res['quantity'];

  Map<String, Object> toMap() {
    return {
      'id': id,
      'name': name,
      'descri': descri,
      'price': price,
      'resto': resto,
      'url': url,
      'quantity': quantity
    };
  }
}
