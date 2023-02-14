class UserModel {
  UserModel({
    required this.success,
    required this.user,
    required this.token,
  });
  late final bool success;
  late final User user;
  late final String token;

  UserModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    user = User.fromJson(json['user']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['user'] = user.toJson();
    _data['token'] = token;
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.role,
    required this.fname,
    required this.lname,
    required this.email,
    required this.longitude,
    required this.latitude,
    required this.number,
    required this.foodBought,
    required this.reviews,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final String id;
  late final String role;
  late final String fname;
  late final String lname;
  late final String email;
  late final double longitude;
  late final double latitude;
  late final int number;
  late final List<dynamic> foodBought;
  late final List<dynamic> reviews;
  late final String createdAt;
  late final String updatedAt;
  late final int V;

  User.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    role = json['role'];
    fname = json['fname'];
    lname = json['lname'];
    email = json['email'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    number = json['number'];
    foodBought = List.castFrom<dynamic, dynamic>(json['foodBought']);
    reviews = List.castFrom<dynamic, dynamic>(json['reviews']);
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['role'] = role;
    _data['fname'] = fname;
    _data['lname'] = lname;
    _data['email'] = email;
    _data['longitude'] = longitude;
    _data['latitude'] = latitude;
    _data['number'] = number;
    _data['foodBought'] = foodBought;
    _data['reviews'] = reviews;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}