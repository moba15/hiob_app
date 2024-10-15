import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_home/customwidgets/custom_if_then/condition/custom_condition.dart';
part 'custom_and_condtion.freezed.dart';
part 'custom_and_condtion.g.dart';

@unfreezed
class CustomAndCondtion with _$CustomAndCondtion implements CustomCondition {
  @Implements<CustomCondition>()
  factory CustomAndCondtion(
      {required ConditionType type,
      required List<CustomCondition> conditions}) = _CustomAndCondtion;

  //TODO Maybe performance optimisation
  @override
  bool toBoolean() {
    return conditions
        .map<bool>(
      (e) => e.toBoolean(),
    )
        .reduce(
      (value, element) {
        return value && element;
      },
    );
  }

  @override
  const CustomAndCondtion._();

  @override
  factory CustomAndCondtion.fromJson(Map<String, dynamic> json) =>
      _$CustomAndCondtionFromJson(json);
}
