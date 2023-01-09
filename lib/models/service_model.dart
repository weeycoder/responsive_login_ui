class ServiceModel {
  int? id;
  String? name;
  String? description;
  double? price;

  ServiceModel({
    this.id,
    this.name,
    this.description,
    this.price,
  });

  ServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
  }
}
