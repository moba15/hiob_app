import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_if_then/condition/custom_condition.dart';
import 'package:smart_home/device/datapoint/converter/datapoint_converter.dart';
import 'package:smart_home/device/state/state.dart';
part 'custom_boolean_condtion.freezed.dart';
part 'custom_boolean_condtion.g.dart';

@unfreezed
class CustomBooleanCondtion
    with _$CustomBooleanCondtion
    implements CustomCondition {
  @Implements<CustomCondition>()
  factory CustomBooleanCondtion(
          {required ConditionType type,
          @DataPointIdConverter() required DataPoint? datapoint}) =
      _CustomBooleanCondtion;

  @override
  bool toBoolean() {
    return datapoint?.value == true;
  }

  @override
  const CustomBooleanCondtion._();

  @override
  factory CustomBooleanCondtion.fromJson(Map<String, dynamic> json) =>
      _$CustomBooleanCondtionFromJson(json);
}
