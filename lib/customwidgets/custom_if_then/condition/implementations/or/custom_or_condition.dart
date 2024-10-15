import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_if_then/condition/custom_condition.dart';
part 'custom_or_condition.freezed.dart';
part 'custom_or_condition.g.dart';

@unfreezed
class CustomOrCondtion with _$CustomOrCondtion implements CustomCondition {
  @Implements<CustomCondition>()
  factory CustomOrCondtion(
      {required ConditionType type,
      required List<CustomCondition> conditions}) = _CustomOrCondtion;
  //TODO Maybe performance optimisation
  @override
  bool toBoolean() {
    return conditions
        .map<bool>(
      (e) => e.toBoolean(),
    )
        .reduce(
      (value, element) {
        return value || value;
      },
    );
  }

  @override
  const CustomOrCondtion._();

  @override
  factory CustomOrCondtion.fromJson(Map<String, dynamic> json) =>
      _$CustomOrCondtionFromJson(json);
}
