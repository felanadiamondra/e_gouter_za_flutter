import 'package:meta/meta.dart';

class Food {
  final String id;
  final String name;
  final String descri;
  final int price;
  final String resto;
  final String url;

  const Food({required this.id, required this.name,required this.descri, required this.price, required this.resto, required this.url});

  factory Food.fromJson(Map<String, dynamic>json) =>
      Food(id: json["id"], name: json["name"], descri:json["descri"], price: json["price"], resto: json["resto"], url: json["url"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['descri'] = this.descri;
    data['price'] = this.price;
    data['resto'] = this.resto;
    data['url'] = this.url;
    return data;
  }
}
