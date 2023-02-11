// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Provider {
  //String providerName;
  String id;
  String gstin;
  String fName;
  String lName;
  String email;
  String password;
  String phoneNumber;
  double restaurantLatitude;
  double restaurantLongitude;
  String restaurantName;
  int OTP;
  String imgUrl;
  Provider({
    //required this.providerName,
    required this.id,
    required this.gstin,
    required this.fName,
    required this.lName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.restaurantLatitude,
    required this.restaurantLongitude,
    required this.restaurantName,
    required this.OTP,
    required this.imgUrl,
  });

  Provider copyWith({
    String? providerName,
    String? id,
    String? gstin,
    String? fName,
    String? lName,
    String? email,
    String? password,
    String? phoneNumber,
    double? restaurantLatitude,
    double? restaurantLongitude,
    String? restaurantName,
    int? OTP,
    String? imgUrl,
  }) {
    return Provider(
      //providerName: providerName ?? this.providerName,
      id: id ?? this.id,
      gstin: gstin ?? this.gstin,
      fName: fName ?? this.fName,
      lName: lName ?? this.lName,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      restaurantLatitude: restaurantLatitude ?? this.restaurantLatitude,
      restaurantLongitude: restaurantLongitude ?? this.restaurantLongitude,
      restaurantName: restaurantName ?? this.restaurantName,
      OTP: OTP ?? this.OTP,
      imgUrl: imgUrl ?? this.imgUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      //'providerName': providerName,
      'id': id,
      'gstin': gstin,
      'fName': fName,
      'lName': lName,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'restaurantLatitude': restaurantLatitude,
      'restaurantLongitude': restaurantLongitude,
      'restaurantName': restaurantName,
      'OTP': OTP,
      'imgUrl': imgUrl,
    };
  }

  factory Provider.fromMap(Map<String, dynamic> map) {
    return Provider(
      //roviderName: map['providerName'] as String,
      id: map['id'] as String,
      gstin: map['gstin'] as String,
      fName: map['fName'] as String,
      lName: map['lName'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      phoneNumber: map['phoneNumber'] as String,
      restaurantLatitude: map['restaurantLatitude'] as double,
      restaurantLongitude: map['restaurantLongitude'] as double,
      restaurantName: map['restaurantName'] as String,
      OTP: map['OTP'] as int,
      imgUrl: map['imgUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Provider.fromJson(String source) => Provider.fromMap(json.decode(source) as Map<String, dynamic>);

  // @override
  // String toString() {
  //   return 'Provider(providerName: $providerName, id: $id, gstin: $gstin, fName: $fName, lName: $lName, email: $email, password: $password, phoneNumber: $phoneNumber, restaurantLatitude: $restaurantLatitude, restaurantLongitude: $restaurantLongitude, restaurantName: $restaurantName, OTP: $OTP, imgUrl: $imgUrl)';
  // }
  //
  // @override
  // bool operator ==(covariant Provider other) {
  //   if (identical(this, other)) return true;
  //
  //   return
  //     other.providerName == providerName &&
  //     other.id == id &&
  //     other.gstin == gstin &&
  //     other.fName == fName &&
  //     other.lName == lName &&
  //     other.email == email &&
  //     other.password == password &&
  //     other.phoneNumber == phoneNumber &&
  //     other.restaurantLatitude == restaurantLatitude &&
  //     other.restaurantLongitude == restaurantLongitude &&
  //     other.restaurantName == restaurantName &&
  //     other.OTP == OTP &&
  //     other.imgUrl == imgUrl;
  // }
  //
  // @override
  // int get hashCode {
  //   return providerName.hashCode ^
  //     id.hashCode ^
  //     gstin.hashCode ^
  //     fName.hashCode ^
  //     lName.hashCode ^
  //     email.hashCode ^
  //     password.hashCode ^
  //     phoneNumber.hashCode ^
  //     restaurantLatitude.hashCode ^
  //     restaurantLongitude.hashCode ^
  //     restaurantName.hashCode ^
  //     OTP.hashCode ^
  //     imgUrl.hashCode;
  // }
}
