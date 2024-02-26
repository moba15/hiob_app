import 'package:flutter/cupertino.dart';
import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/templates/custom_widget_template.dart';
import 'package:smart_home/customwidgets/widgets/view/alert_dialog_widget_view.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/alert_dialog_settings.dart';
import 'package:smart_home/manager/manager.dart';

class CustomAlertDialogWidget extends CustomWidget {
  List<CustomWidgetTemplate>? templates;
  String? title;

  CustomAlertDialogWidget({required String? name, this.templates, this.title})
      : super(name: name, type: CustomWidgetType.alertDialog, settings: {});

  factory CustomAlertDialogWidget.fromJSON(Map<String, dynamic> json) {
    List<Map<String, dynamic>> rawTemplates =
        List.from(json["templates"] ?? []);
    List<CustomWidgetTemplate> t =
        Manager.instance.customWidgetManager.loadTemplate(rawTemplates);
    return CustomAlertDialogWidget(
        name: json["name"], templates: t, title: json["title"]);
  }

  @override
  CustomWidget clone() {
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
