import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/button/custom_button_widget.dart';
import 'package:smart_home/device/state/state.dart';

import '../input/custom_input_widget_test.mocks.dart';

@GenerateNiceMocks([MockSpec<DataPoint>()])
void main() {
  late CustomButtonWidget customButtonWidget;
  late MockDataPoint mockDataPoint;
  group("Test basic", () {
    testWidgets("Test null datapoint", (tester) async {});
  });
}
