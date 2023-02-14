class AdminModel {
  AdminModel({
    required this.success,
    required this.admin,
    required this.token,
  });
  late final bool success;
  late final Admin admin;
  late final String token;

  AdminModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    admin = Admin.fromJson(json['admin']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['admin'] = admin.toJson();
    _data['token'] = token;
    return _data;
  }
}

class Admin {
  Admin({
    required this.id,
    required this.role,
    required this.fname,
    required this.lname,
    required this.email,
    required this.number,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final String id;
  late final String role;
  late final String fname;
  late final String lname;
  late final String email;
  late final int number;
  late final String createdAt;
  late final String updatedAt;
  late final int V;

  Admin.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    role = json['role'];
    fname = json['fname'];
    lname = json['lname'];
    email = json['email'];
    number = json['number'];
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
    _data['number'] = number;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}