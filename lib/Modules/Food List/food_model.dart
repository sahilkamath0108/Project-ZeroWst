class FoodModel {
  FoodModel({
    required this.success,
    required this.data,
  });
  late final bool success;
  late final List<Data> data;

  FoodModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.expiryDate,
    required this.available,
    required this.stock,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final String id;
  late final String name;
  late final String expiryDate;
  late final bool available;
  late final int stock;
  late final String createdAt;
  late final String updatedAt;
  late final int V;

  Data.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    name = json['name'];
    expiryDate = json['expiryDate'];
    available = json['available'];
    stock = json['stock'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['expiryDate'] = expiryDate;
    _data['available'] = available;
    _data['stock'] = stock;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}