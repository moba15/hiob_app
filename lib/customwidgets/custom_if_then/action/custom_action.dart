import 'package:freezed_annotation/freezed_annotation.dart';
part 'custom_action.freezed.dart';
part 'custom_action.g.dart';

@unfreezed
class CustomAction with _$CustomAction {
  factory CustomAction() = _CustomAction;

  @override
  factory CustomAction.fromJson(Map<String, dynamic> json) =>
      _$CustomActionFromJson(json);
}
