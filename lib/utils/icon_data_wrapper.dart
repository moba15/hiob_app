import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

enum IconDataType {
  flutterIcons,
  ionIcons,
}

extension IconDataTypeExtension on IconDataType {
  String? get fontPackage {
    switch (this) {
      case IconDataType.flutterIcons:
        return null;
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
  const IconWrapper(
      {this.iconDataType = IconDataType.flutterIcons,
      this.iconData = Icons.home});

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
            fontFamily: iconDataType.fontFamily,
            fontPackage: iconDataType.fontPackage));
  }

  Map<String, dynamic> toJson() {
    return {
      "iconDataType": iconDataType.name,
      "iconDataId": iconData.codePoint.toRadixString(16),
    };
  }
}

Map<String, IconWrapper> icons = {
  "MaterialIcons ac unit": const IconWrapper(
      iconData: Icons.ac_unit, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons access alarm": const IconWrapper(
      iconData: Icons.access_alarm, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons access alarms": const IconWrapper(
      iconData: Icons.access_alarms, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons access time": const IconWrapper(
      iconData: Icons.access_time, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons accessibility": const IconWrapper(
      iconData: Icons.accessibility, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons accessibility new": const IconWrapper(
      iconData: Icons.accessibility_new,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons accessible": const IconWrapper(
      iconData: Icons.accessible, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons accessible forward": const IconWrapper(
      iconData: Icons.accessible_forward,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons account balance": const IconWrapper(
      iconData: Icons.account_balance, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons account balance wallet": const IconWrapper(
      iconData: Icons.account_balance_wallet,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons account box": const IconWrapper(
      iconData: Icons.account_box, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons account circle": const IconWrapper(
      iconData: Icons.account_circle, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons account tree": const IconWrapper(
      iconData: Icons.account_tree, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons ad units": const IconWrapper(
      iconData: Icons.ad_units, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons adb": const IconWrapper(
      iconData: Icons.adb, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons add": const IconWrapper(
      iconData: Icons.add, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons add a photo": const IconWrapper(
      iconData: Icons.add_a_photo, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons add alarm": const IconWrapper(
      iconData: Icons.add_alarm, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons add alert": const IconWrapper(
      iconData: Icons.add_alert, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons add box": const IconWrapper(
      iconData: Icons.add_box, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons add business": const IconWrapper(
      iconData: Icons.add_business, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons add call": const IconWrapper(
      iconData: Icons.add_call, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons add card": const IconWrapper(
      iconData: Icons.add_card, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons add chart": const IconWrapper(
      iconData: Icons.add_chart, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons add circle": const IconWrapper(
      iconData: Icons.add_circle, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons add comment": const IconWrapper(
      iconData: Icons.add_comment, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons add home": const IconWrapper(
      iconData: Icons.add_home, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons add home work": const IconWrapper(
      iconData: Icons.add_home_work, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons add ic call": const IconWrapper(
      iconData: Icons.add_ic_call, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons add link": const IconWrapper(
      iconData: Icons.add_link, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons add location": const IconWrapper(
      iconData: Icons.add_location, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons add location alt": const IconWrapper(
      iconData: Icons.add_location_alt,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons add moderator": const IconWrapper(
      iconData: Icons.add_moderator, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons add photo alternate": const IconWrapper(
      iconData: Icons.add_photo_alternate,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons add reaction": const IconWrapper(
      iconData: Icons.add_reaction, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons add road": const IconWrapper(
      iconData: Icons.add_road, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons add shopping cart": const IconWrapper(
      iconData: Icons.add_shopping_cart,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons add task": const IconWrapper(
      iconData: Icons.add_task, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons add to drive": const IconWrapper(
      iconData: Icons.add_to_drive, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons add to home screen": const IconWrapper(
      iconData: Icons.add_to_home_screen,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons add to photos": const IconWrapper(
      iconData: Icons.add_to_photos, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons add to queue": const IconWrapper(
      iconData: Icons.add_to_queue, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons addchart": const IconWrapper(
      iconData: Icons.addchart, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons adf scanner": const IconWrapper(
      iconData: Icons.adf_scanner, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons adjust": const IconWrapper(
      iconData: Icons.adjust, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons admin panel settings": const IconWrapper(
      iconData: Icons.admin_panel_settings,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons adobe": const IconWrapper(
      iconData: Icons.adobe, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons ads click": const IconWrapper(
      iconData: Icons.ads_click, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons agriculture": const IconWrapper(
      iconData: Icons.agriculture, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons air": const IconWrapper(
      iconData: Icons.air, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons airline seat flat": const IconWrapper(
      iconData: Icons.airline_seat_flat,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons airline seat flat angled": const IconWrapper(
      iconData: Icons.airline_seat_flat_angled,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons airline seat individual suite": const IconWrapper(
      iconData: Icons.airline_seat_individual_suite,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons airline seat legroom extra": const IconWrapper(
      iconData: Icons.airline_seat_legroom_extra,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons airline seat legroom normal": const IconWrapper(
      iconData: Icons.airline_seat_legroom_normal,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons airline seat legroom reduced": const IconWrapper(
      iconData: Icons.airline_seat_legroom_reduced,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons airline seat recline extra": const IconWrapper(
      iconData: Icons.airline_seat_recline_extra,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons airline seat recline normal": const IconWrapper(
      iconData: Icons.airline_seat_recline_normal,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons airline stops": const IconWrapper(
      iconData: Icons.airline_stops, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons airlines": const IconWrapper(
      iconData: Icons.airlines, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons airplane ticket": const IconWrapper(
      iconData: Icons.airplane_ticket, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons airplanemode active": const IconWrapper(
      iconData: Icons.airplanemode_active,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons airplanemode inactive": const IconWrapper(
      iconData: Icons.airplanemode_inactive,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons airplanemode off": const IconWrapper(
      iconData: Icons.airplanemode_off,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons airplanemode on": const IconWrapper(
      iconData: Icons.airplanemode_on, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons airplay": const IconWrapper(
      iconData: Icons.airplay, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons airport shuttle": const IconWrapper(
      iconData: Icons.airport_shuttle, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons alarm": const IconWrapper(
      iconData: Icons.alarm, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons alarm add": const IconWrapper(
      iconData: Icons.alarm_add, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons alarm off": const IconWrapper(
      iconData: Icons.alarm_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons alarm on": const IconWrapper(
      iconData: Icons.alarm_on, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons album": const IconWrapper(
      iconData: Icons.album, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons align horizontal center": const IconWrapper(
      iconData: Icons.align_horizontal_center,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons align horizontal left": const IconWrapper(
      iconData: Icons.align_horizontal_left,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons align horizontal right": const IconWrapper(
      iconData: Icons.align_horizontal_right,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons align vertical bottom": const IconWrapper(
      iconData: Icons.align_vertical_bottom,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons align vertical center": const IconWrapper(
      iconData: Icons.align_vertical_center,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons align vertical top": const IconWrapper(
      iconData: Icons.align_vertical_top,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons all inbox": const IconWrapper(
      iconData: Icons.all_inbox, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons all inclusive": const IconWrapper(
      iconData: Icons.all_inclusive, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons all out": const IconWrapper(
      iconData: Icons.all_out, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons alt route": const IconWrapper(
      iconData: Icons.alt_route, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons alternate email": const IconWrapper(
      iconData: Icons.alternate_email, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons amp stories": const IconWrapper(
      iconData: Icons.amp_stories, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons analytics": const IconWrapper(
      iconData: Icons.analytics, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons anchor": const IconWrapper(
      iconData: Icons.anchor, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons android": const IconWrapper(
      iconData: Icons.android, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons animation": const IconWrapper(
      iconData: Icons.animation, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons announcement": const IconWrapper(
      iconData: Icons.announcement, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons aod": const IconWrapper(
      iconData: Icons.aod, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons apartment": const IconWrapper(
      iconData: Icons.apartment, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons api": const IconWrapper(
      iconData: Icons.api, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons app blocking": const IconWrapper(
      iconData: Icons.app_blocking, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons app registration": const IconWrapper(
      iconData: Icons.app_registration,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons app settings alt": const IconWrapper(
      iconData: Icons.app_settings_alt,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons app shortcut": const IconWrapper(
      iconData: Icons.app_shortcut, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons apple": const IconWrapper(
      iconData: Icons.apple, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons approval": const IconWrapper(
      iconData: Icons.approval, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons apps": const IconWrapper(
      iconData: Icons.apps, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons apps outage": const IconWrapper(
      iconData: Icons.apps_outage, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons architecture": const IconWrapper(
      iconData: Icons.architecture, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons archive": const IconWrapper(
      iconData: Icons.archive, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons area chart": const IconWrapper(
      iconData: Icons.area_chart, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons arrow back": const IconWrapper(
      iconData: Icons.arrow_back, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons arrow back ios": const IconWrapper(
      iconData: Icons.arrow_back_ios, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons arrow back ios new": const IconWrapper(
      iconData: Icons.arrow_back_ios_new,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons arrow circle down": const IconWrapper(
      iconData: Icons.arrow_circle_down,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons arrow circle left": const IconWrapper(
      iconData: Icons.arrow_circle_left,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons arrow circle right": const IconWrapper(
      iconData: Icons.arrow_circle_right,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons arrow circle up": const IconWrapper(
      iconData: Icons.arrow_circle_up, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons arrow downward": const IconWrapper(
      iconData: Icons.arrow_downward, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons arrow drop down": const IconWrapper(
      iconData: Icons.arrow_drop_down, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons arrow drop down circle": const IconWrapper(
      iconData: Icons.arrow_drop_down_circle,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons arrow drop up": const IconWrapper(
      iconData: Icons.arrow_drop_up, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons arrow forward": const IconWrapper(
      iconData: Icons.arrow_forward, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons arrow forward ios": const IconWrapper(
      iconData: Icons.arrow_forward_ios,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons arrow left": const IconWrapper(
      iconData: Icons.arrow_left, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons arrow outward": const IconWrapper(
      iconData: Icons.arrow_outward, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons arrow right": const IconWrapper(
      iconData: Icons.arrow_right, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons arrow right alt": const IconWrapper(
      iconData: Icons.arrow_right_alt, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons arrow upward": const IconWrapper(
      iconData: Icons.arrow_upward, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons art track": const IconWrapper(
      iconData: Icons.art_track, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons article": const IconWrapper(
      iconData: Icons.article, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons aspect ratio": const IconWrapper(
      iconData: Icons.aspect_ratio, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons assessment": const IconWrapper(
      iconData: Icons.assessment, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons assignment": const IconWrapper(
      iconData: Icons.assignment, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons assignment add": const IconWrapper(
      iconData: Icons.assignment_add, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons assignment ind": const IconWrapper(
      iconData: Icons.assignment_ind, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons assignment late": const IconWrapper(
      iconData: Icons.assignment_late, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons assignment return": const IconWrapper(
      iconData: Icons.assignment_return,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons assignment returned": const IconWrapper(
      iconData: Icons.assignment_returned,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons assignment turned in": const IconWrapper(
      iconData: Icons.assignment_turned_in,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons assist walker": const IconWrapper(
      iconData: Icons.assist_walker, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons assistant": const IconWrapper(
      iconData: Icons.assistant, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons assistant direction": const IconWrapper(
      iconData: Icons.assistant_direction,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons assistant navigation": const IconWrapper(
      iconData: Icons.assistant_navigation,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons assistant photo": const IconWrapper(
      iconData: Icons.assistant_photo, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons assured workload": const IconWrapper(
      iconData: Icons.assured_workload,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons atm": const IconWrapper(
      iconData: Icons.atm, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons attach email": const IconWrapper(
      iconData: Icons.attach_email, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons attach file": const IconWrapper(
      iconData: Icons.attach_file, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons attach money": const IconWrapper(
      iconData: Icons.attach_money, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons attachment": const IconWrapper(
      iconData: Icons.attachment, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons attractions": const IconWrapper(
      iconData: Icons.attractions, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons attribution": const IconWrapper(
      iconData: Icons.attribution, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons audio file": const IconWrapper(
      iconData: Icons.audio_file, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons audiotrack": const IconWrapper(
      iconData: Icons.audiotrack, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons auto awesome": const IconWrapper(
      iconData: Icons.auto_awesome, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons auto awesome mosaic": const IconWrapper(
      iconData: Icons.auto_awesome_mosaic,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons auto awesome motion": const IconWrapper(
      iconData: Icons.auto_awesome_motion,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons auto delete": const IconWrapper(
      iconData: Icons.auto_delete, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons auto fix high": const IconWrapper(
      iconData: Icons.auto_fix_high, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons auto fix normal": const IconWrapper(
      iconData: Icons.auto_fix_normal, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons auto fix off": const IconWrapper(
      iconData: Icons.auto_fix_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons auto graph": const IconWrapper(
      iconData: Icons.auto_graph, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons auto mode": const IconWrapper(
      iconData: Icons.auto_mode, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons auto stories": const IconWrapper(
      iconData: Icons.auto_stories, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons autofps select": const IconWrapper(
      iconData: Icons.autofps_select, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons autorenew": const IconWrapper(
      iconData: Icons.autorenew, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons av timer": const IconWrapper(
      iconData: Icons.av_timer, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons baby changing station": const IconWrapper(
      iconData: Icons.baby_changing_station,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons back hand": const IconWrapper(
      iconData: Icons.back_hand, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons backpack": const IconWrapper(
      iconData: Icons.backpack, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons backspace": const IconWrapper(
      iconData: Icons.backspace, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons backup": const IconWrapper(
      iconData: Icons.backup, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons backup table": const IconWrapper(
      iconData: Icons.backup_table, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons badge": const IconWrapper(
      iconData: Icons.badge, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons bakery dining": const IconWrapper(
      iconData: Icons.bakery_dining, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons balance": const IconWrapper(
      iconData: Icons.balance, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons balcony": const IconWrapper(
      iconData: Icons.balcony, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons ballot": const IconWrapper(
      iconData: Icons.ballot, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons bar chart": const IconWrapper(
      iconData: Icons.bar_chart, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons barcode reader": const IconWrapper(
      iconData: Icons.barcode_reader, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons batch prediction": const IconWrapper(
      iconData: Icons.batch_prediction,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons bathroom": const IconWrapper(
      iconData: Icons.bathroom, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons bathtub": const IconWrapper(
      iconData: Icons.bathtub, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons battery 0 bar": const IconWrapper(
      iconData: Icons.battery_0_bar, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons battery 1 bar": const IconWrapper(
      iconData: Icons.battery_1_bar, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons battery 2 bar": const IconWrapper(
      iconData: Icons.battery_2_bar, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons battery 3 bar": const IconWrapper(
      iconData: Icons.battery_3_bar, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons battery 4 bar": const IconWrapper(
      iconData: Icons.battery_4_bar, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons battery 5 bar": const IconWrapper(
      iconData: Icons.battery_5_bar, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons battery 6 bar": const IconWrapper(
      iconData: Icons.battery_6_bar, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons battery alert": const IconWrapper(
      iconData: Icons.battery_alert, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons battery charging full": const IconWrapper(
      iconData: Icons.battery_charging_full,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons battery full": const IconWrapper(
      iconData: Icons.battery_full, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons battery saver": const IconWrapper(
      iconData: Icons.battery_saver, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons battery std": const IconWrapper(
      iconData: Icons.battery_std, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons battery unknown": const IconWrapper(
      iconData: Icons.battery_unknown, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons beach access": const IconWrapper(
      iconData: Icons.beach_access, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons bed": const IconWrapper(
      iconData: Icons.bed, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons bedroom baby": const IconWrapper(
      iconData: Icons.bedroom_baby, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons bedroom child": const IconWrapper(
      iconData: Icons.bedroom_child, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons bedroom parent": const IconWrapper(
      iconData: Icons.bedroom_parent, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons bedtime": const IconWrapper(
      iconData: Icons.bedtime, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons bedtime off": const IconWrapper(
      iconData: Icons.bedtime_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons beenhere": const IconWrapper(
      iconData: Icons.beenhere, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons bento": const IconWrapper(
      iconData: Icons.bento, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons bike scooter": const IconWrapper(
      iconData: Icons.bike_scooter, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons biotech": const IconWrapper(
      iconData: Icons.biotech, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons blender": const IconWrapper(
      iconData: Icons.blender, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons blind": const IconWrapper(
      iconData: Icons.blind, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons blinds": const IconWrapper(
      iconData: Icons.blinds, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons blinds closed": const IconWrapper(
      iconData: Icons.blinds_closed, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons block": const IconWrapper(
      iconData: Icons.block, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons block flipped": const IconWrapper(
      iconData: Icons.block_flipped, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons bloodtype": const IconWrapper(
      iconData: Icons.bloodtype, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons bluetooth": const IconWrapper(
      iconData: Icons.bluetooth, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons bluetooth audio": const IconWrapper(
      iconData: Icons.bluetooth_audio, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons bluetooth connected": const IconWrapper(
      iconData: Icons.bluetooth_connected,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons bluetooth disabled": const IconWrapper(
      iconData: Icons.bluetooth_disabled,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons bluetooth drive": const IconWrapper(
      iconData: Icons.bluetooth_drive, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons bluetooth searching": const IconWrapper(
      iconData: Icons.bluetooth_searching,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons blur circular": const IconWrapper(
      iconData: Icons.blur_circular, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons blur linear": const IconWrapper(
      iconData: Icons.blur_linear, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons blur off": const IconWrapper(
      iconData: Icons.blur_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons blur on": const IconWrapper(
      iconData: Icons.blur_on, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons bolt": const IconWrapper(
      iconData: Icons.bolt, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons book": const IconWrapper(
      iconData: Icons.book, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons book online": const IconWrapper(
      iconData: Icons.book_online, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons bookmark": const IconWrapper(
      iconData: Icons.bookmark, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons bookmark add": const IconWrapper(
      iconData: Icons.bookmark_add, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons bookmark added": const IconWrapper(
      iconData: Icons.bookmark_added, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons bookmark border": const IconWrapper(
      iconData: Icons.bookmark_border, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons bookmark remove": const IconWrapper(
      iconData: Icons.bookmark_remove, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons bookmarks": const IconWrapper(
      iconData: Icons.bookmarks, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons border all": const IconWrapper(
      iconData: Icons.border_all, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons border bottom": const IconWrapper(
      iconData: Icons.border_bottom, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons border clear": const IconWrapper(
      iconData: Icons.border_clear, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons border color": const IconWrapper(
      iconData: Icons.border_color, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons border horizontal": const IconWrapper(
      iconData: Icons.border_horizontal,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons border inner": const IconWrapper(
      iconData: Icons.border_inner, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons border left": const IconWrapper(
      iconData: Icons.border_left, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons border outer": const IconWrapper(
      iconData: Icons.border_outer, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons border right": const IconWrapper(
      iconData: Icons.border_right, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons border style": const IconWrapper(
      iconData: Icons.border_style, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons border top": const IconWrapper(
      iconData: Icons.border_top, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons border vertical": const IconWrapper(
      iconData: Icons.border_vertical, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons boy": const IconWrapper(
      iconData: Icons.boy, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons branding watermark": const IconWrapper(
      iconData: Icons.branding_watermark,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons breakfast dining": const IconWrapper(
      iconData: Icons.breakfast_dining,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons brightness 1": const IconWrapper(
      iconData: Icons.brightness_1, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons brightness 2": const IconWrapper(
      iconData: Icons.brightness_2, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons brightness 3": const IconWrapper(
      iconData: Icons.brightness_3, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons brightness 4": const IconWrapper(
      iconData: Icons.brightness_4, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons brightness 5": const IconWrapper(
      iconData: Icons.brightness_5, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons brightness 6": const IconWrapper(
      iconData: Icons.brightness_6, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons brightness 7": const IconWrapper(
      iconData: Icons.brightness_7, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons brightness auto": const IconWrapper(
      iconData: Icons.brightness_auto, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons brightness high": const IconWrapper(
      iconData: Icons.brightness_high, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons brightness low": const IconWrapper(
      iconData: Icons.brightness_low, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons brightness medium": const IconWrapper(
      iconData: Icons.brightness_medium,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons broadcast on home": const IconWrapper(
      iconData: Icons.broadcast_on_home,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons broadcast on personal": const IconWrapper(
      iconData: Icons.broadcast_on_personal,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons broken image": const IconWrapper(
      iconData: Icons.broken_image, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons browse gallery": const IconWrapper(
      iconData: Icons.browse_gallery, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons browser not supported": const IconWrapper(
      iconData: Icons.browser_not_supported,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons browser updated": const IconWrapper(
      iconData: Icons.browser_updated, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons brunch dining": const IconWrapper(
      iconData: Icons.brunch_dining, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons brush": const IconWrapper(
      iconData: Icons.brush, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons bubble chart": const IconWrapper(
      iconData: Icons.bubble_chart, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons bug report": const IconWrapper(
      iconData: Icons.bug_report, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons build": const IconWrapper(
      iconData: Icons.build, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons build circle": const IconWrapper(
      iconData: Icons.build_circle, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons bungalow": const IconWrapper(
      iconData: Icons.bungalow, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons burst mode": const IconWrapper(
      iconData: Icons.burst_mode, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons bus alert": const IconWrapper(
      iconData: Icons.bus_alert, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons business": const IconWrapper(
      iconData: Icons.business, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons business center": const IconWrapper(
      iconData: Icons.business_center, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons cabin": const IconWrapper(
      iconData: Icons.cabin, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons cable": const IconWrapper(
      iconData: Icons.cable, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons cached": const IconWrapper(
      iconData: Icons.cached, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons cake": const IconWrapper(
      iconData: Icons.cake, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons calculate": const IconWrapper(
      iconData: Icons.calculate, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons calendar month": const IconWrapper(
      iconData: Icons.calendar_month, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons calendar today": const IconWrapper(
      iconData: Icons.calendar_today, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons calendar view day": const IconWrapper(
      iconData: Icons.calendar_view_day,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons calendar view month": const IconWrapper(
      iconData: Icons.calendar_view_month,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons calendar view week": const IconWrapper(
      iconData: Icons.calendar_view_week,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons call": const IconWrapper(
      iconData: Icons.call, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons call end": const IconWrapper(
      iconData: Icons.call_end, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons call made": const IconWrapper(
      iconData: Icons.call_made, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons call merge": const IconWrapper(
      iconData: Icons.call_merge, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons call missed": const IconWrapper(
      iconData: Icons.call_missed, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons call missed outgoing": const IconWrapper(
      iconData: Icons.call_missed_outgoing,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons call received": const IconWrapper(
      iconData: Icons.call_received, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons call split": const IconWrapper(
      iconData: Icons.call_split, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons call to action": const IconWrapper(
      iconData: Icons.call_to_action, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons camera": const IconWrapper(
      iconData: Icons.camera, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons camera alt": const IconWrapper(
      iconData: Icons.camera_alt, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons camera enhance": const IconWrapper(
      iconData: Icons.camera_enhance, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons camera front": const IconWrapper(
      iconData: Icons.camera_front, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons camera indoor": const IconWrapper(
      iconData: Icons.camera_indoor, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons camera outdoor": const IconWrapper(
      iconData: Icons.camera_outdoor, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons camera rear": const IconWrapper(
      iconData: Icons.camera_rear, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons camera roll": const IconWrapper(
      iconData: Icons.camera_roll, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons cameraswitch": const IconWrapper(
      iconData: Icons.cameraswitch, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons campaign": const IconWrapper(
      iconData: Icons.campaign, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons cancel": const IconWrapper(
      iconData: Icons.cancel, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons cancel presentation": const IconWrapper(
      iconData: Icons.cancel_presentation,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons cancel schedule send": const IconWrapper(
      iconData: Icons.cancel_schedule_send,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons candlestick chart": const IconWrapper(
      iconData: Icons.candlestick_chart,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons car crash": const IconWrapper(
      iconData: Icons.car_crash, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons car rental": const IconWrapper(
      iconData: Icons.car_rental, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons car repair": const IconWrapper(
      iconData: Icons.car_repair, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons card giftcard": const IconWrapper(
      iconData: Icons.card_giftcard, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons card membership": const IconWrapper(
      iconData: Icons.card_membership, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons card travel": const IconWrapper(
      iconData: Icons.card_travel, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons carpenter": const IconWrapper(
      iconData: Icons.carpenter, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons cases": const IconWrapper(
      iconData: Icons.cases, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons casino": const IconWrapper(
      iconData: Icons.casino, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons cast": const IconWrapper(
      iconData: Icons.cast, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons cast connected": const IconWrapper(
      iconData: Icons.cast_connected, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons cast for education": const IconWrapper(
      iconData: Icons.cast_for_education,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons castle": const IconWrapper(
      iconData: Icons.castle, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons catching pokemon": const IconWrapper(
      iconData: Icons.catching_pokemon,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons category": const IconWrapper(
      iconData: Icons.category, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons celebration": const IconWrapper(
      iconData: Icons.celebration, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons cell tower": const IconWrapper(
      iconData: Icons.cell_tower, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons cell wifi": const IconWrapper(
      iconData: Icons.cell_wifi, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons center focus strong": const IconWrapper(
      iconData: Icons.center_focus_strong,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons center focus weak": const IconWrapper(
      iconData: Icons.center_focus_weak,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons chair": const IconWrapper(
      iconData: Icons.chair, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons chair alt": const IconWrapper(
      iconData: Icons.chair_alt, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons chalet": const IconWrapper(
      iconData: Icons.chalet, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons change circle": const IconWrapper(
      iconData: Icons.change_circle, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons change history": const IconWrapper(
      iconData: Icons.change_history, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons charging station": const IconWrapper(
      iconData: Icons.charging_station,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons chat": const IconWrapper(
      iconData: Icons.chat, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons chat bubble": const IconWrapper(
      iconData: Icons.chat_bubble, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons check": const IconWrapper(
      iconData: Icons.check, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons check box": const IconWrapper(
      iconData: Icons.check_box, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons check circle": const IconWrapper(
      iconData: Icons.check_circle, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons checklist": const IconWrapper(
      iconData: Icons.checklist, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons checklist rtl": const IconWrapper(
      iconData: Icons.checklist_rtl, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons checkroom": const IconWrapper(
      iconData: Icons.checkroom, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons child care": const IconWrapper(
      iconData: Icons.child_care, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons child friendly": const IconWrapper(
      iconData: Icons.child_friendly, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons chrome reader mode": const IconWrapper(
      iconData: Icons.chrome_reader_mode,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons church": const IconWrapper(
      iconData: Icons.church, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons circle": const IconWrapper(
      iconData: Icons.circle, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons circle notifications": const IconWrapper(
      iconData: Icons.circle_notifications,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons class ": const IconWrapper(
      iconData: Icons.class_, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons clean hands": const IconWrapper(
      iconData: Icons.clean_hands, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons cleaning services": const IconWrapper(
      iconData: Icons.cleaning_services,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons clear": const IconWrapper(
      iconData: Icons.clear, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons clear all": const IconWrapper(
      iconData: Icons.clear_all, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons close": const IconWrapper(
      iconData: Icons.close, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons close fullscreen": const IconWrapper(
      iconData: Icons.close_fullscreen,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons closed caption": const IconWrapper(
      iconData: Icons.closed_caption, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons closed caption disabled": const IconWrapper(
      iconData: Icons.closed_caption_disabled,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons closed caption off": const IconWrapper(
      iconData: Icons.closed_caption_off,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons cloud": const IconWrapper(
      iconData: Icons.cloud, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons cloud circle": const IconWrapper(
      iconData: Icons.cloud_circle, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons cloud done": const IconWrapper(
      iconData: Icons.cloud_done, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons cloud download": const IconWrapper(
      iconData: Icons.cloud_download, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons cloud off": const IconWrapper(
      iconData: Icons.cloud_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons cloud queue": const IconWrapper(
      iconData: Icons.cloud_queue, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons cloud sync": const IconWrapper(
      iconData: Icons.cloud_sync, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons cloud upload": const IconWrapper(
      iconData: Icons.cloud_upload, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons cloudy snowing": const IconWrapper(
      iconData: Icons.cloudy_snowing, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons co2": const IconWrapper(
      iconData: Icons.co2, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons co present": const IconWrapper(
      iconData: Icons.co_present, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons code": const IconWrapper(
      iconData: Icons.code, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons code off": const IconWrapper(
      iconData: Icons.code_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons coffee": const IconWrapper(
      iconData: Icons.coffee, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons coffee maker": const IconWrapper(
      iconData: Icons.coffee_maker, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons collections": const IconWrapper(
      iconData: Icons.collections, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons collections bookmark": const IconWrapper(
      iconData: Icons.collections_bookmark,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons color lens": const IconWrapper(
      iconData: Icons.color_lens, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons colorize": const IconWrapper(
      iconData: Icons.colorize, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons comment": const IconWrapper(
      iconData: Icons.comment, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons comment bank": const IconWrapper(
      iconData: Icons.comment_bank, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons comments disabled": const IconWrapper(
      iconData: Icons.comments_disabled,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons commit": const IconWrapper(
      iconData: Icons.commit, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons commute": const IconWrapper(
      iconData: Icons.commute, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons compare": const IconWrapper(
      iconData: Icons.compare, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons compare arrows": const IconWrapper(
      iconData: Icons.compare_arrows, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons compass calibration": const IconWrapper(
      iconData: Icons.compass_calibration,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons compost": const IconWrapper(
      iconData: Icons.compost, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons compress": const IconWrapper(
      iconData: Icons.compress, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons computer": const IconWrapper(
      iconData: Icons.computer, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons confirmation num": const IconWrapper(
      iconData: Icons.confirmation_num,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons confirmation number": const IconWrapper(
      iconData: Icons.confirmation_number,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons connect without contact": const IconWrapper(
      iconData: Icons.connect_without_contact,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons connected tv": const IconWrapper(
      iconData: Icons.connected_tv, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons connecting airports": const IconWrapper(
      iconData: Icons.connecting_airports,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons construction": const IconWrapper(
      iconData: Icons.construction, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons contact emergency": const IconWrapper(
      iconData: Icons.contact_emergency,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons contact mail": const IconWrapper(
      iconData: Icons.contact_mail, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons contact page": const IconWrapper(
      iconData: Icons.contact_page, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons contact phone": const IconWrapper(
      iconData: Icons.contact_phone, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons contact support": const IconWrapper(
      iconData: Icons.contact_support, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons contactless": const IconWrapper(
      iconData: Icons.contactless, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons contacts": const IconWrapper(
      iconData: Icons.contacts, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons content copy": const IconWrapper(
      iconData: Icons.content_copy, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons content cut": const IconWrapper(
      iconData: Icons.content_cut, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons content paste": const IconWrapper(
      iconData: Icons.content_paste, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons content paste go": const IconWrapper(
      iconData: Icons.content_paste_go,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons content paste off": const IconWrapper(
      iconData: Icons.content_paste_off,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons content paste search": const IconWrapper(
      iconData: Icons.content_paste_search,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons contrast": const IconWrapper(
      iconData: Icons.contrast, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons control camera": const IconWrapper(
      iconData: Icons.control_camera, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons control point": const IconWrapper(
      iconData: Icons.control_point, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons control point duplicate": const IconWrapper(
      iconData: Icons.control_point_duplicate,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons conveyor belt": const IconWrapper(
      iconData: Icons.conveyor_belt, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons cookie": const IconWrapper(
      iconData: Icons.cookie, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons copy": const IconWrapper(
      iconData: Icons.copy, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons copy all": const IconWrapper(
      iconData: Icons.copy_all, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons copyright": const IconWrapper(
      iconData: Icons.copyright, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons coronavirus": const IconWrapper(
      iconData: Icons.coronavirus, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons corporate fare": const IconWrapper(
      iconData: Icons.corporate_fare, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons cottage": const IconWrapper(
      iconData: Icons.cottage, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons countertops": const IconWrapper(
      iconData: Icons.countertops, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons create": const IconWrapper(
      iconData: Icons.create, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons create new folder": const IconWrapper(
      iconData: Icons.create_new_folder,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons credit card": const IconWrapper(
      iconData: Icons.credit_card, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons credit card off": const IconWrapper(
      iconData: Icons.credit_card_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons credit score": const IconWrapper(
      iconData: Icons.credit_score, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons crib": const IconWrapper(
      iconData: Icons.crib, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons crisis alert": const IconWrapper(
      iconData: Icons.crisis_alert, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons crop": const IconWrapper(
      iconData: Icons.crop, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons crop 3 2": const IconWrapper(
      iconData: Icons.crop_3_2, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons crop 5 4": const IconWrapper(
      iconData: Icons.crop_5_4, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons crop 7 5": const IconWrapper(
      iconData: Icons.crop_7_5, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons crop 16 9": const IconWrapper(
      iconData: Icons.crop_16_9, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons crop din": const IconWrapper(
      iconData: Icons.crop_din, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons crop free": const IconWrapper(
      iconData: Icons.crop_free, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons crop landscape": const IconWrapper(
      iconData: Icons.crop_landscape, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons crop original": const IconWrapper(
      iconData: Icons.crop_original, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons crop portrait": const IconWrapper(
      iconData: Icons.crop_portrait, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons crop rotate": const IconWrapper(
      iconData: Icons.crop_rotate, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons crop square": const IconWrapper(
      iconData: Icons.crop_square, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons cruelty free": const IconWrapper(
      iconData: Icons.cruelty_free, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons css": const IconWrapper(
      iconData: Icons.css, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons currency bitcoin": const IconWrapper(
      iconData: Icons.currency_bitcoin,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons currency exchange": const IconWrapper(
      iconData: Icons.currency_exchange,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons currency franc": const IconWrapper(
      iconData: Icons.currency_franc, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons currency lira": const IconWrapper(
      iconData: Icons.currency_lira, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons currency pound": const IconWrapper(
      iconData: Icons.currency_pound, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons currency ruble": const IconWrapper(
      iconData: Icons.currency_ruble, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons currency rupee": const IconWrapper(
      iconData: Icons.currency_rupee, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons currency yen": const IconWrapper(
      iconData: Icons.currency_yen, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons currency yuan": const IconWrapper(
      iconData: Icons.currency_yuan, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons curtains": const IconWrapper(
      iconData: Icons.curtains, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons curtains closed": const IconWrapper(
      iconData: Icons.curtains_closed, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons cut": const IconWrapper(
      iconData: Icons.cut, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons cyclone": const IconWrapper(
      iconData: Icons.cyclone, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons dangerous": const IconWrapper(
      iconData: Icons.dangerous, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons dark mode": const IconWrapper(
      iconData: Icons.dark_mode, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons dashboard": const IconWrapper(
      iconData: Icons.dashboard, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons dashboard customize": const IconWrapper(
      iconData: Icons.dashboard_customize,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons data array": const IconWrapper(
      iconData: Icons.data_array, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons data exploration": const IconWrapper(
      iconData: Icons.data_exploration,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons data object": const IconWrapper(
      iconData: Icons.data_object, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons data saver off": const IconWrapper(
      iconData: Icons.data_saver_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons data saver on": const IconWrapper(
      iconData: Icons.data_saver_on, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons data thresholding": const IconWrapper(
      iconData: Icons.data_thresholding,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons data usage": const IconWrapper(
      iconData: Icons.data_usage, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons dataset": const IconWrapper(
      iconData: Icons.dataset, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons dataset linked": const IconWrapper(
      iconData: Icons.dataset_linked, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons date range": const IconWrapper(
      iconData: Icons.date_range, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons deblur": const IconWrapper(
      iconData: Icons.deblur, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons deck": const IconWrapper(
      iconData: Icons.deck, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons dehaze": const IconWrapper(
      iconData: Icons.dehaze, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons delete": const IconWrapper(
      iconData: Icons.delete, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons delete forever": const IconWrapper(
      iconData: Icons.delete_forever, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons delete sweep": const IconWrapper(
      iconData: Icons.delete_sweep, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons delivery dining": const IconWrapper(
      iconData: Icons.delivery_dining, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons density large": const IconWrapper(
      iconData: Icons.density_large, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons density medium": const IconWrapper(
      iconData: Icons.density_medium, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons density small": const IconWrapper(
      iconData: Icons.density_small, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons departure board": const IconWrapper(
      iconData: Icons.departure_board, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons description": const IconWrapper(
      iconData: Icons.description, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons deselect": const IconWrapper(
      iconData: Icons.deselect, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons design services": const IconWrapper(
      iconData: Icons.design_services, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons desk": const IconWrapper(
      iconData: Icons.desk, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons desktop access disabled": const IconWrapper(
      iconData: Icons.desktop_access_disabled,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons desktop mac": const IconWrapper(
      iconData: Icons.desktop_mac, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons desktop windows": const IconWrapper(
      iconData: Icons.desktop_windows, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons details": const IconWrapper(
      iconData: Icons.details, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons developer board": const IconWrapper(
      iconData: Icons.developer_board, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons developer board off": const IconWrapper(
      iconData: Icons.developer_board_off,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons developer mode": const IconWrapper(
      iconData: Icons.developer_mode, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons device hub": const IconWrapper(
      iconData: Icons.device_hub, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons device thermostat": const IconWrapper(
      iconData: Icons.device_thermostat,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons device unknown": const IconWrapper(
      iconData: Icons.device_unknown, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons devices": const IconWrapper(
      iconData: Icons.devices, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons devices fold": const IconWrapper(
      iconData: Icons.devices_fold, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons devices other": const IconWrapper(
      iconData: Icons.devices_other, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons dew point": const IconWrapper(
      iconData: Icons.dew_point, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons dialer sip": const IconWrapper(
      iconData: Icons.dialer_sip, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons dialpad": const IconWrapper(
      iconData: Icons.dialpad, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons diamond": const IconWrapper(
      iconData: Icons.diamond, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons difference": const IconWrapper(
      iconData: Icons.difference, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons dining": const IconWrapper(
      iconData: Icons.dining, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons dinner dining": const IconWrapper(
      iconData: Icons.dinner_dining, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons directions": const IconWrapper(
      iconData: Icons.directions, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons directions bike": const IconWrapper(
      iconData: Icons.directions_bike, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons directions boat": const IconWrapper(
      iconData: Icons.directions_boat, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons directions bus": const IconWrapper(
      iconData: Icons.directions_bus, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons directions car": const IconWrapper(
      iconData: Icons.directions_car, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons directions ferry": const IconWrapper(
      iconData: Icons.directions_ferry,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons directions off": const IconWrapper(
      iconData: Icons.directions_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons directions railway": const IconWrapper(
      iconData: Icons.directions_railway,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons directions run": const IconWrapper(
      iconData: Icons.directions_run, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons directions subway": const IconWrapper(
      iconData: Icons.directions_subway,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons directions train": const IconWrapper(
      iconData: Icons.directions_train,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons directions transit": const IconWrapper(
      iconData: Icons.directions_transit,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons directions walk": const IconWrapper(
      iconData: Icons.directions_walk, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons dirty lens": const IconWrapper(
      iconData: Icons.dirty_lens, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons disabled by default": const IconWrapper(
      iconData: Icons.disabled_by_default,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons disabled visible": const IconWrapper(
      iconData: Icons.disabled_visible,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons disc full": const IconWrapper(
      iconData: Icons.disc_full, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons discord": const IconWrapper(
      iconData: Icons.discord, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons discount": const IconWrapper(
      iconData: Icons.discount, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons display settings": const IconWrapper(
      iconData: Icons.display_settings,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons diversity 1": const IconWrapper(
      iconData: Icons.diversity_1, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons diversity 2": const IconWrapper(
      iconData: Icons.diversity_2, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons diversity 3": const IconWrapper(
      iconData: Icons.diversity_3, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons dnd forwardslash": const IconWrapper(
      iconData: Icons.dnd_forwardslash,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons dns": const IconWrapper(
      iconData: Icons.dns, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons do disturb": const IconWrapper(
      iconData: Icons.do_disturb, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons do disturb alt": const IconWrapper(
      iconData: Icons.do_disturb_alt, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons do disturb off": const IconWrapper(
      iconData: Icons.do_disturb_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons do disturb on": const IconWrapper(
      iconData: Icons.do_disturb_on, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons do not disturb": const IconWrapper(
      iconData: Icons.do_not_disturb, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons do not disturb alt": const IconWrapper(
      iconData: Icons.do_not_disturb_alt,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons do not disturb off": const IconWrapper(
      iconData: Icons.do_not_disturb_off,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons do not disturb on": const IconWrapper(
      iconData: Icons.do_not_disturb_on,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons do not disturb on total silence": const IconWrapper(
      iconData: Icons.do_not_disturb_on_total_silence,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons do not step": const IconWrapper(
      iconData: Icons.do_not_step, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons do not touch": const IconWrapper(
      iconData: Icons.do_not_touch, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons dock": const IconWrapper(
      iconData: Icons.dock, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons document scanner": const IconWrapper(
      iconData: Icons.document_scanner,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons domain": const IconWrapper(
      iconData: Icons.domain, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons domain add": const IconWrapper(
      iconData: Icons.domain_add, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons domain disabled": const IconWrapper(
      iconData: Icons.domain_disabled, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons domain verification": const IconWrapper(
      iconData: Icons.domain_verification,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons done": const IconWrapper(
      iconData: Icons.done, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons done all": const IconWrapper(
      iconData: Icons.done_all, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons donut large": const IconWrapper(
      iconData: Icons.donut_large, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons donut small": const IconWrapper(
      iconData: Icons.donut_small, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons door back door": const IconWrapper(
      iconData: Icons.door_back_door, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons door front door": const IconWrapper(
      iconData: Icons.door_front_door, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons door sliding": const IconWrapper(
      iconData: Icons.door_sliding, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons doorbell": const IconWrapper(
      iconData: Icons.doorbell, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons double arrow": const IconWrapper(
      iconData: Icons.double_arrow, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons downhill skiing": const IconWrapper(
      iconData: Icons.downhill_skiing, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons download": const IconWrapper(
      iconData: Icons.download, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons download done": const IconWrapper(
      iconData: Icons.download_done, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons download for offline": const IconWrapper(
      iconData: Icons.download_for_offline,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons downloading": const IconWrapper(
      iconData: Icons.downloading, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons drafts": const IconWrapper(
      iconData: Icons.drafts, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons drag handle": const IconWrapper(
      iconData: Icons.drag_handle, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons drag indicator": const IconWrapper(
      iconData: Icons.drag_indicator, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons draw": const IconWrapper(
      iconData: Icons.draw, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons drive eta": const IconWrapper(
      iconData: Icons.drive_eta, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons drive file move": const IconWrapper(
      iconData: Icons.drive_file_move, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons drive file move rtl": const IconWrapper(
      iconData: Icons.drive_file_move_rtl,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons drive folder upload": const IconWrapper(
      iconData: Icons.drive_folder_upload,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons dry": const IconWrapper(
      iconData: Icons.dry, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons dry cleaning": const IconWrapper(
      iconData: Icons.dry_cleaning, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons duo": const IconWrapper(
      iconData: Icons.duo, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons dvr": const IconWrapper(
      iconData: Icons.dvr, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons dynamic feed": const IconWrapper(
      iconData: Icons.dynamic_feed, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons dynamic form": const IconWrapper(
      iconData: Icons.dynamic_form, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons e mobiledata": const IconWrapper(
      iconData: Icons.e_mobiledata, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons earbuds": const IconWrapper(
      iconData: Icons.earbuds, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons earbuds battery": const IconWrapper(
      iconData: Icons.earbuds_battery, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons east": const IconWrapper(
      iconData: Icons.east, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons eco": const IconWrapper(
      iconData: Icons.eco, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons edgesensor high": const IconWrapper(
      iconData: Icons.edgesensor_high, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons edgesensor low": const IconWrapper(
      iconData: Icons.edgesensor_low, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons edit": const IconWrapper(
      iconData: Icons.edit, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons edit attributes": const IconWrapper(
      iconData: Icons.edit_attributes, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons edit calendar": const IconWrapper(
      iconData: Icons.edit_calendar, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons edit document": const IconWrapper(
      iconData: Icons.edit_document, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons edit location": const IconWrapper(
      iconData: Icons.edit_location, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons edit location alt": const IconWrapper(
      iconData: Icons.edit_location_alt,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons edit note": const IconWrapper(
      iconData: Icons.edit_note, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons edit notifications": const IconWrapper(
      iconData: Icons.edit_notifications,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons edit off": const IconWrapper(
      iconData: Icons.edit_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons edit road": const IconWrapper(
      iconData: Icons.edit_road, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons edit square": const IconWrapper(
      iconData: Icons.edit_square, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons egg": const IconWrapper(
      iconData: Icons.egg, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons egg alt": const IconWrapper(
      iconData: Icons.egg_alt, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons eight k": const IconWrapper(
      iconData: Icons.eight_k, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons eight k plus": const IconWrapper(
      iconData: Icons.eight_k_plus, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons eight mp": const IconWrapper(
      iconData: Icons.eight_mp, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons eighteen mp": const IconWrapper(
      iconData: Icons.eighteen_mp, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons eighteen up rating": const IconWrapper(
      iconData: Icons.eighteen_up_rating,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons eject": const IconWrapper(
      iconData: Icons.eject, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons elderly": const IconWrapper(
      iconData: Icons.elderly, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons elderly woman": const IconWrapper(
      iconData: Icons.elderly_woman, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons electric bike": const IconWrapper(
      iconData: Icons.electric_bike, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons electric bolt": const IconWrapper(
      iconData: Icons.electric_bolt, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons electric car": const IconWrapper(
      iconData: Icons.electric_car, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons electric meter": const IconWrapper(
      iconData: Icons.electric_meter, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons electric moped": const IconWrapper(
      iconData: Icons.electric_moped, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons electric rickshaw": const IconWrapper(
      iconData: Icons.electric_rickshaw,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons electric scooter": const IconWrapper(
      iconData: Icons.electric_scooter,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons electrical services": const IconWrapper(
      iconData: Icons.electrical_services,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons elevator": const IconWrapper(
      iconData: Icons.elevator, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons eleven mp": const IconWrapper(
      iconData: Icons.eleven_mp, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons email": const IconWrapper(
      iconData: Icons.email, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons emergency": const IconWrapper(
      iconData: Icons.emergency, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons emergency recording": const IconWrapper(
      iconData: Icons.emergency_recording,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons emergency share": const IconWrapper(
      iconData: Icons.emergency_share, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons emoji emotions": const IconWrapper(
      iconData: Icons.emoji_emotions, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons emoji events": const IconWrapper(
      iconData: Icons.emoji_events, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons emoji flags": const IconWrapper(
      iconData: Icons.emoji_flags, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons emoji food beverage": const IconWrapper(
      iconData: Icons.emoji_food_beverage,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons emoji nature": const IconWrapper(
      iconData: Icons.emoji_nature, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons emoji objects": const IconWrapper(
      iconData: Icons.emoji_objects, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons emoji people": const IconWrapper(
      iconData: Icons.emoji_people, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons emoji symbols": const IconWrapper(
      iconData: Icons.emoji_symbols, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons emoji transportation": const IconWrapper(
      iconData: Icons.emoji_transportation,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons energy savings leaf": const IconWrapper(
      iconData: Icons.energy_savings_leaf,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons engineering": const IconWrapper(
      iconData: Icons.engineering, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons enhance photo translate": const IconWrapper(
      iconData: Icons.enhance_photo_translate,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons enhanced encryption": const IconWrapper(
      iconData: Icons.enhanced_encryption,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons equalizer": const IconWrapper(
      iconData: Icons.equalizer, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons error": const IconWrapper(
      iconData: Icons.error, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons escalator": const IconWrapper(
      iconData: Icons.escalator, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons escalator warning": const IconWrapper(
      iconData: Icons.escalator_warning,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons euro": const IconWrapper(
      iconData: Icons.euro, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons euro symbol": const IconWrapper(
      iconData: Icons.euro_symbol, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons ev station": const IconWrapper(
      iconData: Icons.ev_station, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons event": const IconWrapper(
      iconData: Icons.event, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons event available": const IconWrapper(
      iconData: Icons.event_available, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons event busy": const IconWrapper(
      iconData: Icons.event_busy, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons event note": const IconWrapper(
      iconData: Icons.event_note, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons event repeat": const IconWrapper(
      iconData: Icons.event_repeat, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons event seat": const IconWrapper(
      iconData: Icons.event_seat, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons exit to app": const IconWrapper(
      iconData: Icons.exit_to_app, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons expand": const IconWrapper(
      iconData: Icons.expand, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons expand circle down": const IconWrapper(
      iconData: Icons.expand_circle_down,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons expand less": const IconWrapper(
      iconData: Icons.expand_less, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons expand more": const IconWrapper(
      iconData: Icons.expand_more, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons explicit": const IconWrapper(
      iconData: Icons.explicit, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons explore": const IconWrapper(
      iconData: Icons.explore, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons explore off": const IconWrapper(
      iconData: Icons.explore_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons exposure": const IconWrapper(
      iconData: Icons.exposure, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons exposure minus 1": const IconWrapper(
      iconData: Icons.exposure_minus_1,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons exposure minus 2": const IconWrapper(
      iconData: Icons.exposure_minus_2,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons exposure neg 1": const IconWrapper(
      iconData: Icons.exposure_neg_1, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons exposure neg 2": const IconWrapper(
      iconData: Icons.exposure_neg_2, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons exposure plus 1": const IconWrapper(
      iconData: Icons.exposure_plus_1, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons exposure plus 2": const IconWrapper(
      iconData: Icons.exposure_plus_2, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons exposure zero": const IconWrapper(
      iconData: Icons.exposure_zero, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons extension": const IconWrapper(
      iconData: Icons.extension, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons extension off": const IconWrapper(
      iconData: Icons.extension_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons face": const IconWrapper(
      iconData: Icons.face, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons face 2": const IconWrapper(
      iconData: Icons.face_2, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons face 3": const IconWrapper(
      iconData: Icons.face_3, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons face 4": const IconWrapper(
      iconData: Icons.face_4, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons face 5": const IconWrapper(
      iconData: Icons.face_5, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons face 6": const IconWrapper(
      iconData: Icons.face_6, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons face retouching natural": const IconWrapper(
      iconData: Icons.face_retouching_natural,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons face retouching off": const IconWrapper(
      iconData: Icons.face_retouching_off,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons facebook": const IconWrapper(
      iconData: Icons.facebook, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons fact check": const IconWrapper(
      iconData: Icons.fact_check, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons factory": const IconWrapper(
      iconData: Icons.factory, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons family restroom": const IconWrapper(
      iconData: Icons.family_restroom, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons fast forward": const IconWrapper(
      iconData: Icons.fast_forward, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons fast rewind": const IconWrapper(
      iconData: Icons.fast_rewind, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons fastfood": const IconWrapper(
      iconData: Icons.fastfood, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons favorite": const IconWrapper(
      iconData: Icons.favorite, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons favorite border": const IconWrapper(
      iconData: Icons.favorite_border, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons fax": const IconWrapper(
      iconData: Icons.fax, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons featured play list": const IconWrapper(
      iconData: Icons.featured_play_list,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons featured video": const IconWrapper(
      iconData: Icons.featured_video, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons feed": const IconWrapper(
      iconData: Icons.feed, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons feedback": const IconWrapper(
      iconData: Icons.feedback, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons female": const IconWrapper(
      iconData: Icons.female, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons fence": const IconWrapper(
      iconData: Icons.fence, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons festival": const IconWrapper(
      iconData: Icons.festival, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons fiber dvr": const IconWrapper(
      iconData: Icons.fiber_dvr, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons fiber manual record": const IconWrapper(
      iconData: Icons.fiber_manual_record,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons fiber new": const IconWrapper(
      iconData: Icons.fiber_new, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons fiber pin": const IconWrapper(
      iconData: Icons.fiber_pin, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons fiber smart record": const IconWrapper(
      iconData: Icons.fiber_smart_record,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons fifteen mp": const IconWrapper(
      iconData: Icons.fifteen_mp, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons file copy": const IconWrapper(
      iconData: Icons.file_copy, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons file download": const IconWrapper(
      iconData: Icons.file_download, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons file download done": const IconWrapper(
      iconData: Icons.file_download_done,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons file download off": const IconWrapper(
      iconData: Icons.file_download_off,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons file open": const IconWrapper(
      iconData: Icons.file_open, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons file present": const IconWrapper(
      iconData: Icons.file_present, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons file upload": const IconWrapper(
      iconData: Icons.file_upload, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons file upload off": const IconWrapper(
      iconData: Icons.file_upload_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons filter": const IconWrapper(
      iconData: Icons.filter, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons filter 1": const IconWrapper(
      iconData: Icons.filter_1, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons filter 2": const IconWrapper(
      iconData: Icons.filter_2, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons filter 3": const IconWrapper(
      iconData: Icons.filter_3, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons filter 4": const IconWrapper(
      iconData: Icons.filter_4, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons filter 5": const IconWrapper(
      iconData: Icons.filter_5, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons filter 6": const IconWrapper(
      iconData: Icons.filter_6, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons filter 7": const IconWrapper(
      iconData: Icons.filter_7, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons filter 8": const IconWrapper(
      iconData: Icons.filter_8, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons filter 9": const IconWrapper(
      iconData: Icons.filter_9, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons filter 9 plus": const IconWrapper(
      iconData: Icons.filter_9_plus, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons filter alt": const IconWrapper(
      iconData: Icons.filter_alt, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons filter alt off": const IconWrapper(
      iconData: Icons.filter_alt_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons filter b and w": const IconWrapper(
      iconData: Icons.filter_b_and_w, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons filter center focus": const IconWrapper(
      iconData: Icons.filter_center_focus,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons filter drama": const IconWrapper(
      iconData: Icons.filter_drama, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons filter frames": const IconWrapper(
      iconData: Icons.filter_frames, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons filter hdr": const IconWrapper(
      iconData: Icons.filter_hdr, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons filter list": const IconWrapper(
      iconData: Icons.filter_list, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons filter list alt": const IconWrapper(
      iconData: Icons.filter_list_alt, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons filter list off": const IconWrapper(
      iconData: Icons.filter_list_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons filter none": const IconWrapper(
      iconData: Icons.filter_none, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons filter tilt shift": const IconWrapper(
      iconData: Icons.filter_tilt_shift,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons filter vintage": const IconWrapper(
      iconData: Icons.filter_vintage, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons find in page": const IconWrapper(
      iconData: Icons.find_in_page, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons find replace": const IconWrapper(
      iconData: Icons.find_replace, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons fingerprint": const IconWrapper(
      iconData: Icons.fingerprint, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons fire extinguisher": const IconWrapper(
      iconData: Icons.fire_extinguisher,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons fire hydrant": const IconWrapper(
      iconData: Icons.fire_hydrant, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons fire hydrant alt": const IconWrapper(
      iconData: Icons.fire_hydrant_alt,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons fire truck": const IconWrapper(
      iconData: Icons.fire_truck, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons fireplace": const IconWrapper(
      iconData: Icons.fireplace, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons first page": const IconWrapper(
      iconData: Icons.first_page, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons fit screen": const IconWrapper(
      iconData: Icons.fit_screen, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons fitbit": const IconWrapper(
      iconData: Icons.fitbit, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons fitness center": const IconWrapper(
      iconData: Icons.fitness_center, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons five g": const IconWrapper(
      iconData: Icons.five_g, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons five k": const IconWrapper(
      iconData: Icons.five_k, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons five k plus": const IconWrapper(
      iconData: Icons.five_k_plus, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons five mp": const IconWrapper(
      iconData: Icons.five_mp, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons flag": const IconWrapper(
      iconData: Icons.flag, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons flag circle": const IconWrapper(
      iconData: Icons.flag_circle, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons flaky": const IconWrapper(
      iconData: Icons.flaky, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons flare": const IconWrapper(
      iconData: Icons.flare, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons flash auto": const IconWrapper(
      iconData: Icons.flash_auto, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons flash off": const IconWrapper(
      iconData: Icons.flash_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons flash on": const IconWrapper(
      iconData: Icons.flash_on, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons flashlight off": const IconWrapper(
      iconData: Icons.flashlight_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons flashlight on": const IconWrapper(
      iconData: Icons.flashlight_on, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons flatware": const IconWrapper(
      iconData: Icons.flatware, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons flight": const IconWrapper(
      iconData: Icons.flight, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons flight class": const IconWrapper(
      iconData: Icons.flight_class, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons flight land": const IconWrapper(
      iconData: Icons.flight_land, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons flight takeoff": const IconWrapper(
      iconData: Icons.flight_takeoff, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons flip": const IconWrapper(
      iconData: Icons.flip, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons flip camera android": const IconWrapper(
      iconData: Icons.flip_camera_android,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons flip camera ios": const IconWrapper(
      iconData: Icons.flip_camera_ios, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons flip to back": const IconWrapper(
      iconData: Icons.flip_to_back, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons flip to front": const IconWrapper(
      iconData: Icons.flip_to_front, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons flood": const IconWrapper(
      iconData: Icons.flood, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons flourescent": const IconWrapper(
      iconData: Icons.flourescent, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons fluorescent": const IconWrapper(
      iconData: Icons.fluorescent, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons flutter dash": const IconWrapper(
      iconData: Icons.flutter_dash, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons fmd bad": const IconWrapper(
      iconData: Icons.fmd_bad, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons fmd good": const IconWrapper(
      iconData: Icons.fmd_good, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons foggy": const IconWrapper(
      iconData: Icons.foggy, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons folder": const IconWrapper(
      iconData: Icons.folder, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons folder copy": const IconWrapper(
      iconData: Icons.folder_copy, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons folder delete": const IconWrapper(
      iconData: Icons.folder_delete, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons folder off": const IconWrapper(
      iconData: Icons.folder_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons folder open": const IconWrapper(
      iconData: Icons.folder_open, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons folder shared": const IconWrapper(
      iconData: Icons.folder_shared, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons folder special": const IconWrapper(
      iconData: Icons.folder_special, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons folder zip": const IconWrapper(
      iconData: Icons.folder_zip, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons follow the signs": const IconWrapper(
      iconData: Icons.follow_the_signs,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons font download": const IconWrapper(
      iconData: Icons.font_download, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons font download off": const IconWrapper(
      iconData: Icons.font_download_off,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons food bank": const IconWrapper(
      iconData: Icons.food_bank, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons forest": const IconWrapper(
      iconData: Icons.forest, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons fork left": const IconWrapper(
      iconData: Icons.fork_left, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons fork right": const IconWrapper(
      iconData: Icons.fork_right, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons forklift": const IconWrapper(
      iconData: Icons.forklift, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons format align center": const IconWrapper(
      iconData: Icons.format_align_center,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons format align justify": const IconWrapper(
      iconData: Icons.format_align_justify,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons format align left": const IconWrapper(
      iconData: Icons.format_align_left,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons format align right": const IconWrapper(
      iconData: Icons.format_align_right,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons format bold": const IconWrapper(
      iconData: Icons.format_bold, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons format clear": const IconWrapper(
      iconData: Icons.format_clear, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons format color fill": const IconWrapper(
      iconData: Icons.format_color_fill,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons format color reset": const IconWrapper(
      iconData: Icons.format_color_reset,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons format color text": const IconWrapper(
      iconData: Icons.format_color_text,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons format indent decrease": const IconWrapper(
      iconData: Icons.format_indent_decrease,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons format indent increase": const IconWrapper(
      iconData: Icons.format_indent_increase,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons format italic": const IconWrapper(
      iconData: Icons.format_italic, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons format line spacing": const IconWrapper(
      iconData: Icons.format_line_spacing,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons format list bulleted": const IconWrapper(
      iconData: Icons.format_list_bulleted,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons format list bulleted add": const IconWrapper(
      iconData: Icons.format_list_bulleted_add,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons format list numbered": const IconWrapper(
      iconData: Icons.format_list_numbered,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons format list numbered rtl": const IconWrapper(
      iconData: Icons.format_list_numbered_rtl,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons format overline": const IconWrapper(
      iconData: Icons.format_overline, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons format paint": const IconWrapper(
      iconData: Icons.format_paint, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons format quote": const IconWrapper(
      iconData: Icons.format_quote, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons format shapes": const IconWrapper(
      iconData: Icons.format_shapes, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons format size": const IconWrapper(
      iconData: Icons.format_size, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons format strikethrough": const IconWrapper(
      iconData: Icons.format_strikethrough,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons format textdirection l to r": const IconWrapper(
      iconData: Icons.format_textdirection_l_to_r,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons format textdirection r to l": const IconWrapper(
      iconData: Icons.format_textdirection_r_to_l,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons format underline": const IconWrapper(
      iconData: Icons.format_underline,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons format underlined": const IconWrapper(
      iconData: Icons.format_underlined,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons fort": const IconWrapper(
      iconData: Icons.fort, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons forum": const IconWrapper(
      iconData: Icons.forum, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons forward": const IconWrapper(
      iconData: Icons.forward, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons forward 5": const IconWrapper(
      iconData: Icons.forward_5, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons forward 10": const IconWrapper(
      iconData: Icons.forward_10, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons forward 30": const IconWrapper(
      iconData: Icons.forward_30, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons forward to inbox": const IconWrapper(
      iconData: Icons.forward_to_inbox,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons foundation": const IconWrapper(
      iconData: Icons.foundation, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons four g mobiledata": const IconWrapper(
      iconData: Icons.four_g_mobiledata,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons four g plus mobiledata": const IconWrapper(
      iconData: Icons.four_g_plus_mobiledata,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons four k": const IconWrapper(
      iconData: Icons.four_k, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons four k plus": const IconWrapper(
      iconData: Icons.four_k_plus, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons four mp": const IconWrapper(
      iconData: Icons.four_mp, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons fourteen mp": const IconWrapper(
      iconData: Icons.fourteen_mp, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons free breakfast": const IconWrapper(
      iconData: Icons.free_breakfast, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons free cancellation": const IconWrapper(
      iconData: Icons.free_cancellation,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons front hand": const IconWrapper(
      iconData: Icons.front_hand, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons front loader": const IconWrapper(
      iconData: Icons.front_loader, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons fullscreen": const IconWrapper(
      iconData: Icons.fullscreen, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons fullscreen exit": const IconWrapper(
      iconData: Icons.fullscreen_exit, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons functions": const IconWrapper(
      iconData: Icons.functions, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons g mobiledata": const IconWrapper(
      iconData: Icons.g_mobiledata, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons g translate": const IconWrapper(
      iconData: Icons.g_translate, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons gamepad": const IconWrapper(
      iconData: Icons.gamepad, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons games": const IconWrapper(
      iconData: Icons.games, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons garage": const IconWrapper(
      iconData: Icons.garage, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons gas meter": const IconWrapper(
      iconData: Icons.gas_meter, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons gavel": const IconWrapper(
      iconData: Icons.gavel, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons generating tokens": const IconWrapper(
      iconData: Icons.generating_tokens,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons gesture": const IconWrapper(
      iconData: Icons.gesture, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons get app": const IconWrapper(
      iconData: Icons.get_app, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons gif": const IconWrapper(
      iconData: Icons.gif, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons gif box": const IconWrapper(
      iconData: Icons.gif_box, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons girl": const IconWrapper(
      iconData: Icons.girl, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons gite": const IconWrapper(
      iconData: Icons.gite, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons golf course": const IconWrapper(
      iconData: Icons.golf_course, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons gpp bad": const IconWrapper(
      iconData: Icons.gpp_bad, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons gpp good": const IconWrapper(
      iconData: Icons.gpp_good, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons gpp maybe": const IconWrapper(
      iconData: Icons.gpp_maybe, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons gps fixed": const IconWrapper(
      iconData: Icons.gps_fixed, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons gps not fixed": const IconWrapper(
      iconData: Icons.gps_not_fixed, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons gps off": const IconWrapper(
      iconData: Icons.gps_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons grade": const IconWrapper(
      iconData: Icons.grade, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons gradient": const IconWrapper(
      iconData: Icons.gradient, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons grading": const IconWrapper(
      iconData: Icons.grading, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons grain": const IconWrapper(
      iconData: Icons.grain, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons graphic eq": const IconWrapper(
      iconData: Icons.graphic_eq, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons grass": const IconWrapper(
      iconData: Icons.grass, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons grid 3x3": const IconWrapper(
      iconData: Icons.grid_3x3, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons grid 4x4": const IconWrapper(
      iconData: Icons.grid_4x4, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons grid goldenratio": const IconWrapper(
      iconData: Icons.grid_goldenratio,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons grid off": const IconWrapper(
      iconData: Icons.grid_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons grid on": const IconWrapper(
      iconData: Icons.grid_on, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons grid view": const IconWrapper(
      iconData: Icons.grid_view, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons group": const IconWrapper(
      iconData: Icons.group, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons group add": const IconWrapper(
      iconData: Icons.group_add, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons group off": const IconWrapper(
      iconData: Icons.group_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons group remove": const IconWrapper(
      iconData: Icons.group_remove, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons group work": const IconWrapper(
      iconData: Icons.group_work, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons groups": const IconWrapper(
      iconData: Icons.groups, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons groups 2": const IconWrapper(
      iconData: Icons.groups_2, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons groups 3": const IconWrapper(
      iconData: Icons.groups_3, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons h mobiledata": const IconWrapper(
      iconData: Icons.h_mobiledata, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons h plus mobiledata": const IconWrapper(
      iconData: Icons.h_plus_mobiledata,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons hail": const IconWrapper(
      iconData: Icons.hail, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons handshake": const IconWrapper(
      iconData: Icons.handshake, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons handyman": const IconWrapper(
      iconData: Icons.handyman, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons hardware": const IconWrapper(
      iconData: Icons.hardware, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons hd": const IconWrapper(
      iconData: Icons.hd, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons hdr auto": const IconWrapper(
      iconData: Icons.hdr_auto, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons hdr auto select": const IconWrapper(
      iconData: Icons.hdr_auto_select, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons hdr enhanced select": const IconWrapper(
      iconData: Icons.hdr_enhanced_select,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons hdr off": const IconWrapper(
      iconData: Icons.hdr_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons hdr off select": const IconWrapper(
      iconData: Icons.hdr_off_select, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons hdr on": const IconWrapper(
      iconData: Icons.hdr_on, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons hdr on select": const IconWrapper(
      iconData: Icons.hdr_on_select, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons hdr plus": const IconWrapper(
      iconData: Icons.hdr_plus, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons hdr strong": const IconWrapper(
      iconData: Icons.hdr_strong, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons hdr weak": const IconWrapper(
      iconData: Icons.hdr_weak, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons headphones": const IconWrapper(
      iconData: Icons.headphones, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons headphones battery": const IconWrapper(
      iconData: Icons.headphones_battery,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons headset": const IconWrapper(
      iconData: Icons.headset, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons headset mic": const IconWrapper(
      iconData: Icons.headset_mic, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons headset off": const IconWrapper(
      iconData: Icons.headset_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons healing": const IconWrapper(
      iconData: Icons.healing, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons health and safety": const IconWrapper(
      iconData: Icons.health_and_safety,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons hearing": const IconWrapper(
      iconData: Icons.hearing, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons hearing disabled": const IconWrapper(
      iconData: Icons.hearing_disabled,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons heart broken": const IconWrapper(
      iconData: Icons.heart_broken, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons heat pump": const IconWrapper(
      iconData: Icons.heat_pump, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons height": const IconWrapper(
      iconData: Icons.height, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons help": const IconWrapper(
      iconData: Icons.help, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons help center": const IconWrapper(
      iconData: Icons.help_center, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons hevc": const IconWrapper(
      iconData: Icons.hevc, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons hexagon": const IconWrapper(
      iconData: Icons.hexagon, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons hide image": const IconWrapper(
      iconData: Icons.hide_image, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons hide source": const IconWrapper(
      iconData: Icons.hide_source, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons high quality": const IconWrapper(
      iconData: Icons.high_quality, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons highlight": const IconWrapper(
      iconData: Icons.highlight, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons highlight alt": const IconWrapper(
      iconData: Icons.highlight_alt, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons highlight off": const IconWrapper(
      iconData: Icons.highlight_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons highlight remove": const IconWrapper(
      iconData: Icons.highlight_remove,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons hiking": const IconWrapper(
      iconData: Icons.hiking, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons history": const IconWrapper(
      iconData: Icons.history, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons history edu": const IconWrapper(
      iconData: Icons.history_edu, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons history toggle off": const IconWrapper(
      iconData: Icons.history_toggle_off,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons hive": const IconWrapper(
      iconData: Icons.hive, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons hls": const IconWrapper(
      iconData: Icons.hls, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons hls off": const IconWrapper(
      iconData: Icons.hls_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons holiday village": const IconWrapper(
      iconData: Icons.holiday_village, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons home": const IconWrapper(
      iconData: Icons.home, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons home max": const IconWrapper(
      iconData: Icons.home_max, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons home mini": const IconWrapper(
      iconData: Icons.home_mini, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons home repair service": const IconWrapper(
      iconData: Icons.home_repair_service,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons home work": const IconWrapper(
      iconData: Icons.home_work, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons horizontal distribute": const IconWrapper(
      iconData: Icons.horizontal_distribute,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons horizontal rule": const IconWrapper(
      iconData: Icons.horizontal_rule, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons horizontal split": const IconWrapper(
      iconData: Icons.horizontal_split,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons hot tub": const IconWrapper(
      iconData: Icons.hot_tub, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons hotel": const IconWrapper(
      iconData: Icons.hotel, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons hotel class": const IconWrapper(
      iconData: Icons.hotel_class, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons hourglass bottom": const IconWrapper(
      iconData: Icons.hourglass_bottom,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons hourglass disabled": const IconWrapper(
      iconData: Icons.hourglass_disabled,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons hourglass empty": const IconWrapper(
      iconData: Icons.hourglass_empty, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons hourglass full": const IconWrapper(
      iconData: Icons.hourglass_full, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons hourglass top": const IconWrapper(
      iconData: Icons.hourglass_top, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons house": const IconWrapper(
      iconData: Icons.house, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons house siding": const IconWrapper(
      iconData: Icons.house_siding, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons houseboat": const IconWrapper(
      iconData: Icons.houseboat, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons how to reg": const IconWrapper(
      iconData: Icons.how_to_reg, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons how to vote": const IconWrapper(
      iconData: Icons.how_to_vote, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons html": const IconWrapper(
      iconData: Icons.html, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons http": const IconWrapper(
      iconData: Icons.http, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons https": const IconWrapper(
      iconData: Icons.https, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons hub": const IconWrapper(
      iconData: Icons.hub, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons hvac": const IconWrapper(
      iconData: Icons.hvac, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons ice skating": const IconWrapper(
      iconData: Icons.ice_skating, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons icecream": const IconWrapper(
      iconData: Icons.icecream, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons image": const IconWrapper(
      iconData: Icons.image, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons image aspect ratio": const IconWrapper(
      iconData: Icons.image_aspect_ratio,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons image not supported": const IconWrapper(
      iconData: Icons.image_not_supported,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons image search": const IconWrapper(
      iconData: Icons.image_search, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons imagesearch roller": const IconWrapper(
      iconData: Icons.imagesearch_roller,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons import contacts": const IconWrapper(
      iconData: Icons.import_contacts, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons import export": const IconWrapper(
      iconData: Icons.import_export, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons important devices": const IconWrapper(
      iconData: Icons.important_devices,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons inbox": const IconWrapper(
      iconData: Icons.inbox, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons incomplete circle": const IconWrapper(
      iconData: Icons.incomplete_circle,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons indeterminate check box": const IconWrapper(
      iconData: Icons.indeterminate_check_box,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons info": const IconWrapper(
      iconData: Icons.info, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons input": const IconWrapper(
      iconData: Icons.input, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons insert chart": const IconWrapper(
      iconData: Icons.insert_chart, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons insert comment": const IconWrapper(
      iconData: Icons.insert_comment, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons insert drive file": const IconWrapper(
      iconData: Icons.insert_drive_file,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons insert emoticon": const IconWrapper(
      iconData: Icons.insert_emoticon, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons insert invitation": const IconWrapper(
      iconData: Icons.insert_invitation,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons insert link": const IconWrapper(
      iconData: Icons.insert_link, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons insert page break": const IconWrapper(
      iconData: Icons.insert_page_break,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons insert photo": const IconWrapper(
      iconData: Icons.insert_photo, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons insights": const IconWrapper(
      iconData: Icons.insights, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons install desktop": const IconWrapper(
      iconData: Icons.install_desktop, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons install mobile": const IconWrapper(
      iconData: Icons.install_mobile, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons integration instructions": const IconWrapper(
      iconData: Icons.integration_instructions,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons interests": const IconWrapper(
      iconData: Icons.interests, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons interpreter mode": const IconWrapper(
      iconData: Icons.interpreter_mode,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons inventory": const IconWrapper(
      iconData: Icons.inventory, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons inventory 2": const IconWrapper(
      iconData: Icons.inventory_2, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons invert colors": const IconWrapper(
      iconData: Icons.invert_colors, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons invert colors off": const IconWrapper(
      iconData: Icons.invert_colors_off,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons invert colors on": const IconWrapper(
      iconData: Icons.invert_colors_on,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons ios share": const IconWrapper(
      iconData: Icons.ios_share, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons iron": const IconWrapper(
      iconData: Icons.iron, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons iso": const IconWrapper(
      iconData: Icons.iso, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons javascript": const IconWrapper(
      iconData: Icons.javascript, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons join full": const IconWrapper(
      iconData: Icons.join_full, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons join inner": const IconWrapper(
      iconData: Icons.join_inner, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons join left": const IconWrapper(
      iconData: Icons.join_left, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons join right": const IconWrapper(
      iconData: Icons.join_right, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons kayaking": const IconWrapper(
      iconData: Icons.kayaking, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons kebab dining": const IconWrapper(
      iconData: Icons.kebab_dining, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons key": const IconWrapper(
      iconData: Icons.key, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons key off": const IconWrapper(
      iconData: Icons.key_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons keyboard": const IconWrapper(
      iconData: Icons.keyboard, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons keyboard alt": const IconWrapper(
      iconData: Icons.keyboard_alt, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons keyboard arrow down": const IconWrapper(
      iconData: Icons.keyboard_arrow_down,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons keyboard arrow left": const IconWrapper(
      iconData: Icons.keyboard_arrow_left,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons keyboard arrow right": const IconWrapper(
      iconData: Icons.keyboard_arrow_right,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons keyboard arrow up": const IconWrapper(
      iconData: Icons.keyboard_arrow_up,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons keyboard backspace": const IconWrapper(
      iconData: Icons.keyboard_backspace,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons keyboard capslock": const IconWrapper(
      iconData: Icons.keyboard_capslock,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons keyboard command key": const IconWrapper(
      iconData: Icons.keyboard_command_key,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons keyboard control": const IconWrapper(
      iconData: Icons.keyboard_control,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons keyboard control key": const IconWrapper(
      iconData: Icons.keyboard_control_key,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons keyboard double arrow down": const IconWrapper(
      iconData: Icons.keyboard_double_arrow_down,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons keyboard double arrow left": const IconWrapper(
      iconData: Icons.keyboard_double_arrow_left,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons keyboard double arrow right": const IconWrapper(
      iconData: Icons.keyboard_double_arrow_right,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons keyboard double arrow up": const IconWrapper(
      iconData: Icons.keyboard_double_arrow_up,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons keyboard hide": const IconWrapper(
      iconData: Icons.keyboard_hide, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons keyboard option key": const IconWrapper(
      iconData: Icons.keyboard_option_key,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons keyboard return": const IconWrapper(
      iconData: Icons.keyboard_return, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons keyboard tab": const IconWrapper(
      iconData: Icons.keyboard_tab, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons keyboard voice": const IconWrapper(
      iconData: Icons.keyboard_voice, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons king bed": const IconWrapper(
      iconData: Icons.king_bed, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons kitchen": const IconWrapper(
      iconData: Icons.kitchen, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons kitesurfing": const IconWrapper(
      iconData: Icons.kitesurfing, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons label": const IconWrapper(
      iconData: Icons.label, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons label important": const IconWrapper(
      iconData: Icons.label_important, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons label off": const IconWrapper(
      iconData: Icons.label_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons lan": const IconWrapper(
      iconData: Icons.lan, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons landscape": const IconWrapper(
      iconData: Icons.landscape, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons landslide": const IconWrapper(
      iconData: Icons.landslide, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons language": const IconWrapper(
      iconData: Icons.language, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons laptop": const IconWrapper(
      iconData: Icons.laptop, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons laptop chromebook": const IconWrapper(
      iconData: Icons.laptop_chromebook,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons laptop mac": const IconWrapper(
      iconData: Icons.laptop_mac, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons laptop windows": const IconWrapper(
      iconData: Icons.laptop_windows, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons last page": const IconWrapper(
      iconData: Icons.last_page, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons launch": const IconWrapper(
      iconData: Icons.launch, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons layers": const IconWrapper(
      iconData: Icons.layers, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons layers clear": const IconWrapper(
      iconData: Icons.layers_clear, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons leaderboard": const IconWrapper(
      iconData: Icons.leaderboard, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons leak add": const IconWrapper(
      iconData: Icons.leak_add, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons leak remove": const IconWrapper(
      iconData: Icons.leak_remove, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons leave bags at home": const IconWrapper(
      iconData: Icons.leave_bags_at_home,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons legend toggle": const IconWrapper(
      iconData: Icons.legend_toggle, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons lens": const IconWrapper(
      iconData: Icons.lens, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons lens blur": const IconWrapper(
      iconData: Icons.lens_blur, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons library add": const IconWrapper(
      iconData: Icons.library_add, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons library add check": const IconWrapper(
      iconData: Icons.library_add_check,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons library books": const IconWrapper(
      iconData: Icons.library_books, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons library music": const IconWrapper(
      iconData: Icons.library_music, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons light": const IconWrapper(
      iconData: Icons.light, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons light mode": const IconWrapper(
      iconData: Icons.light_mode, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons lightbulb": const IconWrapper(
      iconData: Icons.lightbulb, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons lightbulb circle": const IconWrapper(
      iconData: Icons.lightbulb_circle,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons line axis": const IconWrapper(
      iconData: Icons.line_axis, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons line style": const IconWrapper(
      iconData: Icons.line_style, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons line weight": const IconWrapper(
      iconData: Icons.line_weight, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons linear scale": const IconWrapper(
      iconData: Icons.linear_scale, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons link": const IconWrapper(
      iconData: Icons.link, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons link off": const IconWrapper(
      iconData: Icons.link_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons linked camera": const IconWrapper(
      iconData: Icons.linked_camera, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons liquor": const IconWrapper(
      iconData: Icons.liquor, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons list": const IconWrapper(
      iconData: Icons.list, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons list alt": const IconWrapper(
      iconData: Icons.list_alt, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons live help": const IconWrapper(
      iconData: Icons.live_help, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons live tv": const IconWrapper(
      iconData: Icons.live_tv, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons living": const IconWrapper(
      iconData: Icons.living, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons local activity": const IconWrapper(
      iconData: Icons.local_activity, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons local airport": const IconWrapper(
      iconData: Icons.local_airport, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons local atm": const IconWrapper(
      iconData: Icons.local_atm, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons local attraction": const IconWrapper(
      iconData: Icons.local_attraction,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons local bar": const IconWrapper(
      iconData: Icons.local_bar, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons local cafe": const IconWrapper(
      iconData: Icons.local_cafe, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons local car wash": const IconWrapper(
      iconData: Icons.local_car_wash, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons local convenience store": const IconWrapper(
      iconData: Icons.local_convenience_store,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons local dining": const IconWrapper(
      iconData: Icons.local_dining, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons local drink": const IconWrapper(
      iconData: Icons.local_drink, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons local fire department": const IconWrapper(
      iconData: Icons.local_fire_department,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons local florist": const IconWrapper(
      iconData: Icons.local_florist, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons local gas station": const IconWrapper(
      iconData: Icons.local_gas_station,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons local grocery store": const IconWrapper(
      iconData: Icons.local_grocery_store,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons local hospital": const IconWrapper(
      iconData: Icons.local_hospital, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons local hotel": const IconWrapper(
      iconData: Icons.local_hotel, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons local laundry service": const IconWrapper(
      iconData: Icons.local_laundry_service,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons local library": const IconWrapper(
      iconData: Icons.local_library, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons local mall": const IconWrapper(
      iconData: Icons.local_mall, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons local movies": const IconWrapper(
      iconData: Icons.local_movies, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons local offer": const IconWrapper(
      iconData: Icons.local_offer, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons local parking": const IconWrapper(
      iconData: Icons.local_parking, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons local pharmacy": const IconWrapper(
      iconData: Icons.local_pharmacy, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons local phone": const IconWrapper(
      iconData: Icons.local_phone, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons local pizza": const IconWrapper(
      iconData: Icons.local_pizza, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons local play": const IconWrapper(
      iconData: Icons.local_play, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons local police": const IconWrapper(
      iconData: Icons.local_police, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons local post office": const IconWrapper(
      iconData: Icons.local_post_office,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons local print shop": const IconWrapper(
      iconData: Icons.local_print_shop,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons local printshop": const IconWrapper(
      iconData: Icons.local_printshop, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons local restaurant": const IconWrapper(
      iconData: Icons.local_restaurant,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons local see": const IconWrapper(
      iconData: Icons.local_see, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons local shipping": const IconWrapper(
      iconData: Icons.local_shipping, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons local taxi": const IconWrapper(
      iconData: Icons.local_taxi, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons location city": const IconWrapper(
      iconData: Icons.location_city, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons location disabled": const IconWrapper(
      iconData: Icons.location_disabled,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons location history": const IconWrapper(
      iconData: Icons.location_history,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons location off": const IconWrapper(
      iconData: Icons.location_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons location on": const IconWrapper(
      iconData: Icons.location_on, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons location pin": const IconWrapper(
      iconData: Icons.location_pin, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons location searching": const IconWrapper(
      iconData: Icons.location_searching,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons lock": const IconWrapper(
      iconData: Icons.lock, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons lock clock": const IconWrapper(
      iconData: Icons.lock_clock, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons lock open": const IconWrapper(
      iconData: Icons.lock_open, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons lock person": const IconWrapper(
      iconData: Icons.lock_person, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons lock reset": const IconWrapper(
      iconData: Icons.lock_reset, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons login": const IconWrapper(
      iconData: Icons.login, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons logo dev": const IconWrapper(
      iconData: Icons.logo_dev, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons logout": const IconWrapper(
      iconData: Icons.logout, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons looks": const IconWrapper(
      iconData: Icons.looks, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons looks 3": const IconWrapper(
      iconData: Icons.looks_3, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons looks 4": const IconWrapper(
      iconData: Icons.looks_4, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons looks 5": const IconWrapper(
      iconData: Icons.looks_5, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons looks 6": const IconWrapper(
      iconData: Icons.looks_6, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons looks one": const IconWrapper(
      iconData: Icons.looks_one, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons looks two": const IconWrapper(
      iconData: Icons.looks_two, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons loop": const IconWrapper(
      iconData: Icons.loop, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons loupe": const IconWrapper(
      iconData: Icons.loupe, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons low priority": const IconWrapper(
      iconData: Icons.low_priority, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons loyalty": const IconWrapper(
      iconData: Icons.loyalty, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons lte mobiledata": const IconWrapper(
      iconData: Icons.lte_mobiledata, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons lte plus mobiledata": const IconWrapper(
      iconData: Icons.lte_plus_mobiledata,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons luggage": const IconWrapper(
      iconData: Icons.luggage, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons lunch dining": const IconWrapper(
      iconData: Icons.lunch_dining, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons lyrics": const IconWrapper(
      iconData: Icons.lyrics, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons macro off": const IconWrapper(
      iconData: Icons.macro_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons mail": const IconWrapper(
      iconData: Icons.mail, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons mail lock": const IconWrapper(
      iconData: Icons.mail_lock, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons male": const IconWrapper(
      iconData: Icons.male, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons man": const IconWrapper(
      iconData: Icons.man, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons man 2": const IconWrapper(
      iconData: Icons.man_2, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons man 3": const IconWrapper(
      iconData: Icons.man_3, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons man 4": const IconWrapper(
      iconData: Icons.man_4, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons manage accounts": const IconWrapper(
      iconData: Icons.manage_accounts, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons manage history": const IconWrapper(
      iconData: Icons.manage_history, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons manage search": const IconWrapper(
      iconData: Icons.manage_search, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons map": const IconWrapper(
      iconData: Icons.map, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons maps home work": const IconWrapper(
      iconData: Icons.maps_home_work, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons maps ugc": const IconWrapper(
      iconData: Icons.maps_ugc, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons margin": const IconWrapper(
      iconData: Icons.margin, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons mark as unread": const IconWrapper(
      iconData: Icons.mark_as_unread, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons mark chat read": const IconWrapper(
      iconData: Icons.mark_chat_read, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons mark chat unread": const IconWrapper(
      iconData: Icons.mark_chat_unread,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons mark email read": const IconWrapper(
      iconData: Icons.mark_email_read, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons mark email unread": const IconWrapper(
      iconData: Icons.mark_email_unread,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons mark unread chat alt": const IconWrapper(
      iconData: Icons.mark_unread_chat_alt,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons markunread": const IconWrapper(
      iconData: Icons.markunread, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons markunread mailbox": const IconWrapper(
      iconData: Icons.markunread_mailbox,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons masks": const IconWrapper(
      iconData: Icons.masks, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons maximize": const IconWrapper(
      iconData: Icons.maximize, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons media bluetooth off": const IconWrapper(
      iconData: Icons.media_bluetooth_off,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons media bluetooth on": const IconWrapper(
      iconData: Icons.media_bluetooth_on,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons mediation": const IconWrapper(
      iconData: Icons.mediation, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons medical information": const IconWrapper(
      iconData: Icons.medical_information,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons medical services": const IconWrapper(
      iconData: Icons.medical_services,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons medication": const IconWrapper(
      iconData: Icons.medication, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons medication liquid": const IconWrapper(
      iconData: Icons.medication_liquid,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons meeting room": const IconWrapper(
      iconData: Icons.meeting_room, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons memory": const IconWrapper(
      iconData: Icons.memory, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons menu": const IconWrapper(
      iconData: Icons.menu, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons menu book": const IconWrapper(
      iconData: Icons.menu_book, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons menu open": const IconWrapper(
      iconData: Icons.menu_open, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons merge": const IconWrapper(
      iconData: Icons.merge, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons merge type": const IconWrapper(
      iconData: Icons.merge_type, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons message": const IconWrapper(
      iconData: Icons.message, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons messenger": const IconWrapper(
      iconData: Icons.messenger, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons mic": const IconWrapper(
      iconData: Icons.mic, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons mic external off": const IconWrapper(
      iconData: Icons.mic_external_off,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons mic external on": const IconWrapper(
      iconData: Icons.mic_external_on, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons mic none": const IconWrapper(
      iconData: Icons.mic_none, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons mic off": const IconWrapper(
      iconData: Icons.mic_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons microwave": const IconWrapper(
      iconData: Icons.microwave, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons military tech": const IconWrapper(
      iconData: Icons.military_tech, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons minimize": const IconWrapper(
      iconData: Icons.minimize, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons minor crash": const IconWrapper(
      iconData: Icons.minor_crash, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons miscellaneous services": const IconWrapper(
      iconData: Icons.miscellaneous_services,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons missed video call": const IconWrapper(
      iconData: Icons.missed_video_call,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons mms": const IconWrapper(
      iconData: Icons.mms, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons mobile friendly": const IconWrapper(
      iconData: Icons.mobile_friendly, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons mobile off": const IconWrapper(
      iconData: Icons.mobile_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons mobile screen share": const IconWrapper(
      iconData: Icons.mobile_screen_share,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons mobiledata off": const IconWrapper(
      iconData: Icons.mobiledata_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons mode": const IconWrapper(
      iconData: Icons.mode, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons mode comment": const IconWrapper(
      iconData: Icons.mode_comment, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons mode edit": const IconWrapper(
      iconData: Icons.mode_edit, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons mode fan off": const IconWrapper(
      iconData: Icons.mode_fan_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons mode night": const IconWrapper(
      iconData: Icons.mode_night, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons mode of travel": const IconWrapper(
      iconData: Icons.mode_of_travel, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons mode standby": const IconWrapper(
      iconData: Icons.mode_standby, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons model training": const IconWrapper(
      iconData: Icons.model_training, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons monetization on": const IconWrapper(
      iconData: Icons.monetization_on, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons money": const IconWrapper(
      iconData: Icons.money, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons money off": const IconWrapper(
      iconData: Icons.money_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons money off csred": const IconWrapper(
      iconData: Icons.money_off_csred, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons monitor": const IconWrapper(
      iconData: Icons.monitor, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons monitor heart": const IconWrapper(
      iconData: Icons.monitor_heart, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons monitor weight": const IconWrapper(
      iconData: Icons.monitor_weight, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons monochrome photos": const IconWrapper(
      iconData: Icons.monochrome_photos,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons mood": const IconWrapper(
      iconData: Icons.mood, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons mood bad": const IconWrapper(
      iconData: Icons.mood_bad, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons moped": const IconWrapper(
      iconData: Icons.moped, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons more": const IconWrapper(
      iconData: Icons.more, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons more horiz": const IconWrapper(
      iconData: Icons.more_horiz, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons more time": const IconWrapper(
      iconData: Icons.more_time, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons more vert": const IconWrapper(
      iconData: Icons.more_vert, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons mosque": const IconWrapper(
      iconData: Icons.mosque, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons motion photos auto": const IconWrapper(
      iconData: Icons.motion_photos_auto,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons motion photos off": const IconWrapper(
      iconData: Icons.motion_photos_off,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons motion photos on": const IconWrapper(
      iconData: Icons.motion_photos_on,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons motion photos pause": const IconWrapper(
      iconData: Icons.motion_photos_pause,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons motion photos paused": const IconWrapper(
      iconData: Icons.motion_photos_paused,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons motorcycle": const IconWrapper(
      iconData: Icons.motorcycle, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons mouse": const IconWrapper(
      iconData: Icons.mouse, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons move down": const IconWrapper(
      iconData: Icons.move_down, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons move to inbox": const IconWrapper(
      iconData: Icons.move_to_inbox, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons move up": const IconWrapper(
      iconData: Icons.move_up, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons movie": const IconWrapper(
      iconData: Icons.movie, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons movie creation": const IconWrapper(
      iconData: Icons.movie_creation, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons movie edit": const IconWrapper(
      iconData: Icons.movie_edit, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons movie filter": const IconWrapper(
      iconData: Icons.movie_filter, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons moving": const IconWrapper(
      iconData: Icons.moving, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons mp": const IconWrapper(
      iconData: Icons.mp, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons multiline chart": const IconWrapper(
      iconData: Icons.multiline_chart, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons multiple stop": const IconWrapper(
      iconData: Icons.multiple_stop, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons multitrack audio": const IconWrapper(
      iconData: Icons.multitrack_audio,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons museum": const IconWrapper(
      iconData: Icons.museum, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons music note": const IconWrapper(
      iconData: Icons.music_note, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons music off": const IconWrapper(
      iconData: Icons.music_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons music video": const IconWrapper(
      iconData: Icons.music_video, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons my library add": const IconWrapper(
      iconData: Icons.my_library_add, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons my library books": const IconWrapper(
      iconData: Icons.my_library_books,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons my library music": const IconWrapper(
      iconData: Icons.my_library_music,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons my location": const IconWrapper(
      iconData: Icons.my_location, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons nat": const IconWrapper(
      iconData: Icons.nat, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons nature": const IconWrapper(
      iconData: Icons.nature, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons nature people": const IconWrapper(
      iconData: Icons.nature_people, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons navigate before": const IconWrapper(
      iconData: Icons.navigate_before, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons navigate next": const IconWrapper(
      iconData: Icons.navigate_next, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons navigation": const IconWrapper(
      iconData: Icons.navigation, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons near me": const IconWrapper(
      iconData: Icons.near_me, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons near me disabled": const IconWrapper(
      iconData: Icons.near_me_disabled,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons nearby error": const IconWrapper(
      iconData: Icons.nearby_error, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons nearby off": const IconWrapper(
      iconData: Icons.nearby_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons nest cam wired stand": const IconWrapper(
      iconData: Icons.nest_cam_wired_stand,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons network cell": const IconWrapper(
      iconData: Icons.network_cell, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons network check": const IconWrapper(
      iconData: Icons.network_check, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons network locked": const IconWrapper(
      iconData: Icons.network_locked, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons network ping": const IconWrapper(
      iconData: Icons.network_ping, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons network wifi": const IconWrapper(
      iconData: Icons.network_wifi, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons network wifi 1 bar": const IconWrapper(
      iconData: Icons.network_wifi_1_bar,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons network wifi 2 bar": const IconWrapper(
      iconData: Icons.network_wifi_2_bar,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons network wifi 3 bar": const IconWrapper(
      iconData: Icons.network_wifi_3_bar,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons new label": const IconWrapper(
      iconData: Icons.new_label, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons new releases": const IconWrapper(
      iconData: Icons.new_releases, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons newspaper": const IconWrapper(
      iconData: Icons.newspaper, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons next plan": const IconWrapper(
      iconData: Icons.next_plan, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons next week": const IconWrapper(
      iconData: Icons.next_week, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons nfc": const IconWrapper(
      iconData: Icons.nfc, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons night shelter": const IconWrapper(
      iconData: Icons.night_shelter, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons nightlife": const IconWrapper(
      iconData: Icons.nightlife, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons nightlight": const IconWrapper(
      iconData: Icons.nightlight, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons nightlight round": const IconWrapper(
      iconData: Icons.nightlight_round,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons nights stay": const IconWrapper(
      iconData: Icons.nights_stay, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons nine k": const IconWrapper(
      iconData: Icons.nine_k, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons nine k plus": const IconWrapper(
      iconData: Icons.nine_k_plus, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons nine mp": const IconWrapper(
      iconData: Icons.nine_mp, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons nineteen mp": const IconWrapper(
      iconData: Icons.nineteen_mp, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons no accounts": const IconWrapper(
      iconData: Icons.no_accounts, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons no adult content": const IconWrapper(
      iconData: Icons.no_adult_content,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons no backpack": const IconWrapper(
      iconData: Icons.no_backpack, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons no cell": const IconWrapper(
      iconData: Icons.no_cell, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons no crash": const IconWrapper(
      iconData: Icons.no_crash, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons no drinks": const IconWrapper(
      iconData: Icons.no_drinks, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons no encryption": const IconWrapper(
      iconData: Icons.no_encryption, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons no encryption gmailerrorred": const IconWrapper(
      iconData: Icons.no_encryption_gmailerrorred,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons no flash": const IconWrapper(
      iconData: Icons.no_flash, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons no food": const IconWrapper(
      iconData: Icons.no_food, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons no luggage": const IconWrapper(
      iconData: Icons.no_luggage, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons no meals": const IconWrapper(
      iconData: Icons.no_meals, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons no meals ouline": const IconWrapper(
      iconData: Icons.no_meals_ouline, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons no meeting room": const IconWrapper(
      iconData: Icons.no_meeting_room, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons no photography": const IconWrapper(
      iconData: Icons.no_photography, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons no sim": const IconWrapper(
      iconData: Icons.no_sim, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons no stroller": const IconWrapper(
      iconData: Icons.no_stroller, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons no transfer": const IconWrapper(
      iconData: Icons.no_transfer, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons noise aware": const IconWrapper(
      iconData: Icons.noise_aware, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons noise control off": const IconWrapper(
      iconData: Icons.noise_control_off,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons nordic walking": const IconWrapper(
      iconData: Icons.nordic_walking, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons north": const IconWrapper(
      iconData: Icons.north, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons north east": const IconWrapper(
      iconData: Icons.north_east, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons north west": const IconWrapper(
      iconData: Icons.north_west, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons not accessible": const IconWrapper(
      iconData: Icons.not_accessible, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons not interested": const IconWrapper(
      iconData: Icons.not_interested, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons not listed location": const IconWrapper(
      iconData: Icons.not_listed_location,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons not started": const IconWrapper(
      iconData: Icons.not_started, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons note": const IconWrapper(
      iconData: Icons.note, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons note add": const IconWrapper(
      iconData: Icons.note_add, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons note alt": const IconWrapper(
      iconData: Icons.note_alt, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons notes": const IconWrapper(
      iconData: Icons.notes, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons notification add": const IconWrapper(
      iconData: Icons.notification_add,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons notification important": const IconWrapper(
      iconData: Icons.notification_important,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons notifications": const IconWrapper(
      iconData: Icons.notifications, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons notifications active": const IconWrapper(
      iconData: Icons.notifications_active,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons notifications none": const IconWrapper(
      iconData: Icons.notifications_none,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons notifications off": const IconWrapper(
      iconData: Icons.notifications_off,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons notifications on": const IconWrapper(
      iconData: Icons.notifications_on,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons notifications paused": const IconWrapper(
      iconData: Icons.notifications_paused,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons now wallpaper": const IconWrapper(
      iconData: Icons.now_wallpaper, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons now widgets": const IconWrapper(
      iconData: Icons.now_widgets, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons numbers": const IconWrapper(
      iconData: Icons.numbers, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons offline bolt": const IconWrapper(
      iconData: Icons.offline_bolt, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons offline pin": const IconWrapper(
      iconData: Icons.offline_pin, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons offline share": const IconWrapper(
      iconData: Icons.offline_share, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons oil barrel": const IconWrapper(
      iconData: Icons.oil_barrel, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons on device training": const IconWrapper(
      iconData: Icons.on_device_training,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons ondemand video": const IconWrapper(
      iconData: Icons.ondemand_video, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons one k": const IconWrapper(
      iconData: Icons.one_k, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons one k plus": const IconWrapper(
      iconData: Icons.one_k_plus, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons one x mobiledata": const IconWrapper(
      iconData: Icons.one_x_mobiledata,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons onetwothree": const IconWrapper(
      iconData: Icons.onetwothree, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons online prediction": const IconWrapper(
      iconData: Icons.online_prediction,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons opacity": const IconWrapper(
      iconData: Icons.opacity, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons open in browser": const IconWrapper(
      iconData: Icons.open_in_browser, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons open in full": const IconWrapper(
      iconData: Icons.open_in_full, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons open in new": const IconWrapper(
      iconData: Icons.open_in_new, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons open in new off": const IconWrapper(
      iconData: Icons.open_in_new_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons open with": const IconWrapper(
      iconData: Icons.open_with, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons other houses": const IconWrapper(
      iconData: Icons.other_houses, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons outbond": const IconWrapper(
      iconData: Icons.outbond, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons outbound": const IconWrapper(
      iconData: Icons.outbound, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons outbox": const IconWrapper(
      iconData: Icons.outbox, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons outdoor grill": const IconWrapper(
      iconData: Icons.outdoor_grill, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons outgoing mail": const IconWrapper(
      iconData: Icons.outgoing_mail, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons outlet": const IconWrapper(
      iconData: Icons.outlet, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons output": const IconWrapper(
      iconData: Icons.output, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons padding": const IconWrapper(
      iconData: Icons.padding, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons pages": const IconWrapper(
      iconData: Icons.pages, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons pageview": const IconWrapper(
      iconData: Icons.pageview, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons paid": const IconWrapper(
      iconData: Icons.paid, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons palette": const IconWrapper(
      iconData: Icons.palette, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons pallet": const IconWrapper(
      iconData: Icons.pallet, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons pan tool": const IconWrapper(
      iconData: Icons.pan_tool, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons pan tool alt": const IconWrapper(
      iconData: Icons.pan_tool_alt, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons panorama": const IconWrapper(
      iconData: Icons.panorama, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons panorama fish eye": const IconWrapper(
      iconData: Icons.panorama_fish_eye,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons panorama fisheye": const IconWrapper(
      iconData: Icons.panorama_fisheye,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons panorama horizontal": const IconWrapper(
      iconData: Icons.panorama_horizontal,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons panorama horizontal select": const IconWrapper(
      iconData: Icons.panorama_horizontal_select,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons panorama photosphere": const IconWrapper(
      iconData: Icons.panorama_photosphere,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons panorama photosphere select": const IconWrapper(
      iconData: Icons.panorama_photosphere_select,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons panorama vertical": const IconWrapper(
      iconData: Icons.panorama_vertical,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons panorama vertical select": const IconWrapper(
      iconData: Icons.panorama_vertical_select,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons panorama wide angle": const IconWrapper(
      iconData: Icons.panorama_wide_angle,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons panorama wide angle select": const IconWrapper(
      iconData: Icons.panorama_wide_angle_select,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons paragliding": const IconWrapper(
      iconData: Icons.paragliding, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons park": const IconWrapper(
      iconData: Icons.park, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons party mode": const IconWrapper(
      iconData: Icons.party_mode, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons password": const IconWrapper(
      iconData: Icons.password, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons paste": const IconWrapper(
      iconData: Icons.paste, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons pattern": const IconWrapper(
      iconData: Icons.pattern, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons pause": const IconWrapper(
      iconData: Icons.pause, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons pause circle": const IconWrapper(
      iconData: Icons.pause_circle, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons pause presentation": const IconWrapper(
      iconData: Icons.pause_presentation,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons payment": const IconWrapper(
      iconData: Icons.payment, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons payments": const IconWrapper(
      iconData: Icons.payments, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons paypal": const IconWrapper(
      iconData: Icons.paypal, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons pedal bike": const IconWrapper(
      iconData: Icons.pedal_bike, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons pending": const IconWrapper(
      iconData: Icons.pending, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons pending actions": const IconWrapper(
      iconData: Icons.pending_actions, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons pentagon": const IconWrapper(
      iconData: Icons.pentagon, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons people": const IconWrapper(
      iconData: Icons.people, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons people alt": const IconWrapper(
      iconData: Icons.people_alt, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons percent": const IconWrapper(
      iconData: Icons.percent, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons perm camera mic": const IconWrapper(
      iconData: Icons.perm_camera_mic, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons perm contact cal": const IconWrapper(
      iconData: Icons.perm_contact_cal,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons perm contact calendar": const IconWrapper(
      iconData: Icons.perm_contact_calendar,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons perm data setting": const IconWrapper(
      iconData: Icons.perm_data_setting,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons perm device info": const IconWrapper(
      iconData: Icons.perm_device_info,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons perm device information": const IconWrapper(
      iconData: Icons.perm_device_information,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons perm identity": const IconWrapper(
      iconData: Icons.perm_identity, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons perm media": const IconWrapper(
      iconData: Icons.perm_media, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons perm phone msg": const IconWrapper(
      iconData: Icons.perm_phone_msg, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons perm scan wifi": const IconWrapper(
      iconData: Icons.perm_scan_wifi, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons person": const IconWrapper(
      iconData: Icons.person, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons person 2": const IconWrapper(
      iconData: Icons.person_2, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons person 3": const IconWrapper(
      iconData: Icons.person_3, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons person 4": const IconWrapper(
      iconData: Icons.person_4, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons person add": const IconWrapper(
      iconData: Icons.person_add, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons person add alt": const IconWrapper(
      iconData: Icons.person_add_alt, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons person add alt 1": const IconWrapper(
      iconData: Icons.person_add_alt_1,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons person add disabled": const IconWrapper(
      iconData: Icons.person_add_disabled,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons person off": const IconWrapper(
      iconData: Icons.person_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons person pin": const IconWrapper(
      iconData: Icons.person_pin, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons person pin circle": const IconWrapper(
      iconData: Icons.person_pin_circle,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons person remove": const IconWrapper(
      iconData: Icons.person_remove, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons person remove alt 1": const IconWrapper(
      iconData: Icons.person_remove_alt_1,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons person search": const IconWrapper(
      iconData: Icons.person_search, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons personal injury": const IconWrapper(
      iconData: Icons.personal_injury, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons personal video": const IconWrapper(
      iconData: Icons.personal_video, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons pest control": const IconWrapper(
      iconData: Icons.pest_control, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons pest control rodent": const IconWrapper(
      iconData: Icons.pest_control_rodent,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons pets": const IconWrapper(
      iconData: Icons.pets, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons phishing": const IconWrapper(
      iconData: Icons.phishing, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons phone": const IconWrapper(
      iconData: Icons.phone, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons phone android": const IconWrapper(
      iconData: Icons.phone_android, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons phone bluetooth speaker": const IconWrapper(
      iconData: Icons.phone_bluetooth_speaker,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons phone callback": const IconWrapper(
      iconData: Icons.phone_callback, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons phone disabled": const IconWrapper(
      iconData: Icons.phone_disabled, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons phone enabled": const IconWrapper(
      iconData: Icons.phone_enabled, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons phone forwarded": const IconWrapper(
      iconData: Icons.phone_forwarded, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons phone in talk": const IconWrapper(
      iconData: Icons.phone_in_talk, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons phone iphone": const IconWrapper(
      iconData: Icons.phone_iphone, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons phone locked": const IconWrapper(
      iconData: Icons.phone_locked, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons phone missed": const IconWrapper(
      iconData: Icons.phone_missed, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons phone paused": const IconWrapper(
      iconData: Icons.phone_paused, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons phonelink": const IconWrapper(
      iconData: Icons.phonelink, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons phonelink erase": const IconWrapper(
      iconData: Icons.phonelink_erase, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons phonelink lock": const IconWrapper(
      iconData: Icons.phonelink_lock, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons phonelink off": const IconWrapper(
      iconData: Icons.phonelink_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons phonelink ring": const IconWrapper(
      iconData: Icons.phonelink_ring, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons phonelink setup": const IconWrapper(
      iconData: Icons.phonelink_setup, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons photo": const IconWrapper(
      iconData: Icons.photo, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons photo album": const IconWrapper(
      iconData: Icons.photo_album, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons photo camera": const IconWrapper(
      iconData: Icons.photo_camera, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons photo camera back": const IconWrapper(
      iconData: Icons.photo_camera_back,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons photo camera front": const IconWrapper(
      iconData: Icons.photo_camera_front,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons photo filter": const IconWrapper(
      iconData: Icons.photo_filter, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons photo library": const IconWrapper(
      iconData: Icons.photo_library, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons photo size select actual": const IconWrapper(
      iconData: Icons.photo_size_select_actual,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons photo size select large": const IconWrapper(
      iconData: Icons.photo_size_select_large,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons photo size select small": const IconWrapper(
      iconData: Icons.photo_size_select_small,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons php": const IconWrapper(
      iconData: Icons.php, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons piano": const IconWrapper(
      iconData: Icons.piano, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons piano off": const IconWrapper(
      iconData: Icons.piano_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons picture as pdf": const IconWrapper(
      iconData: Icons.picture_as_pdf, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons picture in picture": const IconWrapper(
      iconData: Icons.picture_in_picture,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons picture in picture alt": const IconWrapper(
      iconData: Icons.picture_in_picture_alt,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons pie chart": const IconWrapper(
      iconData: Icons.pie_chart, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons pin": const IconWrapper(
      iconData: Icons.pin, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons pin drop": const IconWrapper(
      iconData: Icons.pin_drop, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons pin end": const IconWrapper(
      iconData: Icons.pin_end, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons pin invoke": const IconWrapper(
      iconData: Icons.pin_invoke, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons pinch": const IconWrapper(
      iconData: Icons.pinch, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons pivot table chart": const IconWrapper(
      iconData: Icons.pivot_table_chart,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons pix": const IconWrapper(
      iconData: Icons.pix, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons place": const IconWrapper(
      iconData: Icons.place, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons plagiarism": const IconWrapper(
      iconData: Icons.plagiarism, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons play arrow": const IconWrapper(
      iconData: Icons.play_arrow, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons play circle": const IconWrapper(
      iconData: Icons.play_circle, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons play circle fill": const IconWrapper(
      iconData: Icons.play_circle_fill,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons play disabled": const IconWrapper(
      iconData: Icons.play_disabled, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons play for work": const IconWrapper(
      iconData: Icons.play_for_work, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons play lesson": const IconWrapper(
      iconData: Icons.play_lesson, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons playlist add": const IconWrapper(
      iconData: Icons.playlist_add, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons playlist add check": const IconWrapper(
      iconData: Icons.playlist_add_check,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons playlist add check circle": const IconWrapper(
      iconData: Icons.playlist_add_check_circle,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons playlist add circle": const IconWrapper(
      iconData: Icons.playlist_add_circle,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons playlist play": const IconWrapper(
      iconData: Icons.playlist_play, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons playlist remove": const IconWrapper(
      iconData: Icons.playlist_remove, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons plumbing": const IconWrapper(
      iconData: Icons.plumbing, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons plus one": const IconWrapper(
      iconData: Icons.plus_one, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons podcasts": const IconWrapper(
      iconData: Icons.podcasts, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons point of sale": const IconWrapper(
      iconData: Icons.point_of_sale, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons policy": const IconWrapper(
      iconData: Icons.policy, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons poll": const IconWrapper(
      iconData: Icons.poll, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons polyline": const IconWrapper(
      iconData: Icons.polyline, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons polymer": const IconWrapper(
      iconData: Icons.polymer, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons pool": const IconWrapper(
      iconData: Icons.pool, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons portable wifi off": const IconWrapper(
      iconData: Icons.portable_wifi_off,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons portrait": const IconWrapper(
      iconData: Icons.portrait, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons post add": const IconWrapper(
      iconData: Icons.post_add, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons power": const IconWrapper(
      iconData: Icons.power, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons power input": const IconWrapper(
      iconData: Icons.power_input, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons power off": const IconWrapper(
      iconData: Icons.power_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons power settings new": const IconWrapper(
      iconData: Icons.power_settings_new,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons precision manufacturing": const IconWrapper(
      iconData: Icons.precision_manufacturing,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons pregnant woman": const IconWrapper(
      iconData: Icons.pregnant_woman, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons present to all": const IconWrapper(
      iconData: Icons.present_to_all, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons preview": const IconWrapper(
      iconData: Icons.preview, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons price change": const IconWrapper(
      iconData: Icons.price_change, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons price check": const IconWrapper(
      iconData: Icons.price_check, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons print": const IconWrapper(
      iconData: Icons.print, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons print disabled": const IconWrapper(
      iconData: Icons.print_disabled, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons priority high": const IconWrapper(
      iconData: Icons.priority_high, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons privacy tip": const IconWrapper(
      iconData: Icons.privacy_tip, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons private connectivity": const IconWrapper(
      iconData: Icons.private_connectivity,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons production quantity limits": const IconWrapper(
      iconData: Icons.production_quantity_limits,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons propane": const IconWrapper(
      iconData: Icons.propane, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons propane tank": const IconWrapper(
      iconData: Icons.propane_tank, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons psychology": const IconWrapper(
      iconData: Icons.psychology, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons psychology alt": const IconWrapper(
      iconData: Icons.psychology_alt, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons public": const IconWrapper(
      iconData: Icons.public, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons public off": const IconWrapper(
      iconData: Icons.public_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons publish": const IconWrapper(
      iconData: Icons.publish, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons published with changes": const IconWrapper(
      iconData: Icons.published_with_changes,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons punch clock": const IconWrapper(
      iconData: Icons.punch_clock, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons push pin": const IconWrapper(
      iconData: Icons.push_pin, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons qr code": const IconWrapper(
      iconData: Icons.qr_code, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons qr code 2": const IconWrapper(
      iconData: Icons.qr_code_2, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons qr code scanner": const IconWrapper(
      iconData: Icons.qr_code_scanner, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons query builder": const IconWrapper(
      iconData: Icons.query_builder, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons query stats": const IconWrapper(
      iconData: Icons.query_stats, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons question answer": const IconWrapper(
      iconData: Icons.question_answer, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons question mark": const IconWrapper(
      iconData: Icons.question_mark, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons queue": const IconWrapper(
      iconData: Icons.queue, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons queue music": const IconWrapper(
      iconData: Icons.queue_music, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons queue play next": const IconWrapper(
      iconData: Icons.queue_play_next, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons quick contacts dialer": const IconWrapper(
      iconData: Icons.quick_contacts_dialer,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons quick contacts mail": const IconWrapper(
      iconData: Icons.quick_contacts_mail,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons quickreply": const IconWrapper(
      iconData: Icons.quickreply, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons quiz": const IconWrapper(
      iconData: Icons.quiz, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons quora": const IconWrapper(
      iconData: Icons.quora, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons r mobiledata": const IconWrapper(
      iconData: Icons.r_mobiledata, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons radar": const IconWrapper(
      iconData: Icons.radar, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons radio": const IconWrapper(
      iconData: Icons.radio, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons radio button checked": const IconWrapper(
      iconData: Icons.radio_button_checked,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons radio button off": const IconWrapper(
      iconData: Icons.radio_button_off,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons radio button on": const IconWrapper(
      iconData: Icons.radio_button_on, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons radio button unchecked": const IconWrapper(
      iconData: Icons.radio_button_unchecked,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons railway alert": const IconWrapper(
      iconData: Icons.railway_alert, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons ramen dining": const IconWrapper(
      iconData: Icons.ramen_dining, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons ramp left": const IconWrapper(
      iconData: Icons.ramp_left, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons ramp right": const IconWrapper(
      iconData: Icons.ramp_right, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons rate review": const IconWrapper(
      iconData: Icons.rate_review, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons raw off": const IconWrapper(
      iconData: Icons.raw_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons raw on": const IconWrapper(
      iconData: Icons.raw_on, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons read more": const IconWrapper(
      iconData: Icons.read_more, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons real estate agent": const IconWrapper(
      iconData: Icons.real_estate_agent,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons rebase edit": const IconWrapper(
      iconData: Icons.rebase_edit, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons receipt": const IconWrapper(
      iconData: Icons.receipt, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons receipt long": const IconWrapper(
      iconData: Icons.receipt_long, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons recent actors": const IconWrapper(
      iconData: Icons.recent_actors, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons recommend": const IconWrapper(
      iconData: Icons.recommend, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons record voice over": const IconWrapper(
      iconData: Icons.record_voice_over,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons rectangle": const IconWrapper(
      iconData: Icons.rectangle, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons recycling": const IconWrapper(
      iconData: Icons.recycling, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons reddit": const IconWrapper(
      iconData: Icons.reddit, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons redeem": const IconWrapper(
      iconData: Icons.redeem, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons redo": const IconWrapper(
      iconData: Icons.redo, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons reduce capacity": const IconWrapper(
      iconData: Icons.reduce_capacity, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons refresh": const IconWrapper(
      iconData: Icons.refresh, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons remember me": const IconWrapper(
      iconData: Icons.remember_me, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons remove": const IconWrapper(
      iconData: Icons.remove, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons remove circle": const IconWrapper(
      iconData: Icons.remove_circle, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons remove done": const IconWrapper(
      iconData: Icons.remove_done, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons remove from queue": const IconWrapper(
      iconData: Icons.remove_from_queue,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons remove moderator": const IconWrapper(
      iconData: Icons.remove_moderator,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons remove red eye": const IconWrapper(
      iconData: Icons.remove_red_eye, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons remove road": const IconWrapper(
      iconData: Icons.remove_road, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons remove shopping cart": const IconWrapper(
      iconData: Icons.remove_shopping_cart,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons reorder": const IconWrapper(
      iconData: Icons.reorder, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons repartition": const IconWrapper(
      iconData: Icons.repartition, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons repeat": const IconWrapper(
      iconData: Icons.repeat, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons repeat on": const IconWrapper(
      iconData: Icons.repeat_on, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons repeat one": const IconWrapper(
      iconData: Icons.repeat_one, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons repeat one on": const IconWrapper(
      iconData: Icons.repeat_one_on, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons replay": const IconWrapper(
      iconData: Icons.replay, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons replay 5": const IconWrapper(
      iconData: Icons.replay_5, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons replay 10": const IconWrapper(
      iconData: Icons.replay_10, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons replay 30": const IconWrapper(
      iconData: Icons.replay_30, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons reply": const IconWrapper(
      iconData: Icons.reply, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons reply all": const IconWrapper(
      iconData: Icons.reply_all, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons report": const IconWrapper(
      iconData: Icons.report, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons report gmailerrorred": const IconWrapper(
      iconData: Icons.report_gmailerrorred,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons report off": const IconWrapper(
      iconData: Icons.report_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons report problem": const IconWrapper(
      iconData: Icons.report_problem, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons request page": const IconWrapper(
      iconData: Icons.request_page, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons request quote": const IconWrapper(
      iconData: Icons.request_quote, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons reset tv": const IconWrapper(
      iconData: Icons.reset_tv, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons restart alt": const IconWrapper(
      iconData: Icons.restart_alt, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons restaurant": const IconWrapper(
      iconData: Icons.restaurant, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons restaurant menu": const IconWrapper(
      iconData: Icons.restaurant_menu, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons restore": const IconWrapper(
      iconData: Icons.restore, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons restore from trash": const IconWrapper(
      iconData: Icons.restore_from_trash,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons restore page": const IconWrapper(
      iconData: Icons.restore_page, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons reviews": const IconWrapper(
      iconData: Icons.reviews, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons rice bowl": const IconWrapper(
      iconData: Icons.rice_bowl, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons ring volume": const IconWrapper(
      iconData: Icons.ring_volume, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons rocket": const IconWrapper(
      iconData: Icons.rocket, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons rocket launch": const IconWrapper(
      iconData: Icons.rocket_launch, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons roller shades": const IconWrapper(
      iconData: Icons.roller_shades, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons roller shades closed": const IconWrapper(
      iconData: Icons.roller_shades_closed,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons roller skating": const IconWrapper(
      iconData: Icons.roller_skating, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons roofing": const IconWrapper(
      iconData: Icons.roofing, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons room": const IconWrapper(
      iconData: Icons.room, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons room preferences": const IconWrapper(
      iconData: Icons.room_preferences,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons room service": const IconWrapper(
      iconData: Icons.room_service, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons rotate 90 degrees ccw": const IconWrapper(
      iconData: Icons.rotate_90_degrees_ccw,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons rotate 90 degrees cw": const IconWrapper(
      iconData: Icons.rotate_90_degrees_cw,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons rotate left": const IconWrapper(
      iconData: Icons.rotate_left, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons rotate right": const IconWrapper(
      iconData: Icons.rotate_right, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons roundabout left": const IconWrapper(
      iconData: Icons.roundabout_left, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons roundabout right": const IconWrapper(
      iconData: Icons.roundabout_right,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons route": const IconWrapper(
      iconData: Icons.route, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons router": const IconWrapper(
      iconData: Icons.router, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons rowing": const IconWrapper(
      iconData: Icons.rowing, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons rss feed": const IconWrapper(
      iconData: Icons.rss_feed, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons rsvp": const IconWrapper(
      iconData: Icons.rsvp, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons rtt": const IconWrapper(
      iconData: Icons.rtt, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons rule": const IconWrapper(
      iconData: Icons.rule, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons rule folder": const IconWrapper(
      iconData: Icons.rule_folder, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons run circle": const IconWrapper(
      iconData: Icons.run_circle, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons running with errors": const IconWrapper(
      iconData: Icons.running_with_errors,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons rv hookup": const IconWrapper(
      iconData: Icons.rv_hookup, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons safety check": const IconWrapper(
      iconData: Icons.safety_check, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons safety divider": const IconWrapper(
      iconData: Icons.safety_divider, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sailing": const IconWrapper(
      iconData: Icons.sailing, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sanitizer": const IconWrapper(
      iconData: Icons.sanitizer, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons satellite": const IconWrapper(
      iconData: Icons.satellite, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons satellite alt": const IconWrapper(
      iconData: Icons.satellite_alt, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons save": const IconWrapper(
      iconData: Icons.save, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons save alt": const IconWrapper(
      iconData: Icons.save_alt, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons save as": const IconWrapper(
      iconData: Icons.save_as, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons saved search": const IconWrapper(
      iconData: Icons.saved_search, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons savings": const IconWrapper(
      iconData: Icons.savings, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons scale": const IconWrapper(
      iconData: Icons.scale, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons scanner": const IconWrapper(
      iconData: Icons.scanner, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons scatter plot": const IconWrapper(
      iconData: Icons.scatter_plot, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons schedule": const IconWrapper(
      iconData: Icons.schedule, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons schedule send": const IconWrapper(
      iconData: Icons.schedule_send, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons schema": const IconWrapper(
      iconData: Icons.schema, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons school": const IconWrapper(
      iconData: Icons.school, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons science": const IconWrapper(
      iconData: Icons.science, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons score": const IconWrapper(
      iconData: Icons.score, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons scoreboard": const IconWrapper(
      iconData: Icons.scoreboard, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons screen lock landscape": const IconWrapper(
      iconData: Icons.screen_lock_landscape,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons screen lock portrait": const IconWrapper(
      iconData: Icons.screen_lock_portrait,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons screen lock rotation": const IconWrapper(
      iconData: Icons.screen_lock_rotation,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons screen rotation": const IconWrapper(
      iconData: Icons.screen_rotation, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons screen rotation alt": const IconWrapper(
      iconData: Icons.screen_rotation_alt,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons screen search desktop": const IconWrapper(
      iconData: Icons.screen_search_desktop,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons screen share": const IconWrapper(
      iconData: Icons.screen_share, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons screenshot": const IconWrapper(
      iconData: Icons.screenshot, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons screenshot monitor": const IconWrapper(
      iconData: Icons.screenshot_monitor,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons scuba diving": const IconWrapper(
      iconData: Icons.scuba_diving, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sd": const IconWrapper(
      iconData: Icons.sd, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sd card": const IconWrapper(
      iconData: Icons.sd_card, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sd card alert": const IconWrapper(
      iconData: Icons.sd_card_alert, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sd storage": const IconWrapper(
      iconData: Icons.sd_storage, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons search": const IconWrapper(
      iconData: Icons.search, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons search off": const IconWrapper(
      iconData: Icons.search_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons security": const IconWrapper(
      iconData: Icons.security, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons security update": const IconWrapper(
      iconData: Icons.security_update, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons security update good": const IconWrapper(
      iconData: Icons.security_update_good,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons security update warning": const IconWrapper(
      iconData: Icons.security_update_warning,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons segment": const IconWrapper(
      iconData: Icons.segment, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons select all": const IconWrapper(
      iconData: Icons.select_all, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons self improvement": const IconWrapper(
      iconData: Icons.self_improvement,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sell": const IconWrapper(
      iconData: Icons.sell, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons send": const IconWrapper(
      iconData: Icons.send, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons send and archive": const IconWrapper(
      iconData: Icons.send_and_archive,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons send time extension": const IconWrapper(
      iconData: Icons.send_time_extension,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons send to mobile": const IconWrapper(
      iconData: Icons.send_to_mobile, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sensor door": const IconWrapper(
      iconData: Icons.sensor_door, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sensor occupied": const IconWrapper(
      iconData: Icons.sensor_occupied, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sensor window": const IconWrapper(
      iconData: Icons.sensor_window, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sensors": const IconWrapper(
      iconData: Icons.sensors, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sensors off": const IconWrapper(
      iconData: Icons.sensors_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sentiment dissatisfied": const IconWrapper(
      iconData: Icons.sentiment_dissatisfied,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sentiment neutral": const IconWrapper(
      iconData: Icons.sentiment_neutral,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sentiment satisfied": const IconWrapper(
      iconData: Icons.sentiment_satisfied,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sentiment satisfied alt": const IconWrapper(
      iconData: Icons.sentiment_satisfied_alt,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sentiment very dissatisfied": const IconWrapper(
      iconData: Icons.sentiment_very_dissatisfied,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sentiment very satisfied": const IconWrapper(
      iconData: Icons.sentiment_very_satisfied,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons set meal": const IconWrapper(
      iconData: Icons.set_meal, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons settings": const IconWrapper(
      iconData: Icons.settings, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons settings accessibility": const IconWrapper(
      iconData: Icons.settings_accessibility,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons settings applications": const IconWrapper(
      iconData: Icons.settings_applications,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons settings backup restore": const IconWrapper(
      iconData: Icons.settings_backup_restore,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons settings bluetooth": const IconWrapper(
      iconData: Icons.settings_bluetooth,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons settings brightness": const IconWrapper(
      iconData: Icons.settings_brightness,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons settings cell": const IconWrapper(
      iconData: Icons.settings_cell, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons settings display": const IconWrapper(
      iconData: Icons.settings_display,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons settings ethernet": const IconWrapper(
      iconData: Icons.settings_ethernet,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons settings input antenna": const IconWrapper(
      iconData: Icons.settings_input_antenna,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons settings input component": const IconWrapper(
      iconData: Icons.settings_input_component,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons settings input composite": const IconWrapper(
      iconData: Icons.settings_input_composite,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons settings input hdmi": const IconWrapper(
      iconData: Icons.settings_input_hdmi,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons settings input svideo": const IconWrapper(
      iconData: Icons.settings_input_svideo,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons settings overscan": const IconWrapper(
      iconData: Icons.settings_overscan,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons settings phone": const IconWrapper(
      iconData: Icons.settings_phone, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons settings power": const IconWrapper(
      iconData: Icons.settings_power, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons settings remote": const IconWrapper(
      iconData: Icons.settings_remote, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons settings suggest": const IconWrapper(
      iconData: Icons.settings_suggest,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons settings system daydream": const IconWrapper(
      iconData: Icons.settings_system_daydream,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons settings voice": const IconWrapper(
      iconData: Icons.settings_voice, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons seven k": const IconWrapper(
      iconData: Icons.seven_k, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons seven k plus": const IconWrapper(
      iconData: Icons.seven_k_plus, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons seven mp": const IconWrapper(
      iconData: Icons.seven_mp, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons seventeen mp": const IconWrapper(
      iconData: Icons.seventeen_mp, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons severe cold": const IconWrapper(
      iconData: Icons.severe_cold, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons shape line": const IconWrapper(
      iconData: Icons.shape_line, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons share": const IconWrapper(
      iconData: Icons.share, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons share arrival time": const IconWrapper(
      iconData: Icons.share_arrival_time,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons share location": const IconWrapper(
      iconData: Icons.share_location, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons shelves": const IconWrapper(
      iconData: Icons.shelves, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons shield": const IconWrapper(
      iconData: Icons.shield, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons shield moon": const IconWrapper(
      iconData: Icons.shield_moon, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons shop": const IconWrapper(
      iconData: Icons.shop, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons shop 2": const IconWrapper(
      iconData: Icons.shop_2, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons shop two": const IconWrapper(
      iconData: Icons.shop_two, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons shopify": const IconWrapper(
      iconData: Icons.shopify, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons shopping bag": const IconWrapper(
      iconData: Icons.shopping_bag, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons shopping basket": const IconWrapper(
      iconData: Icons.shopping_basket, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons shopping cart": const IconWrapper(
      iconData: Icons.shopping_cart, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons shopping cart checkout": const IconWrapper(
      iconData: Icons.shopping_cart_checkout,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons short text": const IconWrapper(
      iconData: Icons.short_text, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons shortcut": const IconWrapper(
      iconData: Icons.shortcut, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons show chart": const IconWrapper(
      iconData: Icons.show_chart, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons shower": const IconWrapper(
      iconData: Icons.shower, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons shuffle": const IconWrapper(
      iconData: Icons.shuffle, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons shuffle on": const IconWrapper(
      iconData: Icons.shuffle_on, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons shutter speed": const IconWrapper(
      iconData: Icons.shutter_speed, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sick": const IconWrapper(
      iconData: Icons.sick, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sign language": const IconWrapper(
      iconData: Icons.sign_language, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons signal cellular 0 bar": const IconWrapper(
      iconData: Icons.signal_cellular_0_bar,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons signal cellular 4 bar": const IconWrapper(
      iconData: Icons.signal_cellular_4_bar,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons signal cellular alt": const IconWrapper(
      iconData: Icons.signal_cellular_alt,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons signal cellular alt 1 bar": const IconWrapper(
      iconData: Icons.signal_cellular_alt_1_bar,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons signal cellular alt 2 bar": const IconWrapper(
      iconData: Icons.signal_cellular_alt_2_bar,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons signal cellular connected no internet 0 bar":
      const IconWrapper(
          iconData: Icons.signal_cellular_connected_no_internet_0_bar,
          iconDataType: IconDataType.flutterIcons),
  "MaterialIcons signal cellular connected no internet 4 bar":
      const IconWrapper(
          iconData: Icons.signal_cellular_connected_no_internet_4_bar,
          iconDataType: IconDataType.flutterIcons),
  "MaterialIcons signal cellular no sim": const IconWrapper(
      iconData: Icons.signal_cellular_no_sim,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons signal cellular nodata": const IconWrapper(
      iconData: Icons.signal_cellular_nodata,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons signal cellular null": const IconWrapper(
      iconData: Icons.signal_cellular_null,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons signal cellular off": const IconWrapper(
      iconData: Icons.signal_cellular_off,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons signal wifi 0 bar": const IconWrapper(
      iconData: Icons.signal_wifi_0_bar,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons signal wifi 4 bar": const IconWrapper(
      iconData: Icons.signal_wifi_4_bar,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons signal wifi 4 bar lock": const IconWrapper(
      iconData: Icons.signal_wifi_4_bar_lock,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons signal wifi bad": const IconWrapper(
      iconData: Icons.signal_wifi_bad, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons signal wifi connected no internet 4": const IconWrapper(
      iconData: Icons.signal_wifi_connected_no_internet_4,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons signal wifi off": const IconWrapper(
      iconData: Icons.signal_wifi_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons signal wifi statusbar 4 bar": const IconWrapper(
      iconData: Icons.signal_wifi_statusbar_4_bar,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons signal wifi statusbar connected no internet 4":
      const IconWrapper(
          iconData: Icons.signal_wifi_statusbar_connected_no_internet_4,
          iconDataType: IconDataType.flutterIcons),
  "MaterialIcons signal wifi statusbar null": const IconWrapper(
      iconData: Icons.signal_wifi_statusbar_null,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons signpost": const IconWrapper(
      iconData: Icons.signpost, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sim card": const IconWrapper(
      iconData: Icons.sim_card, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sim card alert": const IconWrapper(
      iconData: Icons.sim_card_alert, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sim card download": const IconWrapper(
      iconData: Icons.sim_card_download,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons single bed": const IconWrapper(
      iconData: Icons.single_bed, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sip": const IconWrapper(
      iconData: Icons.sip, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons six ft apart": const IconWrapper(
      iconData: Icons.six_ft_apart, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons six k": const IconWrapper(
      iconData: Icons.six_k, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons six k plus": const IconWrapper(
      iconData: Icons.six_k_plus, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons six mp": const IconWrapper(
      iconData: Icons.six_mp, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sixteen mp": const IconWrapper(
      iconData: Icons.sixteen_mp, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sixty fps": const IconWrapper(
      iconData: Icons.sixty_fps, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sixty fps select": const IconWrapper(
      iconData: Icons.sixty_fps_select,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons skateboarding": const IconWrapper(
      iconData: Icons.skateboarding, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons skip next": const IconWrapper(
      iconData: Icons.skip_next, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons skip previous": const IconWrapper(
      iconData: Icons.skip_previous, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sledding": const IconWrapper(
      iconData: Icons.sledding, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons slideshow": const IconWrapper(
      iconData: Icons.slideshow, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons slow motion video": const IconWrapper(
      iconData: Icons.slow_motion_video,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons smart button": const IconWrapper(
      iconData: Icons.smart_button, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons smart display": const IconWrapper(
      iconData: Icons.smart_display, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons smart screen": const IconWrapper(
      iconData: Icons.smart_screen, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons smart toy": const IconWrapper(
      iconData: Icons.smart_toy, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons smartphone": const IconWrapper(
      iconData: Icons.smartphone, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons smoke free": const IconWrapper(
      iconData: Icons.smoke_free, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons smoking rooms": const IconWrapper(
      iconData: Icons.smoking_rooms, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sms": const IconWrapper(
      iconData: Icons.sms, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sms failed": const IconWrapper(
      iconData: Icons.sms_failed, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons snapchat": const IconWrapper(
      iconData: Icons.snapchat, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons snippet folder": const IconWrapper(
      iconData: Icons.snippet_folder, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons snooze": const IconWrapper(
      iconData: Icons.snooze, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons snowboarding": const IconWrapper(
      iconData: Icons.snowboarding, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons snowing": const IconWrapper(
      iconData: Icons.snowing, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons snowmobile": const IconWrapper(
      iconData: Icons.snowmobile, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons snowshoeing": const IconWrapper(
      iconData: Icons.snowshoeing, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons soap": const IconWrapper(
      iconData: Icons.soap, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons social distance": const IconWrapper(
      iconData: Icons.social_distance, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons solar power": const IconWrapper(
      iconData: Icons.solar_power, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sort": const IconWrapper(
      iconData: Icons.sort, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sort by alpha": const IconWrapper(
      iconData: Icons.sort_by_alpha, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sos": const IconWrapper(
      iconData: Icons.sos, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons soup kitchen": const IconWrapper(
      iconData: Icons.soup_kitchen, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons source": const IconWrapper(
      iconData: Icons.source, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons south": const IconWrapper(
      iconData: Icons.south, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons south america": const IconWrapper(
      iconData: Icons.south_america, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons south east": const IconWrapper(
      iconData: Icons.south_east, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons south west": const IconWrapper(
      iconData: Icons.south_west, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons spa": const IconWrapper(
      iconData: Icons.spa, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons space bar": const IconWrapper(
      iconData: Icons.space_bar, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons space dashboard": const IconWrapper(
      iconData: Icons.space_dashboard, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons spatial audio": const IconWrapper(
      iconData: Icons.spatial_audio, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons spatial audio off": const IconWrapper(
      iconData: Icons.spatial_audio_off,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons spatial tracking": const IconWrapper(
      iconData: Icons.spatial_tracking,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons speaker": const IconWrapper(
      iconData: Icons.speaker, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons speaker group": const IconWrapper(
      iconData: Icons.speaker_group, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons speaker notes": const IconWrapper(
      iconData: Icons.speaker_notes, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons speaker notes off": const IconWrapper(
      iconData: Icons.speaker_notes_off,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons speaker phone": const IconWrapper(
      iconData: Icons.speaker_phone, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons speed": const IconWrapper(
      iconData: Icons.speed, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons spellcheck": const IconWrapper(
      iconData: Icons.spellcheck, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons splitscreen": const IconWrapper(
      iconData: Icons.splitscreen, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons spoke": const IconWrapper(
      iconData: Icons.spoke, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sports": const IconWrapper(
      iconData: Icons.sports, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sports bar": const IconWrapper(
      iconData: Icons.sports_bar, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sports baseball": const IconWrapper(
      iconData: Icons.sports_baseball, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sports basketball": const IconWrapper(
      iconData: Icons.sports_basketball,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sports cricket": const IconWrapper(
      iconData: Icons.sports_cricket, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sports esports": const IconWrapper(
      iconData: Icons.sports_esports, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sports football": const IconWrapper(
      iconData: Icons.sports_football, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sports golf": const IconWrapper(
      iconData: Icons.sports_golf, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sports gymnastics": const IconWrapper(
      iconData: Icons.sports_gymnastics,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sports handball": const IconWrapper(
      iconData: Icons.sports_handball, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sports hockey": const IconWrapper(
      iconData: Icons.sports_hockey, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sports kabaddi": const IconWrapper(
      iconData: Icons.sports_kabaddi, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sports martial arts": const IconWrapper(
      iconData: Icons.sports_martial_arts,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sports mma": const IconWrapper(
      iconData: Icons.sports_mma, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sports motorsports": const IconWrapper(
      iconData: Icons.sports_motorsports,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sports rugby": const IconWrapper(
      iconData: Icons.sports_rugby, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sports score": const IconWrapper(
      iconData: Icons.sports_score, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sports soccer": const IconWrapper(
      iconData: Icons.sports_soccer, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sports tennis": const IconWrapper(
      iconData: Icons.sports_tennis, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sports volleyball": const IconWrapper(
      iconData: Icons.sports_volleyball,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons square": const IconWrapper(
      iconData: Icons.square, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons square foot": const IconWrapper(
      iconData: Icons.square_foot, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons ssid chart": const IconWrapper(
      iconData: Icons.ssid_chart, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons stacked bar chart": const IconWrapper(
      iconData: Icons.stacked_bar_chart,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons stacked line chart": const IconWrapper(
      iconData: Icons.stacked_line_chart,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons stadium": const IconWrapper(
      iconData: Icons.stadium, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons stairs": const IconWrapper(
      iconData: Icons.stairs, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons star": const IconWrapper(
      iconData: Icons.star, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons star border": const IconWrapper(
      iconData: Icons.star_border, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons star border purple500": const IconWrapper(
      iconData: Icons.star_border_purple500,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons star half": const IconWrapper(
      iconData: Icons.star_half, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons star purple500": const IconWrapper(
      iconData: Icons.star_purple500, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons star rate": const IconWrapper(
      iconData: Icons.star_rate, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons stars": const IconWrapper(
      iconData: Icons.stars, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons start": const IconWrapper(
      iconData: Icons.start, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons stay current landscape": const IconWrapper(
      iconData: Icons.stay_current_landscape,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons stay current portrait": const IconWrapper(
      iconData: Icons.stay_current_portrait,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons stay primary landscape": const IconWrapper(
      iconData: Icons.stay_primary_landscape,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons stay primary portrait": const IconWrapper(
      iconData: Icons.stay_primary_portrait,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sticky note 2": const IconWrapper(
      iconData: Icons.sticky_note_2, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons stop": const IconWrapper(
      iconData: Icons.stop, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons stop circle": const IconWrapper(
      iconData: Icons.stop_circle, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons stop screen share": const IconWrapper(
      iconData: Icons.stop_screen_share,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons storage": const IconWrapper(
      iconData: Icons.storage, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons store": const IconWrapper(
      iconData: Icons.store, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons store mall directory": const IconWrapper(
      iconData: Icons.store_mall_directory,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons storefront": const IconWrapper(
      iconData: Icons.storefront, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons storm": const IconWrapper(
      iconData: Icons.storm, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons straight": const IconWrapper(
      iconData: Icons.straight, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons straighten": const IconWrapper(
      iconData: Icons.straighten, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons stream": const IconWrapper(
      iconData: Icons.stream, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons streetview": const IconWrapper(
      iconData: Icons.streetview, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons strikethrough s": const IconWrapper(
      iconData: Icons.strikethrough_s, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons stroller": const IconWrapper(
      iconData: Icons.stroller, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons style": const IconWrapper(
      iconData: Icons.style, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons subdirectory arrow left": const IconWrapper(
      iconData: Icons.subdirectory_arrow_left,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons subdirectory arrow right": const IconWrapper(
      iconData: Icons.subdirectory_arrow_right,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons subject": const IconWrapper(
      iconData: Icons.subject, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons subscript": const IconWrapper(
      iconData: Icons.subscript, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons subscriptions": const IconWrapper(
      iconData: Icons.subscriptions, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons subtitles": const IconWrapper(
      iconData: Icons.subtitles, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons subtitles off": const IconWrapper(
      iconData: Icons.subtitles_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons subway": const IconWrapper(
      iconData: Icons.subway, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons summarize": const IconWrapper(
      iconData: Icons.summarize, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sunny": const IconWrapper(
      iconData: Icons.sunny, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sunny snowing": const IconWrapper(
      iconData: Icons.sunny_snowing, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons superscript": const IconWrapper(
      iconData: Icons.superscript, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons supervised user circle": const IconWrapper(
      iconData: Icons.supervised_user_circle,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons supervisor account": const IconWrapper(
      iconData: Icons.supervisor_account,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons support": const IconWrapper(
      iconData: Icons.support, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons support agent": const IconWrapper(
      iconData: Icons.support_agent, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons surfing": const IconWrapper(
      iconData: Icons.surfing, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons surround sound": const IconWrapper(
      iconData: Icons.surround_sound, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons swap calls": const IconWrapper(
      iconData: Icons.swap_calls, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons swap horiz": const IconWrapper(
      iconData: Icons.swap_horiz, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons swap horizontal circle": const IconWrapper(
      iconData: Icons.swap_horizontal_circle,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons swap vert": const IconWrapper(
      iconData: Icons.swap_vert, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons swap vert circle": const IconWrapper(
      iconData: Icons.swap_vert_circle,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons swap vertical circle": const IconWrapper(
      iconData: Icons.swap_vertical_circle,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons swipe": const IconWrapper(
      iconData: Icons.swipe, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons swipe down": const IconWrapper(
      iconData: Icons.swipe_down, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons swipe down alt": const IconWrapper(
      iconData: Icons.swipe_down_alt, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons swipe left": const IconWrapper(
      iconData: Icons.swipe_left, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons swipe left alt": const IconWrapper(
      iconData: Icons.swipe_left_alt, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons swipe right": const IconWrapper(
      iconData: Icons.swipe_right, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons swipe right alt": const IconWrapper(
      iconData: Icons.swipe_right_alt, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons swipe up": const IconWrapper(
      iconData: Icons.swipe_up, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons swipe up alt": const IconWrapper(
      iconData: Icons.swipe_up_alt, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons swipe vertical": const IconWrapper(
      iconData: Icons.swipe_vertical, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons switch access shortcut": const IconWrapper(
      iconData: Icons.switch_access_shortcut,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons switch access shortcut add": const IconWrapper(
      iconData: Icons.switch_access_shortcut_add,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons switch account": const IconWrapper(
      iconData: Icons.switch_account, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons switch camera": const IconWrapper(
      iconData: Icons.switch_camera, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons switch left": const IconWrapper(
      iconData: Icons.switch_left, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons switch right": const IconWrapper(
      iconData: Icons.switch_right, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons switch video": const IconWrapper(
      iconData: Icons.switch_video, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons synagogue": const IconWrapper(
      iconData: Icons.synagogue, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sync": const IconWrapper(
      iconData: Icons.sync, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sync alt": const IconWrapper(
      iconData: Icons.sync_alt, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sync disabled": const IconWrapper(
      iconData: Icons.sync_disabled, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sync lock": const IconWrapper(
      iconData: Icons.sync_lock, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons sync problem": const IconWrapper(
      iconData: Icons.sync_problem, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons system security update": const IconWrapper(
      iconData: Icons.system_security_update,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons system security update good": const IconWrapper(
      iconData: Icons.system_security_update_good,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons system security update warning": const IconWrapper(
      iconData: Icons.system_security_update_warning,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons system update": const IconWrapper(
      iconData: Icons.system_update, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons system update alt": const IconWrapper(
      iconData: Icons.system_update_alt,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons system update tv": const IconWrapper(
      iconData: Icons.system_update_tv,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons tab": const IconWrapper(
      iconData: Icons.tab, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons tab unselected": const IconWrapper(
      iconData: Icons.tab_unselected, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons table bar": const IconWrapper(
      iconData: Icons.table_bar, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons table chart": const IconWrapper(
      iconData: Icons.table_chart, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons table restaurant": const IconWrapper(
      iconData: Icons.table_restaurant,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons table rows": const IconWrapper(
      iconData: Icons.table_rows, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons table view": const IconWrapper(
      iconData: Icons.table_view, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons tablet": const IconWrapper(
      iconData: Icons.tablet, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons tablet android": const IconWrapper(
      iconData: Icons.tablet_android, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons tablet mac": const IconWrapper(
      iconData: Icons.tablet_mac, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons tag": const IconWrapper(
      iconData: Icons.tag, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons tag faces": const IconWrapper(
      iconData: Icons.tag_faces, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons takeout dining": const IconWrapper(
      iconData: Icons.takeout_dining, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons tap and play": const IconWrapper(
      iconData: Icons.tap_and_play, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons tapas": const IconWrapper(
      iconData: Icons.tapas, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons task": const IconWrapper(
      iconData: Icons.task, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons task alt": const IconWrapper(
      iconData: Icons.task_alt, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons taxi alert": const IconWrapper(
      iconData: Icons.taxi_alert, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons telegram": const IconWrapper(
      iconData: Icons.telegram, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons temple buddhist": const IconWrapper(
      iconData: Icons.temple_buddhist, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons temple hindu": const IconWrapper(
      iconData: Icons.temple_hindu, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons ten k": const IconWrapper(
      iconData: Icons.ten_k, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons ten mp": const IconWrapper(
      iconData: Icons.ten_mp, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons terminal": const IconWrapper(
      iconData: Icons.terminal, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons terrain": const IconWrapper(
      iconData: Icons.terrain, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons text decrease": const IconWrapper(
      iconData: Icons.text_decrease, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons text fields": const IconWrapper(
      iconData: Icons.text_fields, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons text format": const IconWrapper(
      iconData: Icons.text_format, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons text increase": const IconWrapper(
      iconData: Icons.text_increase, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons text rotate up": const IconWrapper(
      iconData: Icons.text_rotate_up, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons text rotate vertical": const IconWrapper(
      iconData: Icons.text_rotate_vertical,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons text rotation angledown": const IconWrapper(
      iconData: Icons.text_rotation_angledown,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons text rotation angleup": const IconWrapper(
      iconData: Icons.text_rotation_angleup,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons text rotation down": const IconWrapper(
      iconData: Icons.text_rotation_down,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons text rotation none": const IconWrapper(
      iconData: Icons.text_rotation_none,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons text snippet": const IconWrapper(
      iconData: Icons.text_snippet, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons textsms": const IconWrapper(
      iconData: Icons.textsms, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons texture": const IconWrapper(
      iconData: Icons.texture, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons theater comedy": const IconWrapper(
      iconData: Icons.theater_comedy, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons theaters": const IconWrapper(
      iconData: Icons.theaters, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons thermostat": const IconWrapper(
      iconData: Icons.thermostat, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons thermostat auto": const IconWrapper(
      iconData: Icons.thermostat_auto, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons thirteen mp": const IconWrapper(
      iconData: Icons.thirteen_mp, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons thirty fps": const IconWrapper(
      iconData: Icons.thirty_fps, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons thirty fps select": const IconWrapper(
      iconData: Icons.thirty_fps_select,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons three g mobiledata": const IconWrapper(
      iconData: Icons.three_g_mobiledata,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons three k": const IconWrapper(
      iconData: Icons.three_k, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons three k plus": const IconWrapper(
      iconData: Icons.three_k_plus, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons three mp": const IconWrapper(
      iconData: Icons.three_mp, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons three p": const IconWrapper(
      iconData: Icons.three_p, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons threed rotation": const IconWrapper(
      iconData: Icons.threed_rotation, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons threesixty": const IconWrapper(
      iconData: Icons.threesixty, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons thumb down": const IconWrapper(
      iconData: Icons.thumb_down, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons thumb down alt": const IconWrapper(
      iconData: Icons.thumb_down_alt, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons thumb down off alt": const IconWrapper(
      iconData: Icons.thumb_down_off_alt,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons thumb up": const IconWrapper(
      iconData: Icons.thumb_up, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons thumb up alt": const IconWrapper(
      iconData: Icons.thumb_up_alt, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons thumb up off alt": const IconWrapper(
      iconData: Icons.thumb_up_off_alt,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons thumbs up down": const IconWrapper(
      iconData: Icons.thumbs_up_down, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons thunderstorm": const IconWrapper(
      iconData: Icons.thunderstorm, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons tiktok": const IconWrapper(
      iconData: Icons.tiktok, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons time to leave": const IconWrapper(
      iconData: Icons.time_to_leave, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons timelapse": const IconWrapper(
      iconData: Icons.timelapse, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons timeline": const IconWrapper(
      iconData: Icons.timeline, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons timer": const IconWrapper(
      iconData: Icons.timer, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons timer 3": const IconWrapper(
      iconData: Icons.timer_3, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons timer 3 select": const IconWrapper(
      iconData: Icons.timer_3_select, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons timer 10": const IconWrapper(
      iconData: Icons.timer_10, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons timer 10 select": const IconWrapper(
      iconData: Icons.timer_10_select, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons timer off": const IconWrapper(
      iconData: Icons.timer_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons tips and updates": const IconWrapper(
      iconData: Icons.tips_and_updates,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons tire repair": const IconWrapper(
      iconData: Icons.tire_repair, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons title": const IconWrapper(
      iconData: Icons.title, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons toc": const IconWrapper(
      iconData: Icons.toc, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons today": const IconWrapper(
      iconData: Icons.today, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons toggle off": const IconWrapper(
      iconData: Icons.toggle_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons toggle on": const IconWrapper(
      iconData: Icons.toggle_on, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons token": const IconWrapper(
      iconData: Icons.token, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons toll": const IconWrapper(
      iconData: Icons.toll, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons tonality": const IconWrapper(
      iconData: Icons.tonality, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons topic": const IconWrapper(
      iconData: Icons.topic, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons tornado": const IconWrapper(
      iconData: Icons.tornado, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons touch app": const IconWrapper(
      iconData: Icons.touch_app, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons tour": const IconWrapper(
      iconData: Icons.tour, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons toys": const IconWrapper(
      iconData: Icons.toys, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons track changes": const IconWrapper(
      iconData: Icons.track_changes, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons traffic": const IconWrapper(
      iconData: Icons.traffic, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons train": const IconWrapper(
      iconData: Icons.train, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons tram": const IconWrapper(
      iconData: Icons.tram, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons transcribe": const IconWrapper(
      iconData: Icons.transcribe, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons transfer within a station": const IconWrapper(
      iconData: Icons.transfer_within_a_station,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons transform": const IconWrapper(
      iconData: Icons.transform, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons transgender": const IconWrapper(
      iconData: Icons.transgender, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons transit enterexit": const IconWrapper(
      iconData: Icons.transit_enterexit,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons translate": const IconWrapper(
      iconData: Icons.translate, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons travel explore": const IconWrapper(
      iconData: Icons.travel_explore, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons trending down": const IconWrapper(
      iconData: Icons.trending_down, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons trending flat": const IconWrapper(
      iconData: Icons.trending_flat, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons trending neutral": const IconWrapper(
      iconData: Icons.trending_neutral,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons trending up": const IconWrapper(
      iconData: Icons.trending_up, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons trip origin": const IconWrapper(
      iconData: Icons.trip_origin, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons trolley": const IconWrapper(
      iconData: Icons.trolley, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons troubleshoot": const IconWrapper(
      iconData: Icons.troubleshoot, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons try sms star": const IconWrapper(
      iconData: Icons.try_sms_star, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons tsunami": const IconWrapper(
      iconData: Icons.tsunami, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons tty": const IconWrapper(
      iconData: Icons.tty, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons tune": const IconWrapper(
      iconData: Icons.tune, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons tungsten": const IconWrapper(
      iconData: Icons.tungsten, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons turn left": const IconWrapper(
      iconData: Icons.turn_left, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons turn right": const IconWrapper(
      iconData: Icons.turn_right, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons turn slight left": const IconWrapper(
      iconData: Icons.turn_slight_left,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons turn slight right": const IconWrapper(
      iconData: Icons.turn_slight_right,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons turned in": const IconWrapper(
      iconData: Icons.turned_in, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons turned in not": const IconWrapper(
      iconData: Icons.turned_in_not, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons tv": const IconWrapper(
      iconData: Icons.tv, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons tv off": const IconWrapper(
      iconData: Icons.tv_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons twelve mp": const IconWrapper(
      iconData: Icons.twelve_mp, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons twenty four mp": const IconWrapper(
      iconData: Icons.twenty_four_mp, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons twenty mp": const IconWrapper(
      iconData: Icons.twenty_mp, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons twenty one mp": const IconWrapper(
      iconData: Icons.twenty_one_mp, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons twenty three mp": const IconWrapper(
      iconData: Icons.twenty_three_mp, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons twenty two mp": const IconWrapper(
      iconData: Icons.twenty_two_mp, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons two k": const IconWrapper(
      iconData: Icons.two_k, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons two k plus": const IconWrapper(
      iconData: Icons.two_k_plus, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons two mp": const IconWrapper(
      iconData: Icons.two_mp, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons two wheeler": const IconWrapper(
      iconData: Icons.two_wheeler, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons type specimen": const IconWrapper(
      iconData: Icons.type_specimen, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons u turn left": const IconWrapper(
      iconData: Icons.u_turn_left, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons u turn right": const IconWrapper(
      iconData: Icons.u_turn_right, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons umbrella": const IconWrapper(
      iconData: Icons.umbrella, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons unarchive": const IconWrapper(
      iconData: Icons.unarchive, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons undo": const IconWrapper(
      iconData: Icons.undo, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons unfold less": const IconWrapper(
      iconData: Icons.unfold_less, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons unfold less double": const IconWrapper(
      iconData: Icons.unfold_less_double,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons unfold more": const IconWrapper(
      iconData: Icons.unfold_more, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons unfold more double": const IconWrapper(
      iconData: Icons.unfold_more_double,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons unpublished": const IconWrapper(
      iconData: Icons.unpublished, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons unsubscribe": const IconWrapper(
      iconData: Icons.unsubscribe, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons upcoming": const IconWrapper(
      iconData: Icons.upcoming, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons update": const IconWrapper(
      iconData: Icons.update, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons update disabled": const IconWrapper(
      iconData: Icons.update_disabled, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons upgrade": const IconWrapper(
      iconData: Icons.upgrade, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons upload": const IconWrapper(
      iconData: Icons.upload, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons upload file": const IconWrapper(
      iconData: Icons.upload_file, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons usb": const IconWrapper(
      iconData: Icons.usb, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons usb off": const IconWrapper(
      iconData: Icons.usb_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons vaccines": const IconWrapper(
      iconData: Icons.vaccines, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons vape free": const IconWrapper(
      iconData: Icons.vape_free, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons vaping rooms": const IconWrapper(
      iconData: Icons.vaping_rooms, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons verified": const IconWrapper(
      iconData: Icons.verified, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons verified user": const IconWrapper(
      iconData: Icons.verified_user, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons vertical align bottom": const IconWrapper(
      iconData: Icons.vertical_align_bottom,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons vertical align center": const IconWrapper(
      iconData: Icons.vertical_align_center,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons vertical align top": const IconWrapper(
      iconData: Icons.vertical_align_top,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons vertical distribute": const IconWrapper(
      iconData: Icons.vertical_distribute,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons vertical shades": const IconWrapper(
      iconData: Icons.vertical_shades, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons vertical shades closed": const IconWrapper(
      iconData: Icons.vertical_shades_closed,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons vertical split": const IconWrapper(
      iconData: Icons.vertical_split, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons vibration": const IconWrapper(
      iconData: Icons.vibration, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons video call": const IconWrapper(
      iconData: Icons.video_call, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons video camera back": const IconWrapper(
      iconData: Icons.video_camera_back,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons video camera front": const IconWrapper(
      iconData: Icons.video_camera_front,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons video chat": const IconWrapper(
      iconData: Icons.video_chat, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons video collection": const IconWrapper(
      iconData: Icons.video_collection,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons video file": const IconWrapper(
      iconData: Icons.video_file, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons video label": const IconWrapper(
      iconData: Icons.video_label, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons video library": const IconWrapper(
      iconData: Icons.video_library, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons video settings": const IconWrapper(
      iconData: Icons.video_settings, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons video stable": const IconWrapper(
      iconData: Icons.video_stable, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons videocam": const IconWrapper(
      iconData: Icons.videocam, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons videocam off": const IconWrapper(
      iconData: Icons.videocam_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons videogame asset": const IconWrapper(
      iconData: Icons.videogame_asset, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons videogame asset off": const IconWrapper(
      iconData: Icons.videogame_asset_off,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons view agenda": const IconWrapper(
      iconData: Icons.view_agenda, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons view array": const IconWrapper(
      iconData: Icons.view_array, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons view carousel": const IconWrapper(
      iconData: Icons.view_carousel, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons view column": const IconWrapper(
      iconData: Icons.view_column, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons view comfortable": const IconWrapper(
      iconData: Icons.view_comfortable,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons view comfy": const IconWrapper(
      iconData: Icons.view_comfy, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons view comfy alt": const IconWrapper(
      iconData: Icons.view_comfy_alt, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons view compact": const IconWrapper(
      iconData: Icons.view_compact, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons view compact alt": const IconWrapper(
      iconData: Icons.view_compact_alt,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons view cozy": const IconWrapper(
      iconData: Icons.view_cozy, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons view day": const IconWrapper(
      iconData: Icons.view_day, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons view headline": const IconWrapper(
      iconData: Icons.view_headline, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons view in ar": const IconWrapper(
      iconData: Icons.view_in_ar, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons view kanban": const IconWrapper(
      iconData: Icons.view_kanban, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons view list": const IconWrapper(
      iconData: Icons.view_list, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons view module": const IconWrapper(
      iconData: Icons.view_module, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons view quilt": const IconWrapper(
      iconData: Icons.view_quilt, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons view sidebar": const IconWrapper(
      iconData: Icons.view_sidebar, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons view stream": const IconWrapper(
      iconData: Icons.view_stream, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons view timeline": const IconWrapper(
      iconData: Icons.view_timeline, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons view week": const IconWrapper(
      iconData: Icons.view_week, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons vignette": const IconWrapper(
      iconData: Icons.vignette, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons villa": const IconWrapper(
      iconData: Icons.villa, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons visibility": const IconWrapper(
      iconData: Icons.visibility, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons visibility off": const IconWrapper(
      iconData: Icons.visibility_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons voice chat": const IconWrapper(
      iconData: Icons.voice_chat, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons voice over off": const IconWrapper(
      iconData: Icons.voice_over_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons voicemail": const IconWrapper(
      iconData: Icons.voicemail, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons volcano": const IconWrapper(
      iconData: Icons.volcano, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons volume down": const IconWrapper(
      iconData: Icons.volume_down, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons volume down alt": const IconWrapper(
      iconData: Icons.volume_down_alt, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons volume mute": const IconWrapper(
      iconData: Icons.volume_mute, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons volume off": const IconWrapper(
      iconData: Icons.volume_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons volume up": const IconWrapper(
      iconData: Icons.volume_up, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons volunteer activism": const IconWrapper(
      iconData: Icons.volunteer_activism,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons vpn key": const IconWrapper(
      iconData: Icons.vpn_key, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons vpn key off": const IconWrapper(
      iconData: Icons.vpn_key_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons vpn lock": const IconWrapper(
      iconData: Icons.vpn_lock, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons vrpano": const IconWrapper(
      iconData: Icons.vrpano, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wallet": const IconWrapper(
      iconData: Icons.wallet, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wallet giftcard": const IconWrapper(
      iconData: Icons.wallet_giftcard, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wallet membership": const IconWrapper(
      iconData: Icons.wallet_membership,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wallet travel": const IconWrapper(
      iconData: Icons.wallet_travel, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wallpaper": const IconWrapper(
      iconData: Icons.wallpaper, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons warehouse": const IconWrapper(
      iconData: Icons.warehouse, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons warning": const IconWrapper(
      iconData: Icons.warning, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons warning amber": const IconWrapper(
      iconData: Icons.warning_amber, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wash": const IconWrapper(
      iconData: Icons.wash, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons watch": const IconWrapper(
      iconData: Icons.watch, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons watch later": const IconWrapper(
      iconData: Icons.watch_later, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons watch off": const IconWrapper(
      iconData: Icons.watch_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons water": const IconWrapper(
      iconData: Icons.water, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons water damage": const IconWrapper(
      iconData: Icons.water_damage, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons water drop": const IconWrapper(
      iconData: Icons.water_drop, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons waterfall chart": const IconWrapper(
      iconData: Icons.waterfall_chart, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons waves": const IconWrapper(
      iconData: Icons.waves, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons waving hand": const IconWrapper(
      iconData: Icons.waving_hand, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wb auto": const IconWrapper(
      iconData: Icons.wb_auto, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wb cloudy": const IconWrapper(
      iconData: Icons.wb_cloudy, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wb incandescent": const IconWrapper(
      iconData: Icons.wb_incandescent, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wb iridescent": const IconWrapper(
      iconData: Icons.wb_iridescent, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wb shade": const IconWrapper(
      iconData: Icons.wb_shade, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wb sunny": const IconWrapper(
      iconData: Icons.wb_sunny, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wb twighlight": const IconWrapper(
      iconData: Icons.wb_twighlight, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wb twilight": const IconWrapper(
      iconData: Icons.wb_twilight, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wc": const IconWrapper(
      iconData: Icons.wc, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons web": const IconWrapper(
      iconData: Icons.web, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons web asset": const IconWrapper(
      iconData: Icons.web_asset, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons web asset off": const IconWrapper(
      iconData: Icons.web_asset_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons web stories": const IconWrapper(
      iconData: Icons.web_stories, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons webhook": const IconWrapper(
      iconData: Icons.webhook, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wechat": const IconWrapper(
      iconData: Icons.wechat, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons weekend": const IconWrapper(
      iconData: Icons.weekend, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons west": const IconWrapper(
      iconData: Icons.west, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons whatshot": const IconWrapper(
      iconData: Icons.whatshot, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wheelchair pickup": const IconWrapper(
      iconData: Icons.wheelchair_pickup,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons where to vote": const IconWrapper(
      iconData: Icons.where_to_vote, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons widgets": const IconWrapper(
      iconData: Icons.widgets, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons width full": const IconWrapper(
      iconData: Icons.width_full, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons width normal": const IconWrapper(
      iconData: Icons.width_normal, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons width wide": const IconWrapper(
      iconData: Icons.width_wide, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wifi": const IconWrapper(
      iconData: Icons.wifi, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wifi 1 bar": const IconWrapper(
      iconData: Icons.wifi_1_bar, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wifi 2 bar": const IconWrapper(
      iconData: Icons.wifi_2_bar, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wifi calling": const IconWrapper(
      iconData: Icons.wifi_calling, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wifi calling 3": const IconWrapper(
      iconData: Icons.wifi_calling_3, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wifi channel": const IconWrapper(
      iconData: Icons.wifi_channel, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wifi find": const IconWrapper(
      iconData: Icons.wifi_find, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wifi lock": const IconWrapper(
      iconData: Icons.wifi_lock, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wifi off": const IconWrapper(
      iconData: Icons.wifi_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wifi password": const IconWrapper(
      iconData: Icons.wifi_password, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wifi protected setup": const IconWrapper(
      iconData: Icons.wifi_protected_setup,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wifi tethering": const IconWrapper(
      iconData: Icons.wifi_tethering, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wifi tethering error": const IconWrapper(
      iconData: Icons.wifi_tethering_error,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wifi tethering off": const IconWrapper(
      iconData: Icons.wifi_tethering_off,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wind power": const IconWrapper(
      iconData: Icons.wind_power, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons window": const IconWrapper(
      iconData: Icons.window, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wine bar": const IconWrapper(
      iconData: Icons.wine_bar, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons woman": const IconWrapper(
      iconData: Icons.woman, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons woman 2": const IconWrapper(
      iconData: Icons.woman_2, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons woo commerce": const IconWrapper(
      iconData: Icons.woo_commerce, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wordpress": const IconWrapper(
      iconData: Icons.wordpress, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons work": const IconWrapper(
      iconData: Icons.work, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons work history": const IconWrapper(
      iconData: Icons.work_history, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons work off": const IconWrapper(
      iconData: Icons.work_off, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons workspace premium": const IconWrapper(
      iconData: Icons.workspace_premium,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons workspaces": const IconWrapper(
      iconData: Icons.workspaces, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wrap text": const IconWrapper(
      iconData: Icons.wrap_text, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wrong location": const IconWrapper(
      iconData: Icons.wrong_location, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons wysiwyg": const IconWrapper(
      iconData: Icons.wysiwyg, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons yard": const IconWrapper(
      iconData: Icons.yard, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons youtube searched for": const IconWrapper(
      iconData: Icons.youtube_searched_for,
      iconDataType: IconDataType.flutterIcons),
  "MaterialIcons zoom in": const IconWrapper(
      iconData: Icons.zoom_in, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons zoom in map": const IconWrapper(
      iconData: Icons.zoom_in_map, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons zoom out": const IconWrapper(
      iconData: Icons.zoom_out, iconDataType: IconDataType.flutterIcons),
  "MaterialIcons zoom out map": const IconWrapper(
      iconData: Icons.zoom_out_map, iconDataType: IconDataType.flutterIcons),
  "ionicons remove": const IconWrapper(
      iconData: Ionicons.remove, iconDataType: IconDataType.ionIcons),
  "ionicons reorder two": const IconWrapper(
      iconData: Ionicons.reorder_two, iconDataType: IconDataType.ionIcons),
  "ionicons mic off circle": const IconWrapper(
      iconData: Ionicons.mic_off_circle, iconDataType: IconDataType.ionIcons),
  "ionicons logo github": const IconWrapper(
      iconData: Ionicons.logo_github, iconDataType: IconDataType.ionIcons),
  "ionicons stopwatch": const IconWrapper(
      iconData: Ionicons.stopwatch, iconDataType: IconDataType.ionIcons),
  "ionicons add": const IconWrapper(
      iconData: Ionicons.add, iconDataType: IconDataType.ionIcons),
  "ionicons logo bitcoin": const IconWrapper(
      iconData: Ionicons.logo_bitcoin, iconDataType: IconDataType.ionIcons),
  "ionicons medal": const IconWrapper(
      iconData: Ionicons.medal, iconDataType: IconDataType.ionIcons),
  "ionicons mail open": const IconWrapper(
      iconData: Ionicons.mail_open, iconDataType: IconDataType.ionIcons),
  "ionicons mic circle": const IconWrapper(
      iconData: Ionicons.mic_circle, iconDataType: IconDataType.ionIcons),
  "ionicons at circle": const IconWrapper(
      iconData: Ionicons.at_circle, iconDataType: IconDataType.ionIcons),
  "ionicons chatbox ellipses": const IconWrapper(
      iconData: Ionicons.chatbox_ellipses, iconDataType: IconDataType.ionIcons),
  "ionicons arrow forward circle": const IconWrapper(
      iconData: Ionicons.arrow_forward_circle,
      iconDataType: IconDataType.ionIcons),
  "ionicons stats chart": const IconWrapper(
      iconData: Ionicons.stats_chart, iconDataType: IconDataType.ionIcons),
  "ionicons laptop": const IconWrapper(
      iconData: Ionicons.laptop, iconDataType: IconDataType.ionIcons),
  "ionicons hammer": const IconWrapper(
      iconData: Ionicons.hammer, iconDataType: IconDataType.ionIcons),
  "ionicons podium": const IconWrapper(
      iconData: Ionicons.podium, iconDataType: IconDataType.ionIcons),
  "ionicons newspaper": const IconWrapper(
      iconData: Ionicons.newspaper, iconDataType: IconDataType.ionIcons),
  "ionicons logo discord": const IconWrapper(
      iconData: Ionicons.logo_discord, iconDataType: IconDataType.ionIcons),
  "ionicons bug": const IconWrapper(
      iconData: Ionicons.bug, iconDataType: IconDataType.ionIcons),
  "ionicons logo designernews": const IconWrapper(
      iconData: Ionicons.logo_designernews,
      iconDataType: IconDataType.ionIcons),
  "ionicons sad": const IconWrapper(
      iconData: Ionicons.sad, iconDataType: IconDataType.ionIcons),
  "ionicons play forward circle": const IconWrapper(
      iconData: Ionicons.play_forward_circle,
      iconDataType: IconDataType.ionIcons),
  "ionicons woman": const IconWrapper(
      iconData: Ionicons.woman, iconDataType: IconDataType.ionIcons),
  "ionicons lock closed": const IconWrapper(
      iconData: Ionicons.lock_closed, iconDataType: IconDataType.ionIcons),
  "ionicons search circle": const IconWrapper(
      iconData: Ionicons.search_circle, iconDataType: IconDataType.ionIcons),
  "ionicons hand left": const IconWrapper(
      iconData: Ionicons.hand_left, iconDataType: IconDataType.ionIcons),
  "ionicons thermometer": const IconWrapper(
      iconData: Ionicons.thermometer, iconDataType: IconDataType.ionIcons),
  "ionicons logo medium": const IconWrapper(
      iconData: Ionicons.logo_medium, iconDataType: IconDataType.ionIcons),
  "ionicons reload": const IconWrapper(
      iconData: Ionicons.reload, iconDataType: IconDataType.ionIcons),
  "ionicons language": const IconWrapper(
      iconData: Ionicons.language, iconDataType: IconDataType.ionIcons),
  "ionicons trophy": const IconWrapper(
      iconData: Ionicons.trophy, iconDataType: IconDataType.ionIcons),
  "ionicons fish": const IconWrapper(
      iconData: Ionicons.fish, iconDataType: IconDataType.ionIcons),
  "ionicons accessibility": const IconWrapper(
      iconData: Ionicons.accessibility, iconDataType: IconDataType.ionIcons),
  "ionicons attach": const IconWrapper(
      iconData: Ionicons.attach, iconDataType: IconDataType.ionIcons),
  "ionicons hand right": const IconWrapper(
      iconData: Ionicons.hand_right, iconDataType: IconDataType.ionIcons),
  "ionicons musical note": const IconWrapper(
      iconData: Ionicons.musical_note, iconDataType: IconDataType.ionIcons),
  "ionicons file tray": const IconWrapper(
      iconData: Ionicons.file_tray, iconDataType: IconDataType.ionIcons),
  "ionicons scan circle": const IconWrapper(
      iconData: Ionicons.scan_circle, iconDataType: IconDataType.ionIcons),
  "ionicons pricetags": const IconWrapper(
      iconData: Ionicons.pricetags, iconDataType: IconDataType.ionIcons),
  "ionicons radio": const IconWrapper(
      iconData: Ionicons.radio, iconDataType: IconDataType.ionIcons),
  "ionicons push": const IconWrapper(
      iconData: Ionicons.push, iconDataType: IconDataType.ionIcons),
  "ionicons rose": const IconWrapper(
      iconData: Ionicons.rose, iconDataType: IconDataType.ionIcons),
  "ionicons ellipsis vertical circle": const IconWrapper(
      iconData: Ionicons.ellipsis_vertical_circle,
      iconDataType: IconDataType.ionIcons),
  "ionicons shirt": const IconWrapper(
      iconData: Ionicons.shirt, iconDataType: IconDataType.ionIcons),
  "ionicons document attach": const IconWrapper(
      iconData: Ionicons.document_attach, iconDataType: IconDataType.ionIcons),
  "ionicons logo xing": const IconWrapper(
      iconData: Ionicons.logo_xing, iconDataType: IconDataType.ionIcons),
  "ionicons link": const IconWrapper(
      iconData: Ionicons.link, iconDataType: IconDataType.ionIcons),
  "ionicons arrow redo": const IconWrapper(
      iconData: Ionicons.arrow_redo, iconDataType: IconDataType.ionIcons),
  "ionicons lock open": const IconWrapper(
      iconData: Ionicons.lock_open, iconDataType: IconDataType.ionIcons),
  "ionicons arrow undo circle": const IconWrapper(
      iconData: Ionicons.arrow_undo_circle,
      iconDataType: IconDataType.ionIcons),
  "ionicons hourglass": const IconWrapper(
      iconData: Ionicons.hourglass, iconDataType: IconDataType.ionIcons),
  "ionicons return down forward": const IconWrapper(
      iconData: Ionicons.return_down_forward,
      iconDataType: IconDataType.ionIcons),
  "ionicons reader": const IconWrapper(
      iconData: Ionicons.reader, iconDataType: IconDataType.ionIcons),
  "ionicons id card": const IconWrapper(
      iconData: Ionicons.id_card, iconDataType: IconDataType.ionIcons),
  "ionicons volume mute": const IconWrapper(
      iconData: Ionicons.volume_mute, iconDataType: IconDataType.ionIcons),
  "ionicons bandage": const IconWrapper(
      iconData: Ionicons.bandage, iconDataType: IconDataType.ionIcons),
  "ionicons baseball": const IconWrapper(
      iconData: Ionicons.baseball, iconDataType: IconDataType.ionIcons),
  "ionicons home": const IconWrapper(
      iconData: Ionicons.home, iconDataType: IconDataType.ionIcons),
  "ionicons pricetag": const IconWrapper(
      iconData: Ionicons.pricetag, iconDataType: IconDataType.ionIcons),
  "ionicons arrow undo": const IconWrapper(
      iconData: Ionicons.arrow_undo, iconDataType: IconDataType.ionIcons),
  "ionicons logo yahoo": const IconWrapper(
      iconData: Ionicons.logo_yahoo, iconDataType: IconDataType.ionIcons),
  "ionicons logo usd": const IconWrapper(
      iconData: Ionicons.logo_usd, iconDataType: IconDataType.ionIcons),
  "ionicons play skip back": const IconWrapper(
      iconData: Ionicons.play_skip_back, iconDataType: IconDataType.ionIcons),
  "ionicons play skip forward": const IconWrapper(
      iconData: Ionicons.play_skip_forward,
      iconDataType: IconDataType.ionIcons),
  "ionicons swap horizontal": const IconWrapper(
      iconData: Ionicons.swap_horizontal, iconDataType: IconDataType.ionIcons),
  "ionicons navigate": const IconWrapper(
      iconData: Ionicons.navigate, iconDataType: IconDataType.ionIcons),
  "ionicons logo wordpress": const IconWrapper(
      iconData: Ionicons.logo_wordpress, iconDataType: IconDataType.ionIcons),
  "ionicons pint": const IconWrapper(
      iconData: Ionicons.pint, iconDataType: IconDataType.ionIcons),
  "ionicons return up back": const IconWrapper(
      iconData: Ionicons.return_up_back, iconDataType: IconDataType.ionIcons),
  "ionicons bag remove": const IconWrapper(
      iconData: Ionicons.bag_remove, iconDataType: IconDataType.ionIcons),
  "ionicons key": const IconWrapper(
      iconData: Ionicons.key, iconDataType: IconDataType.ionIcons),
  "ionicons search": const IconWrapper(
      iconData: Ionicons.search, iconDataType: IconDataType.ionIcons),
  "ionicons caret back circle": const IconWrapper(
      iconData: Ionicons.caret_back_circle,
      iconDataType: IconDataType.ionIcons),
  "ionicons calculator": const IconWrapper(
      iconData: Ionicons.calculator, iconDataType: IconDataType.ionIcons),
  "ionicons logo octocat": const IconWrapper(
      iconData: Ionicons.logo_octocat, iconDataType: IconDataType.ionIcons),
  "ionicons male": const IconWrapper(
      iconData: Ionicons.male, iconDataType: IconDataType.ionIcons),
  "ionicons sync": const IconWrapper(
      iconData: Ionicons.sync, iconDataType: IconDataType.ionIcons),
  "ionicons flag": const IconWrapper(
      iconData: Ionicons.flag, iconDataType: IconDataType.ionIcons),
  "ionicons aperture": const IconWrapper(
      iconData: Ionicons.aperture, iconDataType: IconDataType.ionIcons),
  "ionicons toggle": const IconWrapper(
      iconData: Ionicons.toggle, iconDataType: IconDataType.ionIcons),
  "ionicons help circle": const IconWrapper(
      iconData: Ionicons.help_circle, iconDataType: IconDataType.ionIcons),
  "ionicons return down back": const IconWrapper(
      iconData: Ionicons.return_down_back, iconDataType: IconDataType.ionIcons),
  "ionicons heart circle": const IconWrapper(
      iconData: Ionicons.heart_circle, iconDataType: IconDataType.ionIcons),
  "ionicons contract": const IconWrapper(
      iconData: Ionicons.contract, iconDataType: IconDataType.ionIcons),
  "ionicons cellular": const IconWrapper(
      iconData: Ionicons.cellular, iconDataType: IconDataType.ionIcons),
  "ionicons play back circle": const IconWrapper(
      iconData: Ionicons.play_back_circle, iconDataType: IconDataType.ionIcons),
  "ionicons beer": const IconWrapper(
      iconData: Ionicons.beer, iconDataType: IconDataType.ionIcons),
  "ionicons logo npm": const IconWrapper(
      iconData: Ionicons.logo_npm, iconDataType: IconDataType.ionIcons),
  "ionicons battery dead": const IconWrapper(
      iconData: Ionicons.battery_dead, iconDataType: IconDataType.ionIcons),
  "ionicons logo no smoking": const IconWrapper(
      iconData: Ionicons.logo_no_smoking, iconDataType: IconDataType.ionIcons),
  "ionicons cloud offline": const IconWrapper(
      iconData: Ionicons.cloud_offline, iconDataType: IconDataType.ionIcons),
  "ionicons filter circle": const IconWrapper(
      iconData: Ionicons.filter_circle, iconDataType: IconDataType.ionIcons),
  "ionicons timer": const IconWrapper(
      iconData: Ionicons.timer, iconDataType: IconDataType.ionIcons),
  "ionicons git merge": const IconWrapper(
      iconData: Ionicons.git_merge, iconDataType: IconDataType.ionIcons),
  "ionicons caret forward circle": const IconWrapper(
      iconData: Ionicons.caret_forward_circle,
      iconDataType: IconDataType.ionIcons),
  "ionicons cloud done": const IconWrapper(
      iconData: Ionicons.cloud_done, iconDataType: IconDataType.ionIcons),
  "ionicons logo windows": const IconWrapper(
      iconData: Ionicons.logo_windows, iconDataType: IconDataType.ionIcons),
  "ionicons volume low": const IconWrapper(
      iconData: Ionicons.volume_low, iconDataType: IconDataType.ionIcons),
  "ionicons refresh circle": const IconWrapper(
      iconData: Ionicons.refresh_circle, iconDataType: IconDataType.ionIcons),
  "ionicons image": const IconWrapper(
      iconData: Ionicons.image, iconDataType: IconDataType.ionIcons),
  "ionicons briefcase": const IconWrapper(
      iconData: Ionicons.briefcase, iconDataType: IconDataType.ionIcons),
  "ionicons contrast": const IconWrapper(
      iconData: Ionicons.contrast, iconDataType: IconDataType.ionIcons),
  "ionicons save": const IconWrapper(
      iconData: Ionicons.save, iconDataType: IconDataType.ionIcons),
  "ionicons layers": const IconWrapper(
      iconData: Ionicons.layers, iconDataType: IconDataType.ionIcons),
  "ionicons time": const IconWrapper(
      iconData: Ionicons.time, iconDataType: IconDataType.ionIcons),
  "ionicons train": const IconWrapper(
      iconData: Ionicons.train, iconDataType: IconDataType.ionIcons),
  "ionicons mail unread": const IconWrapper(
      iconData: Ionicons.mail_unread, iconDataType: IconDataType.ionIcons),
  "ionicons checkmark done": const IconWrapper(
      iconData: Ionicons.checkmark_done, iconDataType: IconDataType.ionIcons),
  "ionicons logo xbox": const IconWrapper(
      iconData: Ionicons.logo_xbox, iconDataType: IconDataType.ionIcons),
  "ionicons bag add": const IconWrapper(
      iconData: Ionicons.bag_add, iconDataType: IconDataType.ionIcons),
  "ionicons checkbox": const IconWrapper(
      iconData: Ionicons.checkbox, iconDataType: IconDataType.ionIcons),
  "ionicons git network": const IconWrapper(
      iconData: Ionicons.git_network, iconDataType: IconDataType.ionIcons),
  "ionicons logo reddit": const IconWrapper(
      iconData: Ionicons.logo_reddit, iconDataType: IconDataType.ionIcons),
  "ionicons logo rss": const IconWrapper(
      iconData: Ionicons.logo_rss, iconDataType: IconDataType.ionIcons),
  "ionicons code slash": const IconWrapper(
      iconData: Ionicons.code_slash, iconDataType: IconDataType.ionIcons),
  "ionicons code download": const IconWrapper(
      iconData: Ionicons.code_download, iconDataType: IconDataType.ionIcons),
  "ionicons shield half": const IconWrapper(
      iconData: Ionicons.shield_half, iconDataType: IconDataType.ionIcons),
  "ionicons storefront": const IconWrapper(
      iconData: Ionicons.storefront, iconDataType: IconDataType.ionIcons),
  "ionicons logo mastodon": const IconWrapper(
      iconData: Ionicons.logo_mastodon, iconDataType: IconDataType.ionIcons),
  "ionicons pulse": const IconWrapper(
      iconData: Ionicons.pulse, iconDataType: IconDataType.ionIcons),
  "ionicons mic off": const IconWrapper(
      iconData: Ionicons.mic_off, iconDataType: IconDataType.ionIcons),
  "ionicons flask": const IconWrapper(
      iconData: Ionicons.flask, iconDataType: IconDataType.ionIcons),
  "ionicons analytics": const IconWrapper(
      iconData: Ionicons.analytics, iconDataType: IconDataType.ionIcons),
  "ionicons backspace": const IconWrapper(
      iconData: Ionicons.backspace, iconDataType: IconDataType.ionIcons),
  "ionicons close": const IconWrapper(
      iconData: Ionicons.close, iconDataType: IconDataType.ionIcons),
  "ionicons thumbs down": const IconWrapper(
      iconData: Ionicons.thumbs_down, iconDataType: IconDataType.ionIcons),
  "ionicons logo dropbox": const IconWrapper(
      iconData: Ionicons.logo_dropbox, iconDataType: IconDataType.ionIcons),
  "ionicons settings": const IconWrapper(
      iconData: Ionicons.settings, iconDataType: IconDataType.ionIcons),
  "ionicons person circle": const IconWrapper(
      iconData: Ionicons.person_circle, iconDataType: IconDataType.ionIcons),
  "ionicons football": const IconWrapper(
      iconData: Ionicons.football, iconDataType: IconDataType.ionIcons),
  "ionicons trash": const IconWrapper(
      iconData: Ionicons.trash, iconDataType: IconDataType.ionIcons),
  "ionicons arrow back circle": const IconWrapper(
      iconData: Ionicons.arrow_back_circle,
      iconDataType: IconDataType.ionIcons),
  "ionicons resize": const IconWrapper(
      iconData: Ionicons.resize, iconDataType: IconDataType.ionIcons),
  "ionicons keypad": const IconWrapper(
      iconData: Ionicons.keypad, iconDataType: IconDataType.ionIcons),
  "ionicons logo soundcloud": const IconWrapper(
      iconData: Ionicons.logo_soundcloud, iconDataType: IconDataType.ionIcons),
  "ionicons server": const IconWrapper(
      iconData: Ionicons.server, iconDataType: IconDataType.ionIcons),
  "ionicons code working": const IconWrapper(
      iconData: Ionicons.code_working, iconDataType: IconDataType.ionIcons),
  "ionicons mail": const IconWrapper(
      iconData: Ionicons.mail, iconDataType: IconDataType.ionIcons),
  "ionicons battery charging": const IconWrapper(
      iconData: Ionicons.battery_charging, iconDataType: IconDataType.ionIcons),
  "ionicons log in": const IconWrapper(
      iconData: Ionicons.log_in, iconDataType: IconDataType.ionIcons),
  "ionicons ban": const IconWrapper(
      iconData: Ionicons.ban, iconDataType: IconDataType.ionIcons),
  "ionicons locate": const IconWrapper(
      iconData: Ionicons.locate, iconDataType: IconDataType.ionIcons),
  "ionicons wifi": const IconWrapper(
      iconData: Ionicons.wifi, iconDataType: IconDataType.ionIcons),
  "ionicons play back": const IconWrapper(
      iconData: Ionicons.play_back, iconDataType: IconDataType.ionIcons),
  "ionicons calendar": const IconWrapper(
      iconData: Ionicons.calendar, iconDataType: IconDataType.ionIcons),
  "ionicons logo wechat": const IconWrapper(
      iconData: Ionicons.logo_wechat, iconDataType: IconDataType.ionIcons),
  "ionicons ticket": const IconWrapper(
      iconData: Ionicons.ticket, iconDataType: IconDataType.ionIcons),
  "ionicons file tray stacked": const IconWrapper(
      iconData: Ionicons.file_tray_stacked,
      iconDataType: IconDataType.ionIcons),
  "ionicons brush": const IconWrapper(
      iconData: Ionicons.brush, iconDataType: IconDataType.ionIcons),
  "ionicons logo capacitor": const IconWrapper(
      iconData: Ionicons.logo_capacitor, iconDataType: IconDataType.ionIcons),
  "ionicons ellipsis vertical": const IconWrapper(
      iconData: Ionicons.ellipsis_vertical,
      iconDataType: IconDataType.ionIcons),
  "ionicons shield": const IconWrapper(
      iconData: Ionicons.shield, iconDataType: IconDataType.ionIcons),
  "ionicons trending up": const IconWrapper(
      iconData: Ionicons.trending_up, iconDataType: IconDataType.ionIcons),
  "ionicons recording": const IconWrapper(
      iconData: Ionicons.recording, iconDataType: IconDataType.ionIcons),
  "ionicons logo foursquare": const IconWrapper(
      iconData: Ionicons.logo_foursquare, iconDataType: IconDataType.ionIcons),
  "ionicons bonfire": const IconWrapper(
      iconData: Ionicons.bonfire, iconDataType: IconDataType.ionIcons),
  "ionicons ice cream": const IconWrapper(
      iconData: Ionicons.ice_cream, iconDataType: IconDataType.ionIcons),
  "ionicons phone portrait": const IconWrapper(
      iconData: Ionicons.phone_portrait, iconDataType: IconDataType.ionIcons),
  "ionicons shapes": const IconWrapper(
      iconData: Ionicons.shapes, iconDataType: IconDataType.ionIcons),
  "ionicons umbrella": const IconWrapper(
      iconData: Ionicons.umbrella, iconDataType: IconDataType.ionIcons),
  "ionicons cloud download": const IconWrapper(
      iconData: Ionicons.cloud_download, iconDataType: IconDataType.ionIcons),
  "ionicons caret back": const IconWrapper(
      iconData: Ionicons.caret_back, iconDataType: IconDataType.ionIcons),
  "ionicons create": const IconWrapper(
      iconData: Ionicons.create, iconDataType: IconDataType.ionIcons),
  "ionicons logo vue": const IconWrapper(
      iconData: Ionicons.logo_vue, iconDataType: IconDataType.ionIcons),
  "ionicons cube": const IconWrapper(
      iconData: Ionicons.cube, iconDataType: IconDataType.ionIcons),
  "ionicons git commit": const IconWrapper(
      iconData: Ionicons.git_commit, iconDataType: IconDataType.ionIcons),
  "ionicons sparkles": const IconWrapper(
      iconData: Ionicons.sparkles, iconDataType: IconDataType.ionIcons),
  "ionicons move": const IconWrapper(
      iconData: Ionicons.move, iconDataType: IconDataType.ionIcons),
  "ionicons gift": const IconWrapper(
      iconData: Ionicons.gift, iconDataType: IconDataType.ionIcons),
  "ionicons logo css3": const IconWrapper(
      iconData: Ionicons.logo_css3, iconDataType: IconDataType.ionIcons),
  "ionicons camera": const IconWrapper(
      iconData: Ionicons.camera, iconDataType: IconDataType.ionIcons),
  "ionicons arrow back": const IconWrapper(
      iconData: Ionicons.arrow_back, iconDataType: IconDataType.ionIcons),
  "ionicons glasses": const IconWrapper(
      iconData: Ionicons.glasses, iconDataType: IconDataType.ionIcons),
  "ionicons logo tableau": const IconWrapper(
      iconData: Ionicons.logo_tableau, iconDataType: IconDataType.ionIcons),
  "ionicons heart dislike": const IconWrapper(
      iconData: Ionicons.heart_dislike, iconDataType: IconDataType.ionIcons),
  "ionicons logo whatsapp": const IconWrapper(
      iconData: Ionicons.logo_whatsapp, iconDataType: IconDataType.ionIcons),
  "ionicons videocam off": const IconWrapper(
      iconData: Ionicons.videocam_off, iconDataType: IconDataType.ionIcons),
  "ionicons apps": const IconWrapper(
      iconData: Ionicons.apps, iconDataType: IconDataType.ionIcons),
  "ionicons bicycle": const IconWrapper(
      iconData: Ionicons.bicycle, iconDataType: IconDataType.ionIcons),
  "ionicons add circle": const IconWrapper(
      iconData: Ionicons.add_circle, iconDataType: IconDataType.ionIcons),
  "ionicons musical notes": const IconWrapper(
      iconData: Ionicons.musical_notes, iconDataType: IconDataType.ionIcons),
  "ionicons globe": const IconWrapper(
      iconData: Ionicons.globe, iconDataType: IconDataType.ionIcons),
  "ionicons play forward": const IconWrapper(
      iconData: Ionicons.play_forward, iconDataType: IconDataType.ionIcons),
  "ionicons bookmark": const IconWrapper(
      iconData: Ionicons.bookmark, iconDataType: IconDataType.ionIcons),
  "ionicons logo html5": const IconWrapper(
      iconData: Ionicons.logo_html5, iconDataType: IconDataType.ionIcons),
  "ionicons terminal": const IconWrapper(
      iconData: Ionicons.terminal, iconDataType: IconDataType.ionIcons),
  "ionicons tablet portrait": const IconWrapper(
      iconData: Ionicons.tablet_portrait, iconDataType: IconDataType.ionIcons),
  "ionicons female": const IconWrapper(
      iconData: Ionicons.female, iconDataType: IconDataType.ionIcons),
  "ionicons library": const IconWrapper(
      iconData: Ionicons.library, iconDataType: IconDataType.ionIcons),
  "ionicons logo steam": const IconWrapper(
      iconData: Ionicons.logo_steam, iconDataType: IconDataType.ionIcons),
  "ionicons chatbubbles": const IconWrapper(
      iconData: Ionicons.chatbubbles, iconDataType: IconDataType.ionIcons),
  "ionicons sunny": const IconWrapper(
      iconData: Ionicons.sunny, iconDataType: IconDataType.ionIcons),
  "ionicons logo playstation": const IconWrapper(
      iconData: Ionicons.logo_playstation, iconDataType: IconDataType.ionIcons),
  "ionicons logo sass": const IconWrapper(
      iconData: Ionicons.logo_sass, iconDataType: IconDataType.ionIcons),
  "ionicons golf": const IconWrapper(
      iconData: Ionicons.golf, iconDataType: IconDataType.ionIcons),
  "ionicons flower": const IconWrapper(
      iconData: Ionicons.flower, iconDataType: IconDataType.ionIcons),
  "ionicons volume high": const IconWrapper(
      iconData: Ionicons.volume_high, iconDataType: IconDataType.ionIcons),
  "ionicons flash": const IconWrapper(
      iconData: Ionicons.flash, iconDataType: IconDataType.ionIcons),
  "ionicons leaf": const IconWrapper(
      iconData: Ionicons.leaf, iconDataType: IconDataType.ionIcons),
  "ionicons eyedrop": const IconWrapper(
      iconData: Ionicons.eyedrop, iconDataType: IconDataType.ionIcons),
  "ionicons flash off": const IconWrapper(
      iconData: Ionicons.flash_off, iconDataType: IconDataType.ionIcons),
  "ionicons logo ionitron": const IconWrapper(
      iconData: Ionicons.logo_ionitron, iconDataType: IconDataType.ionIcons),
  "ionicons battery full": const IconWrapper(
      iconData: Ionicons.battery_full, iconDataType: IconDataType.ionIcons),
  "ionicons man": const IconWrapper(
      iconData: Ionicons.man, iconDataType: IconDataType.ionIcons),
  "ionicons scan": const IconWrapper(
      iconData: Ionicons.scan, iconDataType: IconDataType.ionIcons),
  "ionicons tennisball": const IconWrapper(
      iconData: Ionicons.tennisball, iconDataType: IconDataType.ionIcons),
  "ionicons american football": const IconWrapper(
      iconData: Ionicons.american_football,
      iconDataType: IconDataType.ionIcons),
  "ionicons documents": const IconWrapper(
      iconData: Ionicons.documents, iconDataType: IconDataType.ionIcons),
  "ionicons logo facebook": const IconWrapper(
      iconData: Ionicons.logo_facebook, iconDataType: IconDataType.ionIcons),
  "ionicons star half": const IconWrapper(
      iconData: Ionicons.star_half, iconDataType: IconDataType.ionIcons),
  "ionicons logo microsoft": const IconWrapper(
      iconData: Ionicons.logo_microsoft, iconDataType: IconDataType.ionIcons),
  "ionicons location": const IconWrapper(
      iconData: Ionicons.location, iconDataType: IconDataType.ionIcons),
  "ionicons ellipsis horizontal": const IconWrapper(
      iconData: Ionicons.ellipsis_horizontal,
      iconDataType: IconDataType.ionIcons),
  "ionicons logo electron": const IconWrapper(
      iconData: Ionicons.logo_electron, iconDataType: IconDataType.ionIcons),
  "ionicons mic": const IconWrapper(
      iconData: Ionicons.mic, iconDataType: IconDataType.ionIcons),
  "ionicons logo twitch": const IconWrapper(
      iconData: Ionicons.logo_twitch, iconDataType: IconDataType.ionIcons),
  "ionicons flashlight": const IconWrapper(
      iconData: Ionicons.flashlight, iconDataType: IconDataType.ionIcons),
  "ionicons videocam": const IconWrapper(
      iconData: Ionicons.videocam, iconDataType: IconDataType.ionIcons),
  "ionicons close circle": const IconWrapper(
      iconData: Ionicons.close_circle, iconDataType: IconDataType.ionIcons),
  "ionicons headset": const IconWrapper(
      iconData: Ionicons.headset, iconDataType: IconDataType.ionIcons),
  "ionicons person add": const IconWrapper(
      iconData: Ionicons.person_add, iconDataType: IconDataType.ionIcons),
  "ionicons skull": const IconWrapper(
      iconData: Ionicons.skull, iconDataType: IconDataType.ionIcons),
  "ionicons ellipse": const IconWrapper(
      iconData: Ionicons.ellipse, iconDataType: IconDataType.ionIcons),
  "ionicons repeat": const IconWrapper(
      iconData: Ionicons.repeat, iconDataType: IconDataType.ionIcons),
  "ionicons logo figma": const IconWrapper(
      iconData: Ionicons.logo_figma, iconDataType: IconDataType.ionIcons),
  "ionicons pause": const IconWrapper(
      iconData: Ionicons.pause, iconDataType: IconDataType.ionIcons),
  "ionicons duplicate": const IconWrapper(
      iconData: Ionicons.duplicate, iconDataType: IconDataType.ionIcons),
  "ionicons filter": const IconWrapper(
      iconData: Ionicons.filter, iconDataType: IconDataType.ionIcons),
  "ionicons share": const IconWrapper(
      iconData: Ionicons.share, iconDataType: IconDataType.ionIcons),
  "ionicons git compare": const IconWrapper(
      iconData: Ionicons.git_compare, iconDataType: IconDataType.ionIcons),
  "ionicons unlink": const IconWrapper(
      iconData: Ionicons.unlink, iconDataType: IconDataType.ionIcons),
  "ionicons caret up": const IconWrapper(
      iconData: Ionicons.caret_up, iconDataType: IconDataType.ionIcons),
  "ionicons easel": const IconWrapper(
      iconData: Ionicons.easel, iconDataType: IconDataType.ionIcons),
  "ionicons volume off": const IconWrapper(
      iconData: Ionicons.volume_off, iconDataType: IconDataType.ionIcons),
  "ionicons radio button on": const IconWrapper(
      iconData: Ionicons.radio_button_on, iconDataType: IconDataType.ionIcons),
  "ionicons logo google playstore": const IconWrapper(
      iconData: Ionicons.logo_google_playstore,
      iconDataType: IconDataType.ionIcons),
  "ionicons person remove": const IconWrapper(
      iconData: Ionicons.person_remove, iconDataType: IconDataType.ionIcons),
  "ionicons male female": const IconWrapper(
      iconData: Ionicons.male_female, iconDataType: IconDataType.ionIcons),
  "ionicons logo pinterest": const IconWrapper(
      iconData: Ionicons.logo_pinterest, iconDataType: IconDataType.ionIcons),
  "ionicons people": const IconWrapper(
      iconData: Ionicons.people, iconDataType: IconDataType.ionIcons),
  "ionicons school": const IconWrapper(
      iconData: Ionicons.school, iconDataType: IconDataType.ionIcons),
  "ionicons folder open": const IconWrapper(
      iconData: Ionicons.folder_open, iconDataType: IconDataType.ionIcons),
  "ionicons arrow forward": const IconWrapper(
      iconData: Ionicons.arrow_forward, iconDataType: IconDataType.ionIcons),
  "ionicons tv": const IconWrapper(
      iconData: Ionicons.tv, iconDataType: IconDataType.ionIcons),
  "ionicons caret down": const IconWrapper(
      iconData: Ionicons.caret_down, iconDataType: IconDataType.ionIcons),
  "ionicons logo amplify": const IconWrapper(
      iconData: Ionicons.logo_amplify, iconDataType: IconDataType.ionIcons),
  "ionicons watch": const IconWrapper(
      iconData: Ionicons.watch, iconDataType: IconDataType.ionIcons),
  "ionicons file tray full": const IconWrapper(
      iconData: Ionicons.file_tray_full, iconDataType: IconDataType.ionIcons),
  "ionicons ear": const IconWrapper(
      iconData: Ionicons.ear, iconDataType: IconDataType.ionIcons),
  "ionicons hardware chip": const IconWrapper(
      iconData: Ionicons.hardware_chip, iconDataType: IconDataType.ionIcons),
  "ionicons volume medium": const IconWrapper(
      iconData: Ionicons.volume_medium, iconDataType: IconDataType.ionIcons),
  "ionicons reload circle": const IconWrapper(
      iconData: Ionicons.reload_circle, iconDataType: IconDataType.ionIcons),
  "ionicons bowling ball": const IconWrapper(
      iconData: Ionicons.bowling_ball, iconDataType: IconDataType.ionIcons),
  "ionicons cart": const IconWrapper(
      iconData: Ionicons.cart, iconDataType: IconDataType.ionIcons),
  "ionicons logo euro": const IconWrapper(
      iconData: Ionicons.logo_euro, iconDataType: IconDataType.ionIcons),
  "ionicons bulb": const IconWrapper(
      iconData: Ionicons.bulb, iconDataType: IconDataType.ionIcons),
  "ionicons caret forward": const IconWrapper(
      iconData: Ionicons.caret_forward, iconDataType: IconDataType.ionIcons),
  "ionicons logo tux": const IconWrapper(
      iconData: Ionicons.logo_tux, iconDataType: IconDataType.ionIcons),
  "ionicons options": const IconWrapper(
      iconData: Ionicons.options, iconDataType: IconDataType.ionIcons),
  "ionicons business": const IconWrapper(
      iconData: Ionicons.business, iconDataType: IconDataType.ionIcons),
  "ionicons document lock": const IconWrapper(
      iconData: Ionicons.document_lock, iconDataType: IconDataType.ionIcons),
  "ionicons subway": const IconWrapper(
      iconData: Ionicons.subway, iconDataType: IconDataType.ionIcons),
  "ionicons barcode": const IconWrapper(
      iconData: Ionicons.barcode, iconDataType: IconDataType.ionIcons),
  "ionicons logo apple appstore": const IconWrapper(
      iconData: Ionicons.logo_apple_appstore,
      iconDataType: IconDataType.ionIcons),
  "ionicons logo bitbucket": const IconWrapper(
      iconData: Ionicons.logo_bitbucket, iconDataType: IconDataType.ionIcons),
  "ionicons bag": const IconWrapper(
      iconData: Ionicons.bag, iconDataType: IconDataType.ionIcons),
  "ionicons barbell": const IconWrapper(
      iconData: Ionicons.barbell, iconDataType: IconDataType.ionIcons),
  "ionicons bed": const IconWrapper(
      iconData: Ionicons.bed, iconDataType: IconDataType.ionIcons),
  "ionicons alert": const IconWrapper(
      iconData: Ionicons.alert, iconDataType: IconDataType.ionIcons),
  "ionicons logo javascript": const IconWrapper(
      iconData: Ionicons.logo_javascript, iconDataType: IconDataType.ionIcons),
  "ionicons expand": const IconWrapper(
      iconData: Ionicons.expand, iconDataType: IconDataType.ionIcons),
  "ionicons ellipsis horizontal circle": const IconWrapper(
      iconData: Ionicons.ellipsis_horizontal_circle,
      iconDataType: IconDataType.ionIcons),
  "ionicons logo laravel": const IconWrapper(
      iconData: Ionicons.logo_laravel, iconDataType: IconDataType.ionIcons),
  "ionicons chatbox": const IconWrapper(
      iconData: Ionicons.chatbox, iconDataType: IconDataType.ionIcons),
  "ionicons caret up circle": const IconWrapper(
      iconData: Ionicons.caret_up_circle, iconDataType: IconDataType.ionIcons),
  "ionicons document text": const IconWrapper(
      iconData: Ionicons.document_text, iconDataType: IconDataType.ionIcons),
  "ionicons logo behance": const IconWrapper(
      iconData: Ionicons.logo_behance, iconDataType: IconDataType.ionIcons),
  "ionicons logo buffer": const IconWrapper(
      iconData: Ionicons.logo_buffer, iconDataType: IconDataType.ionIcons),
  "ionicons color palette": const IconWrapper(
      iconData: Ionicons.color_palette, iconDataType: IconDataType.ionIcons),
  "ionicons logo tumblr": const IconWrapper(
      iconData: Ionicons.logo_tumblr, iconDataType: IconDataType.ionIcons),
  "ionicons fast food": const IconWrapper(
      iconData: Ionicons.fast_food, iconDataType: IconDataType.ionIcons),
  "ionicons pause circle": const IconWrapper(
      iconData: Ionicons.pause_circle, iconDataType: IconDataType.ionIcons),
  "ionicons logo web component": const IconWrapper(
      iconData: Ionicons.logo_web_component,
      iconDataType: IconDataType.ionIcons),
  "ionicons wine": const IconWrapper(
      iconData: Ionicons.wine, iconDataType: IconDataType.ionIcons),
  "ionicons happy": const IconWrapper(
      iconData: Ionicons.happy, iconDataType: IconDataType.ionIcons),
  "ionicons dice": const IconWrapper(
      iconData: Ionicons.dice, iconDataType: IconDataType.ionIcons),
  "ionicons film": const IconWrapper(
      iconData: Ionicons.film, iconDataType: IconDataType.ionIcons),
  "ionicons logo google": const IconWrapper(
      iconData: Ionicons.logo_google, iconDataType: IconDataType.ionIcons),
  "ionicons at": const IconWrapper(
      iconData: Ionicons.at, iconDataType: IconDataType.ionIcons),
  "ionicons qr code": const IconWrapper(
      iconData: Ionicons.qr_code, iconDataType: IconDataType.ionIcons),
  "ionicons share social": const IconWrapper(
      iconData: Ionicons.share_social, iconDataType: IconDataType.ionIcons),
  "ionicons images": const IconWrapper(
      iconData: Ionicons.images, iconDataType: IconDataType.ionIcons),
  "ionicons logo stencil": const IconWrapper(
      iconData: Ionicons.logo_stencil, iconDataType: IconDataType.ionIcons),
  "ionicons logo nodejs": const IconWrapper(
      iconData: Ionicons.logo_nodejs, iconDataType: IconDataType.ionIcons),
  "ionicons checkmark": const IconWrapper(
      iconData: Ionicons.checkmark, iconDataType: IconDataType.ionIcons),
  "ionicons journal": const IconWrapper(
      iconData: Ionicons.journal, iconDataType: IconDataType.ionIcons),
  "ionicons logo apple": const IconWrapper(
      iconData: Ionicons.logo_apple, iconDataType: IconDataType.ionIcons),
  "ionicons basket": const IconWrapper(
      iconData: Ionicons.basket, iconDataType: IconDataType.ionIcons),
  "ionicons extension puzzle": const IconWrapper(
      iconData: Ionicons.extension_puzzle, iconDataType: IconDataType.ionIcons),
  "ionicons bag handle": const IconWrapper(
      iconData: Ionicons.bag_handle, iconDataType: IconDataType.ionIcons),
  "ionicons document": const IconWrapper(
      iconData: Ionicons.document, iconDataType: IconDataType.ionIcons),
  "ionicons enter": const IconWrapper(
      iconData: Ionicons.enter, iconDataType: IconDataType.ionIcons),
  "ionicons bar chart": const IconWrapper(
      iconData: Ionicons.bar_chart, iconDataType: IconDataType.ionIcons),
  "ionicons logo ionic": const IconWrapper(
      iconData: Ionicons.logo_ionic, iconDataType: IconDataType.ionIcons),
  "ionicons logo angular": const IconWrapper(
      iconData: Ionicons.logo_angular, iconDataType: IconDataType.ionIcons),
  "ionicons caret down circle": const IconWrapper(
      iconData: Ionicons.caret_down_circle,
      iconDataType: IconDataType.ionIcons),
  "ionicons play skip forward circle": const IconWrapper(
      iconData: Ionicons.play_skip_forward_circle,
      iconDataType: IconDataType.ionIcons),
  "ionicons triangle": const IconWrapper(
      iconData: Ionicons.triangle, iconDataType: IconDataType.ionIcons),
  "ionicons logo react": const IconWrapper(
      iconData: Ionicons.logo_react, iconDataType: IconDataType.ionIcons),
  "ionicons sync circle": const IconWrapper(
      iconData: Ionicons.sync_circle, iconDataType: IconDataType.ionIcons),
  "ionicons diamond": const IconWrapper(
      iconData: Ionicons.diamond, iconDataType: IconDataType.ionIcons),
  "ionicons folder": const IconWrapper(
      iconData: Ionicons.folder, iconDataType: IconDataType.ionIcons),
  "ionicons clipboard": const IconWrapper(
      iconData: Ionicons.clipboard, iconDataType: IconDataType.ionIcons),
  "ionicons arrow redo circle": const IconWrapper(
      iconData: Ionicons.arrow_redo_circle,
      iconDataType: IconDataType.ionIcons),
  "ionicons beaker": const IconWrapper(
      iconData: Ionicons.beaker, iconDataType: IconDataType.ionIcons),
  "ionicons logo skype": const IconWrapper(
      iconData: Ionicons.logo_skype, iconDataType: IconDataType.ionIcons),
  "ionicons copy": const IconWrapper(
      iconData: Ionicons.copy, iconDataType: IconDataType.ionIcons),
  "ionicons crop": const IconWrapper(
      iconData: Ionicons.crop, iconDataType: IconDataType.ionIcons),
  "ionicons refresh": const IconWrapper(
      iconData: Ionicons.refresh, iconDataType: IconDataType.ionIcons),
  "ionicons logo amazon": const IconWrapper(
      iconData: Ionicons.logo_amazon, iconDataType: IconDataType.ionIcons),
  "ionicons star": const IconWrapper(
      iconData: Ionicons.star, iconDataType: IconDataType.ionIcons),
  "ionicons disc": const IconWrapper(
      iconData: Ionicons.disc, iconDataType: IconDataType.ionIcons),
  "ionicons trail sign": const IconWrapper(
      iconData: Ionicons.trail_sign, iconDataType: IconDataType.ionIcons),
  "ionicons rocket": const IconWrapper(
      iconData: Ionicons.rocket, iconDataType: IconDataType.ionIcons),
  "ionicons help buoy": const IconWrapper(
      iconData: Ionicons.help_buoy, iconDataType: IconDataType.ionIcons),
  "ionicons funnel": const IconWrapper(
      iconData: Ionicons.funnel, iconDataType: IconDataType.ionIcons),
  "ionicons logo vk": const IconWrapper(
      iconData: Ionicons.logo_vk, iconDataType: IconDataType.ionIcons),
  "ionicons construct": const IconWrapper(
      iconData: Ionicons.construct, iconDataType: IconDataType.ionIcons),
  "ionicons build": const IconWrapper(
      iconData: Ionicons.build, iconDataType: IconDataType.ionIcons),
  "ionicons pie chart": const IconWrapper(
      iconData: Ionicons.pie_chart, iconDataType: IconDataType.ionIcons),
  "ionicons information circle": const IconWrapper(
      iconData: Ionicons.information_circle,
      iconDataType: IconDataType.ionIcons),
  "ionicons heart": const IconWrapper(
      iconData: Ionicons.heart, iconDataType: IconDataType.ionIcons),
  "ionicons megaphone": const IconWrapper(
      iconData: Ionicons.megaphone, iconDataType: IconDataType.ionIcons),
  "ionicons cash": const IconWrapper(
      iconData: Ionicons.cash, iconDataType: IconDataType.ionIcons),
  "ionicons menu": const IconWrapper(
      iconData: Ionicons.menu, iconDataType: IconDataType.ionIcons),
  "ionicons cloud": const IconWrapper(
      iconData: Ionicons.cloud, iconDataType: IconDataType.ionIcons),
  "ionicons logo codepen": const IconWrapper(
      iconData: Ionicons.logo_codepen, iconDataType: IconDataType.ionIcons),
  "ionicons alarm": const IconWrapper(
      iconData: Ionicons.alarm, iconDataType: IconDataType.ionIcons),
  "ionicons logo vercel": const IconWrapper(
      iconData: Ionicons.logo_vercel, iconDataType: IconDataType.ionIcons),
  "ionicons logo alipay": const IconWrapper(
      iconData: Ionicons.logo_alipay, iconDataType: IconDataType.ionIcons),
  "ionicons pin": const IconWrapper(
      iconData: Ionicons.pin, iconDataType: IconDataType.ionIcons),
  "ionicons desktop": const IconWrapper(
      iconData: Ionicons.desktop, iconDataType: IconDataType.ionIcons),
  "ionicons text": const IconWrapper(
      iconData: Ionicons.text, iconDataType: IconDataType.ionIcons),
  "ionicons logo flickr": const IconWrapper(
      iconData: Ionicons.logo_flickr, iconDataType: IconDataType.ionIcons),
  "ionicons logo yen": const IconWrapper(
      iconData: Ionicons.logo_yen, iconDataType: IconDataType.ionIcons),
  "ionicons logo dribbble": const IconWrapper(
      iconData: Ionicons.logo_dribbble, iconDataType: IconDataType.ionIcons),
  "ionicons shuffle": const IconWrapper(
      iconData: Ionicons.shuffle, iconDataType: IconDataType.ionIcons),
  "ionicons camera reverse": const IconWrapper(
      iconData: Ionicons.camera_reverse, iconDataType: IconDataType.ionIcons),
  "ionicons egg": const IconWrapper(
      iconData: Ionicons.egg, iconDataType: IconDataType.ionIcons),
  "ionicons chatbubble": const IconWrapper(
      iconData: Ionicons.chatbubble, iconDataType: IconDataType.ionIcons),
  "ionicons eye off": const IconWrapper(
      iconData: Ionicons.eye_off, iconDataType: IconDataType.ionIcons),
  "ionicons people circle": const IconWrapper(
      iconData: Ionicons.people_circle, iconDataType: IconDataType.ionIcons),
  "ionicons power": const IconWrapper(
      iconData: Ionicons.power, iconDataType: IconDataType.ionIcons),
  "ionicons play skip back circle": const IconWrapper(
      iconData: Ionicons.play_skip_back_circle,
      iconDataType: IconDataType.ionIcons),
  "ionicons logo vimeo": const IconWrapper(
      iconData: Ionicons.logo_vimeo, iconDataType: IconDataType.ionIcons),
  "ionicons exit": const IconWrapper(
      iconData: Ionicons.exit, iconDataType: IconDataType.ionIcons),
  "ionicons albums": const IconWrapper(
      iconData: Ionicons.albums, iconDataType: IconDataType.ionIcons),
  "ionicons notifications off": const IconWrapper(
      iconData: Ionicons.notifications_off,
      iconDataType: IconDataType.ionIcons),
  "ionicons ribbon": const IconWrapper(
      iconData: Ionicons.ribbon, iconDataType: IconDataType.ionIcons),
  "ionicons wallet": const IconWrapper(
      iconData: Ionicons.wallet, iconDataType: IconDataType.ionIcons),
  "ionicons reorder three": const IconWrapper(
      iconData: Ionicons.reorder_three, iconDataType: IconDataType.ionIcons),
  "ionicons logo venmo": const IconWrapper(
      iconData: Ionicons.logo_venmo, iconDataType: IconDataType.ionIcons),
  "ionicons arrow down": const IconWrapper(
      iconData: Ionicons.arrow_down, iconDataType: IconDataType.ionIcons),
  "ionicons prism": const IconWrapper(
      iconData: Ionicons.prism, iconDataType: IconDataType.ionIcons),
  "ionicons stop": const IconWrapper(
      iconData: Ionicons.stop, iconDataType: IconDataType.ionIcons),
  "ionicons logo stackoverflow": const IconWrapper(
      iconData: Ionicons.logo_stackoverflow,
      iconDataType: IconDataType.ionIcons),
  "ionicons logo firefox": const IconWrapper(
      iconData: Ionicons.logo_firefox, iconDataType: IconDataType.ionIcons),
  "ionicons cloud circle": const IconWrapper(
      iconData: Ionicons.cloud_circle, iconDataType: IconDataType.ionIcons),
  "ionicons square": const IconWrapper(
      iconData: Ionicons.square, iconDataType: IconDataType.ionIcons),
  "ionicons logo closed captioning": const IconWrapper(
      iconData: Ionicons.logo_closed_captioning,
      iconDataType: IconDataType.ionIcons),
  "ionicons footsteps": const IconWrapper(
      iconData: Ionicons.footsteps, iconDataType: IconDataType.ionIcons),
  "ionicons boat": const IconWrapper(
      iconData: Ionicons.boat, iconDataType: IconDataType.ionIcons),
  "ionicons code": const IconWrapper(
      iconData: Ionicons.code, iconDataType: IconDataType.ionIcons),
  "ionicons bag check": const IconWrapper(
      iconData: Ionicons.bag_check, iconDataType: IconDataType.ionIcons),
  "ionicons log out": const IconWrapper(
      iconData: Ionicons.log_out, iconDataType: IconDataType.ionIcons),
  "ionicons logo snapchat": const IconWrapper(
      iconData: Ionicons.logo_snapchat, iconDataType: IconDataType.ionIcons),
  "ionicons flame": const IconWrapper(
      iconData: Ionicons.flame, iconDataType: IconDataType.ionIcons),
  "ionicons logo markdown": const IconWrapper(
      iconData: Ionicons.logo_markdown, iconDataType: IconDataType.ionIcons),
  "ionicons logo firebase": const IconWrapper(
      iconData: Ionicons.logo_firebase, iconDataType: IconDataType.ionIcons),
  "ionicons logo apple ar": const IconWrapper(
      iconData: Ionicons.logo_apple_ar, iconDataType: IconDataType.ionIcons),
  "ionicons logo edge": const IconWrapper(
      iconData: Ionicons.logo_edge, iconDataType: IconDataType.ionIcons),
  "ionicons logo gitlab": const IconWrapper(
      iconData: Ionicons.logo_gitlab, iconDataType: IconDataType.ionIcons),
  "ionicons logo twitter": const IconWrapper(
      iconData: Ionicons.logo_twitter, iconDataType: IconDataType.ionIcons),
  "ionicons walk": const IconWrapper(
      iconData: Ionicons.walk, iconDataType: IconDataType.ionIcons),
  "ionicons heart dislike circle": const IconWrapper(
      iconData: Ionicons.heart_dislike_circle,
      iconDataType: IconDataType.ionIcons),
  "ionicons balloon": const IconWrapper(
      iconData: Ionicons.balloon, iconDataType: IconDataType.ionIcons),
  "ionicons phone landscape": const IconWrapper(
      iconData: Ionicons.phone_landscape, iconDataType: IconDataType.ionIcons),
  "ionicons git branch": const IconWrapper(
      iconData: Ionicons.git_branch, iconDataType: IconDataType.ionIcons),
  "ionicons compass": const IconWrapper(
      iconData: Ionicons.compass, iconDataType: IconDataType.ionIcons),
  "ionicons game controller": const IconWrapper(
      iconData: Ionicons.game_controller, iconDataType: IconDataType.ionIcons),
  "ionicons receipt": const IconWrapper(
      iconData: Ionicons.receipt, iconDataType: IconDataType.ionIcons),
  "ionicons list": const IconWrapper(
      iconData: Ionicons.list, iconDataType: IconDataType.ionIcons),
  "ionicons pencil": const IconWrapper(
      iconData: Ionicons.pencil, iconDataType: IconDataType.ionIcons),
  "ionicons eye": const IconWrapper(
      iconData: Ionicons.eye, iconDataType: IconDataType.ionIcons),
  "ionicons navigate circle": const IconWrapper(
      iconData: Ionicons.navigate_circle, iconDataType: IconDataType.ionIcons),
  "ionicons bookmarks": const IconWrapper(
      iconData: Ionicons.bookmarks, iconDataType: IconDataType.ionIcons),
  "ionicons medical": const IconWrapper(
      iconData: Ionicons.medical, iconDataType: IconDataType.ionIcons),
  "ionicons color filter": const IconWrapper(
      iconData: Ionicons.color_filter, iconDataType: IconDataType.ionIcons),
  "ionicons logo python": const IconWrapper(
      iconData: Ionicons.logo_python, iconDataType: IconDataType.ionIcons),
  "ionicons paper plane": const IconWrapper(
      iconData: Ionicons.paper_plane, iconDataType: IconDataType.ionIcons),
  "ionicons medkit": const IconWrapper(
      iconData: Ionicons.medkit, iconDataType: IconDataType.ionIcons),
  "ionicons call": const IconWrapper(
      iconData: Ionicons.call, iconDataType: IconDataType.ionIcons),
  "ionicons calendar clear": const IconWrapper(
      iconData: Ionicons.calendar_clear, iconDataType: IconDataType.ionIcons),
  "ionicons cloudy night": const IconWrapper(
      iconData: Ionicons.cloudy_night, iconDataType: IconDataType.ionIcons),
  "ionicons earth": const IconWrapper(
      iconData: Ionicons.earth, iconDataType: IconDataType.ionIcons),
  "ionicons thunderstorm": const IconWrapper(
      iconData: Ionicons.thunderstorm, iconDataType: IconDataType.ionIcons),
  "ionicons nuclear": const IconWrapper(
      iconData: Ionicons.nuclear, iconDataType: IconDataType.ionIcons),
  "ionicons finger print": const IconWrapper(
      iconData: Ionicons.finger_print, iconDataType: IconDataType.ionIcons),
  "ionicons heart half": const IconWrapper(
      iconData: Ionicons.heart_half, iconDataType: IconDataType.ionIcons),
  "ionicons play": const IconWrapper(
      iconData: Ionicons.play, iconDataType: IconDataType.ionIcons),
  "ionicons checkmark done circle": const IconWrapper(
      iconData: Ionicons.checkmark_done_circle,
      iconDataType: IconDataType.ionIcons),
  "ionicons shield checkmark": const IconWrapper(
      iconData: Ionicons.shield_checkmark, iconDataType: IconDataType.ionIcons),
  "ionicons logo linkedin": const IconWrapper(
      iconData: Ionicons.logo_linkedin, iconDataType: IconDataType.ionIcons),
  "ionicons logo docker": const IconWrapper(
      iconData: Ionicons.logo_docker, iconDataType: IconDataType.ionIcons),
  "ionicons water": const IconWrapper(
      iconData: Ionicons.water, iconDataType: IconDataType.ionIcons),
  "ionicons rainy": const IconWrapper(
      iconData: Ionicons.rainy, iconDataType: IconDataType.ionIcons),
  "ionicons magnet": const IconWrapper(
      iconData: Ionicons.magnet, iconDataType: IconDataType.ionIcons),
  "ionicons logo tiktok": const IconWrapper(
      iconData: Ionicons.logo_tiktok, iconDataType: IconDataType.ionIcons),
  "ionicons cafe": const IconWrapper(
      iconData: Ionicons.cafe, iconDataType: IconDataType.ionIcons),
  "ionicons logo hackernews": const IconWrapper(
      iconData: Ionicons.logo_hackernews, iconDataType: IconDataType.ionIcons),
  "ionicons today": const IconWrapper(
      iconData: Ionicons.today, iconDataType: IconDataType.ionIcons),
  "ionicons invert mode": const IconWrapper(
      iconData: Ionicons.invert_mode, iconDataType: IconDataType.ionIcons),
  "ionicons infinite": const IconWrapper(
      iconData: Ionicons.infinite, iconDataType: IconDataType.ionIcons),
  "ionicons color wand": const IconWrapper(
      iconData: Ionicons.color_wand, iconDataType: IconDataType.ionIcons),
  "ionicons warning": const IconWrapper(
      iconData: Ionicons.warning, iconDataType: IconDataType.ionIcons),
  "ionicons pizza": const IconWrapper(
      iconData: Ionicons.pizza, iconDataType: IconDataType.ionIcons),
  "ionicons moon": const IconWrapper(
      iconData: Ionicons.moon, iconDataType: IconDataType.ionIcons),
  "ionicons arrow up": const IconWrapper(
      iconData: Ionicons.arrow_up, iconDataType: IconDataType.ionIcons),
  "ionicons nutrition": const IconWrapper(
      iconData: Ionicons.nutrition, iconDataType: IconDataType.ionIcons),
  "ionicons card": const IconWrapper(
      iconData: Ionicons.card, iconDataType: IconDataType.ionIcons),
  "ionicons return up forward": const IconWrapper(
      iconData: Ionicons.return_up_forward,
      iconDataType: IconDataType.ionIcons),
  "ionicons tablet landscape": const IconWrapper(
      iconData: Ionicons.tablet_landscape, iconDataType: IconDataType.ionIcons),
  "ionicons color fill": const IconWrapper(
      iconData: Ionicons.color_fill, iconDataType: IconDataType.ionIcons),
  "ionicons calendar number": const IconWrapper(
      iconData: Ionicons.calendar_number, iconDataType: IconDataType.ionIcons),
  "ionicons restaurant": const IconWrapper(
      iconData: Ionicons.restaurant, iconDataType: IconDataType.ionIcons),
  "ionicons basketball": const IconWrapper(
      iconData: Ionicons.basketball, iconDataType: IconDataType.ionIcons),
  "ionicons remove circle": const IconWrapper(
      iconData: Ionicons.remove_circle, iconDataType: IconDataType.ionIcons),
  "ionicons arrow down circle": const IconWrapper(
      iconData: Ionicons.arrow_down_circle,
      iconDataType: IconDataType.ionIcons),
  "ionicons logo deviantart": const IconWrapper(
      iconData: Ionicons.logo_deviantart, iconDataType: IconDataType.ionIcons),
  "ionicons browsers": const IconWrapper(
      iconData: Ionicons.browsers, iconDataType: IconDataType.ionIcons),
  "ionicons telescope": const IconWrapper(
      iconData: Ionicons.telescope, iconDataType: IconDataType.ionIcons),
  "ionicons logo pwa": const IconWrapper(
      iconData: Ionicons.logo_pwa, iconDataType: IconDataType.ionIcons),
  "ionicons snow": const IconWrapper(
      iconData: Ionicons.snow, iconDataType: IconDataType.ionIcons),
  "ionicons planet": const IconWrapper(
      iconData: Ionicons.planet, iconDataType: IconDataType.ionIcons),
  "ionicons swap vertical": const IconWrapper(
      iconData: Ionicons.swap_vertical, iconDataType: IconDataType.ionIcons),
  "ionicons notifications circle": const IconWrapper(
      iconData: Ionicons.notifications_circle,
      iconDataType: IconDataType.ionIcons),
  "ionicons airplane": const IconWrapper(
      iconData: Ionicons.airplane, iconDataType: IconDataType.ionIcons),
  "ionicons notifications off circle": const IconWrapper(
      iconData: Ionicons.notifications_off_circle,
      iconDataType: IconDataType.ionIcons),
  "ionicons cloud upload": const IconWrapper(
      iconData: Ionicons.cloud_upload, iconDataType: IconDataType.ionIcons),
  "ionicons print": const IconWrapper(
      iconData: Ionicons.print, iconDataType: IconDataType.ionIcons),
  "ionicons bus": const IconWrapper(
      iconData: Ionicons.bus, iconDataType: IconDataType.ionIcons),
  "ionicons book": const IconWrapper(
      iconData: Ionicons.book, iconDataType: IconDataType.ionIcons),
  "ionicons stop circle": const IconWrapper(
      iconData: Ionicons.stop_circle, iconDataType: IconDataType.ionIcons),
  "ionicons scale": const IconWrapper(
      iconData: Ionicons.scale, iconDataType: IconDataType.ionIcons),
  "ionicons arrow up circle": const IconWrapper(
      iconData: Ionicons.arrow_up_circle, iconDataType: IconDataType.ionIcons),
  "ionicons list circle": const IconWrapper(
      iconData: Ionicons.list_circle, iconDataType: IconDataType.ionIcons),
  "ionicons logo chrome": const IconWrapper(
      iconData: Ionicons.logo_chrome, iconDataType: IconDataType.ionIcons),
  "ionicons download": const IconWrapper(
      iconData: Ionicons.download, iconDataType: IconDataType.ionIcons),
  "ionicons fitness": const IconWrapper(
      iconData: Ionicons.fitness, iconDataType: IconDataType.ionIcons),
  "ionicons trending down": const IconWrapper(
      iconData: Ionicons.trending_down, iconDataType: IconDataType.ionIcons),
  "ionicons trash bin": const IconWrapper(
      iconData: Ionicons.trash_bin, iconDataType: IconDataType.ionIcons),
  "ionicons archive": const IconWrapper(
      iconData: Ionicons.archive, iconDataType: IconDataType.ionIcons),
  "ionicons logo paypal": const IconWrapper(
      iconData: Ionicons.logo_paypal, iconDataType: IconDataType.ionIcons),
  "ionicons body": const IconWrapper(
      iconData: Ionicons.body, iconDataType: IconDataType.ionIcons),
  "ionicons logo youtube": const IconWrapper(
      iconData: Ionicons.logo_youtube, iconDataType: IconDataType.ionIcons),
  "ionicons alert circle": const IconWrapper(
      iconData: Ionicons.alert_circle, iconDataType: IconDataType.ionIcons),
  "ionicons information": const IconWrapper(
      iconData: Ionicons.information, iconDataType: IconDataType.ionIcons),
  "ionicons send": const IconWrapper(
      iconData: Ionicons.send, iconDataType: IconDataType.ionIcons),
  "ionicons cut": const IconWrapper(
      iconData: Ionicons.cut, iconDataType: IconDataType.ionIcons),
  "ionicons help": const IconWrapper(
      iconData: Ionicons.help, iconDataType: IconDataType.ionIcons),
  "ionicons person": const IconWrapper(
      iconData: Ionicons.person, iconDataType: IconDataType.ionIcons),
  "ionicons git pull request": const IconWrapper(
      iconData: Ionicons.git_pull_request, iconDataType: IconDataType.ionIcons),
  "ionicons radio button off": const IconWrapper(
      iconData: Ionicons.radio_button_off, iconDataType: IconDataType.ionIcons),
  "ionicons open": const IconWrapper(
      iconData: Ionicons.open, iconDataType: IconDataType.ionIcons),
  "ionicons cloudy": const IconWrapper(
      iconData: Ionicons.cloudy, iconDataType: IconDataType.ionIcons),
  "ionicons chatbubble ellipses": const IconWrapper(
      iconData: Ionicons.chatbubble_ellipses,
      iconDataType: IconDataType.ionIcons),
  "ionicons logo slack": const IconWrapper(
      iconData: Ionicons.logo_slack, iconDataType: IconDataType.ionIcons),
  "ionicons reorder four": const IconWrapper(
      iconData: Ionicons.reorder_four, iconDataType: IconDataType.ionIcons),
  "ionicons logo android": const IconWrapper(
      iconData: Ionicons.logo_android, iconDataType: IconDataType.ionIcons),
  "ionicons bluetooth": const IconWrapper(
      iconData: Ionicons.bluetooth, iconDataType: IconDataType.ionIcons),
  "ionicons car sport": const IconWrapper(
      iconData: Ionicons.car_sport, iconDataType: IconDataType.ionIcons),
  "ionicons paw": const IconWrapper(
      iconData: Ionicons.paw, iconDataType: IconDataType.ionIcons),
  "ionicons partly sunny": const IconWrapper(
      iconData: Ionicons.partly_sunny, iconDataType: IconDataType.ionIcons),
  "ionicons logo instagram": const IconWrapper(
      iconData: Ionicons.logo_instagram, iconDataType: IconDataType.ionIcons),
  "ionicons battery half": const IconWrapper(
      iconData: Ionicons.battery_half, iconDataType: IconDataType.ionIcons),
  "ionicons car": const IconWrapper(
      iconData: Ionicons.car, iconDataType: IconDataType.ionIcons),
  "ionicons notifications": const IconWrapper(
      iconData: Ionicons.notifications, iconDataType: IconDataType.ionIcons),
  "ionicons play circle": const IconWrapper(
      iconData: Ionicons.play_circle, iconDataType: IconDataType.ionIcons),
  "ionicons transgender": const IconWrapper(
      iconData: Ionicons.transgender, iconDataType: IconDataType.ionIcons),
  "ionicons thumbs up": const IconWrapper(
      iconData: Ionicons.thumbs_up, iconDataType: IconDataType.ionIcons),
  "ionicons speedometer": const IconWrapper(
      iconData: Ionicons.speedometer, iconDataType: IconDataType.ionIcons),
  "ionicons checkmark circle": const IconWrapper(
      iconData: Ionicons.checkmark_circle, iconDataType: IconDataType.ionIcons),
  "ionicons map": const IconWrapper(
      iconData: Ionicons.map, iconDataType: IconDataType.ionIcons),
  "ionicons cog": const IconWrapper(
      iconData: Ionicons.cog, iconDataType: IconDataType.ionIcons),
  "ionicons grid": const IconWrapper(
      iconData: Ionicons.grid, iconDataType: IconDataType.ionIcons)

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
