import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/input_widget/custom_input_widget.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/input_widget/view/custom_input_widget_view.dart';
import 'package:smart_home/device/state/state.dart';

import 'custom_input_widget_test.mocks.dart';

@GenerateNiceMocks([MockSpec<DataPoint>()])
void main() {
  late CustomInputWidget customInputWidget;
  late MockDataPoint mockDataPoint;

  group("Test basic features", () {
    setUp(() {
      mockDataPoint = MockDataPoint();
      customInputWidget = CustomInputWidget(
          id: "id",
          name: "name",
          dataPoint: mockDataPoint,
          customInputDisplayConentType: CustomInputDisplayConentType.hintText);
    });

    testWidgets("Test CustomInputSendMethod null datapoint", (tester) async {
      when(mockDataPoint.value).thenReturn("asdasd");
      when(mockDataPoint.valueStreamController)
          .thenReturn(StreamController.broadcast());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CustomInputWidgetView(
              customInputWidget:
                  CustomInputWidget(id: "id", name: "name", dataPoint: null)),
        ),
      ));
      await tester.pump();

      expect(find.byType(Text), findsOneWidget);
      expect(find.byType(TextField), findsNothing);

      await tester.pumpAndSettle();
    });
  });
  group("Test display types", () {
    setUp(() {
      mockDataPoint = MockDataPoint();
      customInputWidget = CustomInputWidget(
          id: "id",
          name: "name",
          dataPoint: mockDataPoint,
          customInputDisplayConentType: CustomInputDisplayConentType.hintText);
    });

    testWidgets("Test CustomInputSendMethod hintText", (tester) async {
      customInputWidget.customInputDisplayConentType =
          CustomInputDisplayConentType.hintText;
      String value = "asdasd";
      when(mockDataPoint.value).thenReturn(value);
      when(mockDataPoint.valueStreamController)
          .thenReturn(StreamController.broadcast());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CustomInputWidgetView(customInputWidget: customInputWidget),
        ),
      ));
      await tester.pump();

      expect(find.byType(TextField), findsOneWidget);
      expect(
          tester.widget<TextField>(find.byType(TextField)).decoration!.hintText,
          value);

      await tester.pumpAndSettle();
    });

    testWidgets("Test CustomInputSendMethod label", (tester) async {
      customInputWidget.customInputDisplayConentType =
          CustomInputDisplayConentType.labelText;
      String value = "asdasd";
      when(mockDataPoint.value).thenReturn(value);
      when(mockDataPoint.valueStreamController)
          .thenReturn(StreamController.broadcast());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CustomInputWidgetView(customInputWidget: customInputWidget),
        ),
      ));
      await tester.pump();

      expect(find.byType(TextField), findsOneWidget);
      expect(
          (tester.widget<TextField>(find.byType(TextField)).decoration!.label
                  as Text)
              .data,
          value);

      await tester.pumpAndSettle();
    });

    testWidgets("Test CustomInputSendMethod value", (tester) async {
      customInputWidget.customInputDisplayConentType =
          CustomInputDisplayConentType.value;
      String value = "asdasd";
      when(mockDataPoint.value).thenReturn(value);
      when(mockDataPoint.valueStreamController)
          .thenReturn(StreamController.broadcast());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CustomInputWidgetView(customInputWidget: customInputWidget),
        ),
      ));
      await tester.pump();

      expect(find.byType(TextField), findsOneWidget);
      expect(
          tester
              .widget<TextField>(find.byType(TextField))
              .controller!
              .value
              .text,
          value);

      await tester.pumpAndSettle();
    });

    testWidgets("Test CustomInputSendMethod noShow", (tester) async {
      customInputWidget.customInputDisplayConentType =
          CustomInputDisplayConentType.noShow;
      String value = "asdasd";
      when(mockDataPoint.value).thenReturn(value);
      when(mockDataPoint.valueStreamController)
          .thenReturn(StreamController.broadcast());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CustomInputWidgetView(customInputWidget: customInputWidget),
        ),
      ));
      await tester.pump();

      expect(find.byType(TextField), findsOneWidget);
      expect(
          tester
              .widget<TextField>(find.byType(TextField))
              .controller!
              .value
              .text,
          "");

      expect(tester.widget<TextField>(find.byType(TextField)).decoration!.label,
          null);

      await tester.pumpAndSettle();
    });
  });
}
