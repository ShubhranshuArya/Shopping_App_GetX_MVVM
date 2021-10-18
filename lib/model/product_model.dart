class ProductModel {
  String name, description, price, color, size;

  ProductModel({
    this.name,
    this.description,
    this.price,
    this.color,
    this.size,
  });

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map["name"];
    description = map["description"];
    price = map["price"];
    color = map["color"];
    size = map["size"];
  }

  toJson() {
    return {
      "name": name,
      "description": description,
      "price": price,
      "color": color,
      "size": size,
    };
  }
}
