import 'package:freezed_annotation/freezed_annotation.dart';
part 'custom_if_then.freezed.dart';
part 'custom_if_then.g.dart';

@unfreezed
class CustomIfThen with _$CustomIfThen {
  factory CustomIfThen() = _CustomAction;

  @override
  factory CustomIfThen.fromJson(Map<String, dynamic> json) =>
      _$CustomIfThenFromJson(json);
}
