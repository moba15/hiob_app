import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/input/custom_input_widget.dart';
import 'package:smart_home/customwidgets/cutsomwidgets_rework/input/view/custom_input_widget_view.dart';
import 'package:smart_home/device/state/bloc/datapoint_bloc.dart';
import 'package:smart_home/device/state/state.dart';

import 'custom_input_widget_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<DataPoint>(),
  MockSpec<DataPointBloc>(),
  MockSpec<DataPointState>()
])
void main() {
  late CustomInputWidget customInputWidget;
  late MockDataPoint mockDataPoint;
  late MockDataPointBloc mockDataPointBloc;
  late MockDataPointState mockDataPointState;
  setUp(() {
    mockDataPoint = MockDataPoint();
    customInputWidget = CustomInputWidget(
        id: "id",
        name: "name",
        dataPoint: mockDataPoint,
        customInputDisplayConentType: CustomInputDisplayConentType.hintText);
    mockDataPointBloc = MockDataPointBloc();
    mockDataPointState = MockDataPointState();

    when(mockDataPointBloc.dataPoint).thenReturn(mockDataPoint);
    when(mockDataPointBloc.state).thenReturn(mockDataPointState);
    when(mockDataPoint.id).thenReturn("id");

    when(mockDataPoint.value).thenReturn("asdasd");

    when(mockDataPoint.valueStreamController)
        .thenReturn(StreamController.broadcast());
  });

  group("Test basic features", () {
    testWidgets("Test null datapoint", (tester) async {
      when(mockDataPointState.value).thenReturn("asdasd");

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: CustomInputWidgetView(
                customInputWidget: CustomInputWidget(
                    id: "id", name: "name", dataPoint: null))),
      ));
      await tester.pump();

      expect(find.byType(Text), findsOneWidget);
      expect(find.byType(TextField), findsNothing);

      await tester.pumpAndSettle();
    });

    testWidgets("Test nummber value", (tester) async {
      when(mockDataPointState.value).thenReturn(1);

      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
        body: CustomInputWidgetView(
            customInputWidget: CustomInputWidget(
          id: "id",
          name: "name",
          dataPoint: mockDataPoint,
          customInputDisplayConentType: CustomInputDisplayConentType.hintText,
        )),
      )));
      await tester.pump();

      expect(find.byType(TextField), findsOneWidget);

      await tester.pumpAndSettle();
    });

    testWidgets("Test label", (tester) async {
      when(mockDataPointState.value).thenReturn("asdasd");

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: CustomInputWidgetView(
                customInputWidget: CustomInputWidget(
                    id: "id",
                    name: "name",
                    dataPoint: mockDataPoint,
                    customInputDisplayConentType:
                        CustomInputDisplayConentType.noShow,
                    label: "asd"))),
      ));
      await tester.pump();

      expect(find.byType(TextField), findsOneWidget);
      expect(
          (tester.widget<TextField>(find.byType(TextField)).decoration!.label
                  as Text)
              .data,
          "asd");

      await tester.pumpAndSettle();
    });
  });
  group("Test display types", () {
    testWidgets("Test CustomInputSendMethod hintText", (tester) async {
      customInputWidget.customInputDisplayConentType =
          CustomInputDisplayConentType.hintText;
      String value = "asdasd";
      when(mockDataPoint.value).thenReturn(value);

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

    testWidgets("Test CustomInputSendMethod value", (tester) async {
      customInputWidget.customInputDisplayConentType =
          CustomInputDisplayConentType.value;
      String value = "asdasd";
      when(mockDataPoint.value).thenReturn(value);

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
  group("Test send types", () {
    testWidgets("Test onSubmitted", (tester) async {
      customInputWidget.customInputSendMethod =
          CustomInputSendMethod.onSubmitted;
      when(mockDataPointState.value).thenReturn("home");

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CustomInputWidgetView(customInputWidget: customInputWidget),
        ),
      ));
      await tester.enterText(find.byType(TextField), "text");
      await tester.pump();
      verifyNever(mockDataPoint.value = "text");
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
      verify(mockDataPoint.value = "text").called(1);
    });

    testWidgets("Test never", (tester) async {
      customInputWidget.customInputSendMethod = null;
      when(mockDataPointState.value).thenReturn("home");

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CustomInputWidgetView(customInputWidget: customInputWidget),
        ),
      ));
      await tester.enterText(find.byType(TextField), "text");
      await tester.pump();
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
      verifyNever(mockDataPoint.value = "text");
    });
  });
}
