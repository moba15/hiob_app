import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';

enum IconDataType {
  flutterIcons,
  ionIcons,
}

extension IconDataTypeExtension on IconDataType {
  String get fontPackage {
    switch (this) {
      case IconDataType.flutterIcons:
        return "materialicons";
      case IconDataType.ionIcons:
        return "ionicons";
    }
  }

  String get fontFamily {
    switch (this) {
      case IconDataType.flutterIcons:
        return "MaterialIcons";
      case IconDataType.ionIcons:
        return "Ionicons";
    }
  }
}

class IconWrapper {
  final IconDataType iconDataType;
  final IconData iconData;
  const IconWrapper({required this.iconDataType, required this.iconData});

  Icon get icon {
    return Icon(iconData);
  }

  factory IconWrapper.fromJSON(Map<String, dynamic> json) {
    IconDataType iconDataType = IconDataType.values.firstWhere(
        (element) => element.name == json["iconDataType"],
        orElse: (() => IconDataType.flutterIcons));
    return IconWrapper(
        iconDataType: iconDataType,
        iconData: IconData(int.parse(json["iconDataId"], radix: 16),
            fontFamily: "Ionicons", fontPackage: "ionicons"));
  }
}

Map<String, IconWrapper> icons = {
  "flutter": IconWrapper(
      iconData: Icons.home, iconDataType: IconDataType.flutterIcons),
  "ionicons":
      IconWrapper(iconData: Icons.home, iconDataType: IconDataType.ionIcons),

  /*"floor home 0 zero ground ": CommunityMaterialIcons.home_floor_0,
  "floor home 1 first ": CommunityMaterialIcons.home_floor_1,
  "floor home 2 second ": CommunityMaterialIcons.home_floor_2,
  "floor home 3 third ": CommunityMaterialIcons.home_floor_3,
  "floor home -1 negative one basement": CommunityMaterialIcons.home_floor_negative_1,
  "floor home a": CommunityMaterialIcons.home_floor_a,
  "floor home b": CommunityMaterialIcons.home_floor_b,
  "floor home g": CommunityMaterialIcons.home_floor_g,
  "floor home l": CommunityMaterialIcons.home_floor_l,*/
};
