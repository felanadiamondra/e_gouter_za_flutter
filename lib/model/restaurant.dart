
class Restaurant {
  final String id;
  final String name;
  final String logourl;
  final String backgroundurl;

  const Restaurant({required this.id, required this.name,required this.logourl, required this.backgroundurl});

  factory Restaurant.fromJson(Map<String, dynamic>json) =>
      Restaurant(id: json["id"], name: json["name"], logourl: json["logourl"], backgroundurl: json["backgroundurl"]);

}
