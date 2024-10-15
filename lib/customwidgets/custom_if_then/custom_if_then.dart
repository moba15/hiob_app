import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_if_then/action/custom_action.dart';
import 'package:smart_home/customwidgets/custom_if_then/condition/custom_condition.dart';
part 'custom_if_then.freezed.dart';
part 'custom_if_then.g.dart';

@unfreezed
class CustomIfThen with _$CustomIfThen {
  factory CustomIfThen(
      {CustomCondition? customCondition,
      List<CustomAction>? customActions}) = _CustomAction;
  @override
  factory CustomIfThen.fromJson(Map<String, dynamic> json) =>
      _$CustomIfThenFromJson(json);
}
