import 'package:flutter/cupertino.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/custom_widget_rework_wrapper.dart';
import 'package:smart_home/customwidgets/widgets/view/alert_dialog_widget_view.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/alert_dialog_settings.dart';
import 'package:smart_home/manager/manager.dart';

class CustomAlertDialogWidget extends CustomWidgetDeprecated {
  List<CustomWidgetWrapper>? templates;
  String? title;

  CustomAlertDialogWidget({required String? name, this.templates, this.title})
      : super(
            name: name,
            type: CustomWidgetTypeDeprecated.alertDialog,
            settings: {});

  factory CustomAlertDialogWidget.fromJSON(Map<String, dynamic> json) {
    List<Map<String, dynamic>> rawTemplates =
        List.from(json["templates"] ?? []);
    List<CustomWidgetWrapper> t =
        Manager.instance.customWidgetManager.loadTemplate(rawTemplates);
    return CustomAlertDialogWidget(
        name: json["name"], templates: t, title: json["title"]);
  }

  @override
  CustomWidgetDeprecated clone() {
    return CustomAlertDialogWidget(
        name: name, templates: List.from(templates ?? []));
  }

  @override
  // TODO: implement settingWidget
  CustomWidgetSettingWidget get settingWidget =>
      AlertDialogSettings(customAlertDialogWidget: this);

  @override
  Map<String, dynamic> toJson() => {
        "type": type.toString(),
        "name": name,
        "templates": templates,
        "title": title,
      };

  @override
  // TODO: implement widget
  Widget get widget {
    if (!Manager().generalManager.useBottomSheet) {
      return AlterDialogWidgetView(customAlertDialogWidget: this);
    } else {
      return BottomSheetWidget(customAlertDialogWidget: this);
    }
  }
}
