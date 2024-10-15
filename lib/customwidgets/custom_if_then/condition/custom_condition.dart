enum ConditionType { and, or, not, stateValue }

abstract class CustomCondition {
  final ConditionType type;
  CustomCondition({required this.type});

  Map<String, dynamic> toJson();

  bool toBoolean();

  @override
  factory CustomCondition.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError("");
  }
}

extension CustomConditionExt on CustomCondition {
  //TODO test if this works for &&
  bool operator &(CustomCondition condition) =>
      toBoolean() && condition.toBoolean();
}
