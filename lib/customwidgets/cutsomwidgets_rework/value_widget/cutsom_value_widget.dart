import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_widget.dart' as old;
import 'package:smart_home/customwidgets/cutsomwidgets_rework/cutsom_widget.dart';
import 'package:smart_home/device/datapoint/converter/datapoint_converter.dart';
import 'package:smart_home/device/datapoint/datapoint.dart';
part 'cutsom_value_widget.freezed.dart';
part 'cutsom_value_widget.g.dart';

@unfreezed
class CustomValueWidget with _$CustomValueWidget {
  const CustomValueWidget._();
  @Implements<CustomWidget>()
  factory CustomValueWidget({
    required String name,
    required String displayName,
    @DataPointIdConverter() required DataPoint? dataPoint,
  }) = _CustomValueWidget;

  old.CustomWidgetSettingWidget get settingsPage {
    throw UnimplementedError();
  }

  factory CustomValueWidget.fromJson(Map<String, dynamic> json) =>
      _$CustomValueWidgetFromJson(json);
}
