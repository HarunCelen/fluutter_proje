class Students {
  int? id;
  String? name;
  String? lastName;
  int? seviye;

  Students({this.name, this.lastName, this.seviye});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["id"] = id;
    map["name"] = name;
    map["lastname"] = lastName;
    map["seviye"] = seviye;
    return map;
  }

  Students.fromMap(Map<String, dynamic> map) {
    map["id"] = id;
    map["name"] = name;
    map["lastname"] = lastName;
    map["seviye"] = seviye;
  }
}
