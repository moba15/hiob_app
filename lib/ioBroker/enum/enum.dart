import 'dart:convert';

class Enum {
  String name;
  String id;
  String? icon;
  List<String> members;

  Enum({required this.name, required this.id, required this.icon, required this.members});

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "name": name,
        "icon": icon,
        "members": jsonEncode(members),
      };
  factory Enum.fromJSON(Map<String, dynamic> json) {
    if(json["members"] is String) {
      return Enum(name: json["name"],
          id: json["id"],
          icon: json["icon"],
          members: (jsonDecode(json["members"]) as List<dynamic>).map((e) =>
              e.toString()).toList());
    } else {
      return Enum(name: json["name"],
          id: json["id"],
          icon: json["icon"],
          members: (json["members"] as List<dynamic>).map((e) =>
              e.toString()).toList());
    }
  }

}