class CategoryModel {
  String name;
  CategoryModel({
    this.name,
  });

  CategoryModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map["name"];
  }

  toJson() {
    return {
      "name": name,
    };
  }
}
