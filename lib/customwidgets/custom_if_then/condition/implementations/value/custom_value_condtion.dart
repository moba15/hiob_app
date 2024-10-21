import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_if_then/condition/custom_condition.dart';
import 'package:smart_home/device/datapoint/converter/datapoint_converter.dart';
import 'package:smart_home/device/state/state.dart';
part 'custom_value_condtion.freezed.dart';
part 'custom_value_condtion.g.dart';

enum ValueConditionType {
  equal,
  equalIgnoreCase,
  startWith,
  endsWith,
  contains
}

@unfreezed
class CustomValueCondtion
    with _$CustomValueCondtion
    implements CustomCondition {
  @Implements<CustomCondition>()
  factory CustomValueCondtion(
      {required ConditionType type,
      @DataPointIdConverter() required DataPoint? datapoint,
      dynamic value,
      required ValueConditionType valueConditionType}) = _CustomValueCondtion;

  @override
  bool toBoolean() {
    switch (valueConditionType) {
      case ValueConditionType.equal:
        return datapoint?.value == value;
      case ValueConditionType.equalIgnoreCase:
        return datapoint?.value.toString().toLowerCase() ==
            value.toString().toLowerCase();
      case ValueConditionType.startWith:
        return datapoint?.value.toString().startsWith(value.toString()) ??
            false;
      case ValueConditionType.endsWith:
        return datapoint?.value.toString().endsWith(value.toString()) ?? false;
      case ValueConditionType.contains:
        return datapoint?.value.toString().contains(value.toString()) ?? false;
    }
  }

  @override
  const CustomValueCondtion._();

  @override
  factory CustomValueCondtion.fromJson(Map<String, dynamic> json) =>
      _$CustomValueCondtionFromJson(json);
}
