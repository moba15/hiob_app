import 'dart:convert';

class Screen {
  final String id;
  final String name;
  final String iconID;
  final int index;
  List<dynamic> widgetIds;

  Screen(
      {required this.id,
      required this.name,
      required this.iconID,
      required this.index,
      required this.widgetIds});

  factory Screen.fromJSON(Map<String, dynamic> json) => Screen(
        id: json["id"],
        iconID: json["iconID"],
        name: json["name"],
        index: json["index"],
        widgetIds: jsonDecode(json["widgetIds"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "iconID": iconID,
        "index": index,
        "widgetIds": jsonEncode(widgetIds),
      };
}