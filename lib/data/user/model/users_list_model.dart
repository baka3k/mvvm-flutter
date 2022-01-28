import 'dart:convert';

List<UserModel> usersListModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String usersListModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    required this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  int id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"] ?? -1,
    name: json["name"],
    username: json["username"],
    email: json["email"],
    address:
    json["address"] == null ? null : Address.fromJson(json["address"]),
    phone: json["phone"],
    website: json["website"],
    company:
    json["company"] == null ? null : Company.fromJson(json["company"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "email": email,
    "address": address == null ? null : address!.toJson(),
    "phone": phone,
    "website": website,
    "company": company == null ? null : company!.toJson(),
  };
}

class Address {
  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  String? street;
  String? suite;
  String? city;
  String? zipcode;
  Geo? geo;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    street: json["street"] == null ? null : json["street"],
    suite: json["suite"] == null ? null : json["suite"],
    city: json["city"] == null ? null : json["city"],
    zipcode: json["zipcode"] == null ? null : json["zipcode"],
    geo: json["geo"] == null ? null : Geo.fromJson(json["geo"]),
  );

  Map<String, dynamic> toJson() => {
    "street": street == null ? null : street,
    "suite": suite == null ? null : suite,
    "city": city == null ? null : city,
    "zipcode": zipcode == null ? null : zipcode,
    "geo": geo == null ? null : geo!.toJson(),
  };
}

class Geo {
  Geo({
    this.lat,
    this.lng,
  });

  String? lat;
  String? lng;

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
    lat: json["lat"] == null ? null : json["lat"],
    lng: json["lng"] == null ? null : json["lng"],
  );

  Map<String, dynamic> toJson() => {
    "lat": lat == null ? null : lat,
    "lng": lng == null ? null : lng,
  };
}

class Company {
  Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  String? name;
  String? catchPhrase;
  String? bs;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    name: json["name"] == null ? null : json["name"],
    catchPhrase: json["catchPhrase"] == null ? null : json["catchPhrase"],
    bs: json["bs"] == null ? null : json["bs"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "catchPhrase": catchPhrase == null ? null : catchPhrase,
    "bs": bs == null ? null : bs,
  };
}