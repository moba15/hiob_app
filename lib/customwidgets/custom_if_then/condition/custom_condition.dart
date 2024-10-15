import 'package:freezed_annotation/freezed_annotation.dart';
part 'custom_condition.freezed.dart';
part 'custom_condition.g.dart';

@unfreezed
class CustomCondition with _$CustomCondition {
  factory CustomCondition() = _CustomCondition;

  @override
  factory CustomCondition.fromJson(Map<String, dynamic> json) =>
      _$CustomConditionFromJson(json);
}
