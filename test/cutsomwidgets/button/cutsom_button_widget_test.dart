import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/button/custom_button_widget.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/button/view/custom_button_widget_view.dart';
import 'package:smart_home/device/state/bloc/datapoint_bloc.dart';
import 'package:smart_home/device/state/state.dart';
import 'package:smart_home/manager/general_manager.dart';
import 'package:smart_home/manager/manager.dart';

import 'cutsom_button_widget_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<DataPoint>(),
  MockSpec<DataPointBloc>(),
  MockSpec<DataPointState>(),
  MockSpec<Manager>(),
  MockSpec<GeneralManager>()
])
void main() {
  late CustomButtonWidget customButtonWidget;
  late MockDataPoint mockDataPoint;
  late MockDataPointBloc mockDataPointBloc;
  late MockManager mockManger;
  late MockGeneralManager mockGeneralManager;
  late MockDataPointState mockDataPointState;
  setUp(() {
    mockDataPoint = MockDataPoint();
    mockDataPointBloc = MockDataPointBloc();
    mockManger = MockManager();
    mockGeneralManager = MockGeneralManager();
    mockDataPointState = MockDataPointState();
    customButtonWidget = CustomButtonWidget(
        id: "id",
        name: "name",
        dataPoint: mockDataPoint,
        label: "Label",
        buttonLabel: "Button");

    when(mockDataPointBloc.dataPoint).thenReturn(mockDataPoint);

    when(mockDataPointBloc.state).thenReturn(mockDataPointState);
    when(mockDataPoint.id).thenReturn("expected");
    when(mockManger.generalManager).thenReturn(mockGeneralManager);
    when(mockGeneralManager.vibrateEnabled).thenReturn(false);
    when(mockDataPoint.valueStreamController)
        .thenReturn(StreamController.broadcast());
  });
  group("Test basic", () {
    testWidgets("Test null datapoint", (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CustomButtonWidgetView(
            customButtonWidget:
                CustomButtonWidget(id: "id", name: "name", dataPoint: null),
          ),
        ),
      ));

      await tester.pump();
      expect(find.byType(OutlinedButton), findsNothing);
      expect(find.byType(Text), findsOne);

      await tester.pumpAndSettle();
    });

    testWidgets("Test button label", (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CustomButtonWidgetView(
            customButtonWidget: customButtonWidget,
          ),
        ),
      ));

      await tester.pump();

      expect(find.byType(Text), findsAny);
      expect(find.byType(OutlinedButton), findsOne);
      expect(find.byType(ListTile), findsOne);
      expect(find.text("Button"), findsOne);
      expect(find.text("Label"), findsOne);
      expect(
          (tester.widget<OutlinedButton>(find.byType(OutlinedButton)).child!
                  as Text)
              .data,
          "Button");

      await tester.pumpAndSettle();
    });
  });

  group("Test interactions ", () {
    testWidgets("Test button press", (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: RepositoryProvider<Manager>(
            create: (context) {
              return mockManger;
            },
            child: CustomButtonWidgetView(
              customButtonWidget: customButtonWidget,
            ),
          ),
        ),
      ));

      await tester.pump();

      expect(find.byType(OutlinedButton), findsOne);
      await tester.tap(find.byType(OutlinedButton));
      await tester.press(find.byType(OutlinedButton));

      await tester.pump();
      verify(mockDataPoint.value = true).called(1);
      await tester.pumpAndSettle();
    });
  });
}
