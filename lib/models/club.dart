class Club {
  int? clubID;
  String? name;
  String? city;
  String? postalCode;
  String? clubFullName;

  Club.init(
      this.clubID, this.name, this.city, this.postalCode, this.clubFullName);

  Club();

  Club.fromJsonMap(Map<String, dynamic> map) {
    clubID = map["ClubID"];
    name = map["Name"];
    city = map["City"];
    postalCode = map["PostalCode"];
    clubFullName = map["ClubFullName"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};

    map["ClubID"] = clubID;
    map["Name"] = name;
    map["City"] = city;
    map["PostalCode"] = postalCode;
    map["ClubFullName"] = clubFullName;

    return map;
  }
}
