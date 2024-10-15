enum CustomActionType { applyTheme }

abstract class CustomAction {
  final CustomActionType type;
  CustomAction({required this.type});

  Map<String, dynamic> toJson();

  factory CustomAction.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError("");
  }
}
