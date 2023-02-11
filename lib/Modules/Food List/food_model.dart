// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Food {
  String id;
  String name;
  String expiryDate;
  bool isVeg;
  // double latitude;
  // double longitude;
  int pinCode;
  String imgUrl;
  String ProviderName;
  Food({
    required this.id,
    required this.name,
    required this.expiryDate,
    required this.isVeg,
    // required this.latitude,
    // required this.longitude,
    required this.pinCode,
    required this.imgUrl,
    required this.ProviderName,
  });

  Food copyWith({
    String? id,
    String? name,
    String? expiryDate,
    bool? isVeg,
    double? latitude,
    double? longitude,
    int? pinCode,
    String? imgUrl,
    String? ProviderName,
  }) {
    return Food(
      id: id ?? this.id,
      name: name ?? this.name,
      expiryDate: expiryDate ?? this.expiryDate,
      isVeg: isVeg ?? this.isVeg,
      // latitude: latitude ?? this.latitude,
      // longitude: longitude ?? this.longitude,
      pinCode: pinCode ?? this.pinCode,
      imgUrl: imgUrl ?? this.imgUrl,
      ProviderName: ProviderName ?? this.ProviderName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'expiryDate': expiryDate,
      'isVeg': isVeg,
      // 'latitude': latitude,
      // 'longitude': longitude,
      'pinCode': pinCode,
      'imgUrl': imgUrl,
      'ProviderName': ProviderName,
    };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      id: map['id'] as String,
      name: map['name'] as String,
      expiryDate: map['expiryDate'] as String,
      isVeg: map['isVeg'] as bool,
      // latitude: map['latitude'] as double,
      // longitude: map['longitude'] as double,
      pinCode: map['pinCode'] as int,
      imgUrl: map['imgUrl'] as String,
      ProviderName: map['ProviderName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Food.fromJson(String source) =>
      Food.fromMap(json.decode(source) as Map<String, dynamic>);

  // @override
  // String toString() {
  //   return 'Food(id: $id, name: $name, expiryDate: $expiryDate, isVeg: $isVeg, latitude: $latitude, longitude: $longitude, pinCode: $pinCode, imgUrl: $imgUrl, ProviderName: $ProviderName)';
  // }
  //
  // @override
  // bool operator ==(covariant Food other) {
  //   if (identical(this, other)) return true;
  //
  //   return other.id == id &&
  //       other.name == name &&
  //       other.expiryDate == expiryDate &&
  //       other.isVeg == isVeg &&
  //       other.latitude == latitude &&
  //       other.longitude == longitude &&
  //       other.pinCode == pinCode &&
  //       other.imgUrl == imgUrl &&
  //       other.ProviderName == ProviderName;
  // }
  //
  // @override
  // int get hashCode {
  //   return id.hashCode ^
  //       name.hashCode ^
  //       expiryDate.hashCode ^
  //       isVeg.hashCode ^
  //       latitude.hashCode ^
  //       longitude.hashCode ^
  //       pinCode.hashCode ^
  //       imgUrl.hashCode ^
  //       ProviderName.hashCode;
  // }
}
