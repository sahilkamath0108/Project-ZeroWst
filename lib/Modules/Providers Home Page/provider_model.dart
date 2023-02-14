class ProviderMain {
  ProviderMain({
    required this.provider,
    required this.token,
  });
  late final Provider provider;
  late final String token;

  ProviderMain.fromJson(Map<String, dynamic> json){
    provider = Provider.fromJson(json['provider']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['provider'] = provider.toJson();
    _data['token'] = token;
    return _data;
  }
}

class Provider {
  Provider({
    required this.reviews,
    required this.id,
    required this.role,
    required this.fname,
    required this.lname,
    required this.organization,
    required this.aadharCardNo,
    required this.latitude,
    required this.longitude,
    required this.email,
    required this.number,
    required this.isVerified,
    required this.food,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final List<dynamic> reviews;
  late final String id;
  late final String role;
  late final String fname;
  late final String lname;
  late final String organization;
  late final int aadharCardNo;
  late final double latitude;
  late final double longitude;
  late final String email;
  late final int number;
  late final bool isVerified;
  late final List<dynamic> food;
  late final String createdAt;
  late final String updatedAt;
  late final int V;

  Provider.fromJson(Map<String, dynamic> json){
    reviews = List.castFrom<dynamic, dynamic>(json['reviews']);
    id = json['_id'];
    role = json['role'];
    fname = json['fname'];
    lname = json['lname'];
    organization = json['organization'];
    aadharCardNo = json['aadharCardNo'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    email = json['email'];
    number = json['number'];
    isVerified = json['isVerified'];
    food = List.castFrom<dynamic, dynamic>(json['food']);
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['reviews'] = reviews;
    _data['_id'] = id;
    _data['role'] = role;
    _data['fname'] = fname;
    _data['lname'] = lname;
    _data['organization'] = organization;
    _data['aadharCardNo'] = aadharCardNo;
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    _data['email'] = email;
    _data['number'] = number;
    _data['isVerified'] = isVerified;
    _data['food'] = food;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}