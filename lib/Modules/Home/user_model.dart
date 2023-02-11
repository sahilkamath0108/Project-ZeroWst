// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:zerowst_sendnodes/Modules/Food%20List/food_model.dart';

// class User {
//   String? role;
//   String fName;
//   String lname;
//   String email;
//   int number;
//   String password;
//   int? OTP;
//   List<Food>? foodBought;
//   User({
//     this.role,
//     required this.fName,
//     required this.lname,
//     required this.email,
//     required this.number,
//     required this.password,
//     this.OTP,
//     this.foodBought,
//   });
//
//   User copyWith({
//     String? role,
//     String? fName,
//     String? lname,
//     String? email,
//     int? number,
//     String? password,
//     int? OTP,
//     List<Food>? foodBought,
//   }) {
//     return User(
//       role: role ?? this.role,
//       fName: fName ?? this.fName,
//       lname: lname ?? this.lname,
//       email: email ?? this.email,
//       number: number ?? this.number,
//       password: password ?? this.password,
//       OTP: OTP ?? this.OTP,
//       foodBought: foodBought ?? this.foodBought,
//     );
//   }
//
//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'role': role,
//       'fName': fName,
//       'lname': lname,
//       'email': email,
//       'number': number,
//       'password': password,
//       'OTP': OTP,
//       'foodBought':
//           foodBought != null ? foodBought!.map((x) => x.toMap()).toList() : [],
//     };
//   }
//
//   factory User.fromMap(Map<String, dynamic> map) {
//     return User(
//       role: map['role'] != null ? map['role'] as String : null,
//       fName: map['fName'] as String,
//       lname: map['lname'] as String,
//       email: map['email'] as String,
//       number: map['number'] as int,
//       password: map['password'] as String,
//       OTP: map['OTP'] != null ? map['OTP'] as int : null,
//       foodBought: map['foodBought'] != null
//           ? List<Food>.from(
//               (map['foodBought'] as List<int>).map<Food?>(
//                 (x) => Food.fromMap(x as Map<String, dynamic>),
//               ),
//             )
//           : null,
//     );
//   }
//
//   String toJson() => json.encode(toMap());
//
//   factory User.fromJson(String source) =>
//       User.fromMap(json.decode(source) as Map<String, dynamic>);
//
//   @override
//   String toString() {
//     return 'User(role: $role, fName: $fName, lname: $lname, email: $email, number: $number, password: $password, OTP: $OTP, foodBought: $foodBought)';
//   }
//
//   @override
//   bool operator ==(covariant User other) {
//     if (identical(this, other)) return true;
//
//     return other.role == role &&
//         other.fName == fName &&
//         other.lname == lname &&
//         other.email == email &&
//         other.number == number &&
//         other.password == password &&
//         other.OTP == OTP &&
//         listEquals(other.foodBought, foodBought);
//   }
//
//   @override
//   int get hashCode {
//     return role.hashCode ^
//         fName.hashCode ^
//         lname.hashCode ^
//         email.hashCode ^
//         number.hashCode ^
//         password.hashCode ^
//         OTP.hashCode ^
//         foodBought.hashCode;
//   }
// }

class UserModel {
  UserModel({
    required this.user,
    required this.token,
  });
  late final User user;
  late final String token;

  UserModel.fromJson(Map<String, dynamic> json){
    user = User.fromJson(json['user']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
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
    required this.number,
    required this.foodBought,
    required this.token,
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
  late final List<dynamic> foodBought;
  late final List<dynamic> token;
  late final String createdAt;
  late final String updatedAt;
  late final int V;

  User.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    role = json['role'];
    fname = json['fname'];
    lname = json['lname'];
    email = json['email'];
    number = json['number'];
    foodBought = List.castFrom<dynamic, dynamic>(json['foodBought']);
    token = List.castFrom<dynamic, dynamic>(json['token']);
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
    _data['foodBought'] = foodBought;
    _data['token'] = token;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}
