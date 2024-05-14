import 'package:smart_home/customwidgets/custom_widget.dart';
import 'package:smart_home/customwidgets/widgets/view/settings/light_widget_settings.dart';

abstract class CustomWidget {
  final String name;
  CustomWidget({required this.name});

  CustomWidgetSettingWidget get settingsPage;
}
