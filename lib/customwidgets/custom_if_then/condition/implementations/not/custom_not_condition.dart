import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_if_then/condition/custom_condition.dart';
part 'custom_not_condition.freezed.dart';
part 'custom_not_condition.g.dart';

@unfreezed
class CustomNotCondtion with _$CustomNotCondtion implements CustomCondition {
  @Implements<CustomCondition>()
  factory CustomNotCondtion(
      {required ConditionType type,
      required CustomCondition condition}) = _CustomNotCondtion;

  @override
  bool toBoolean() {
    return !condition.toBoolean();
  }

  @override
  const CustomNotCondtion._();

  @override
  factory CustomNotCondtion.fromJson(Map<String, dynamic> json) =>
      _$CustomNotCondtionFromJson(json);
}
