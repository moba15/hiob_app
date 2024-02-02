import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/widgets/custom_alert_dialog_widget.dart';
import 'package:smart_home/manager/manager.dart';

class AlterDialogWidgetView extends StatelessWidget {
  final CustomAlertDialogWidget customAlertDialogWidget;
  const AlterDialogWidgetView({Key? key, required this.customAlertDialogWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: Manager.instance,
      child: AlertDialog(
        
        contentPadding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        title: Text(customAlertDialogWidget.name ?? "No title found"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: customAlertDialogWidget.templates == null ? [] : customAlertDialogWidget.templates!.map((e) => Card(
            child: e.customWidget.widget,
          )).toList(growable: false),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Back"))
        ],
        scrollable: true,
      ),
    );
  }
}


class BottomSheetWidget extends StatelessWidget {
  final CustomAlertDialogWidget customAlertDialogWidget;
  const BottomSheetWidget({Key? key, required this.customAlertDialogWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: Manager.instance,
      child: DraggableScrollableSheet(
        expand: false,
        maxChildSize: 0.9,
        minChildSize: 0.1,
        initialChildSize: 0.3,
        builder: (context, scrollController) =>  SingleChildScrollView(
          controller: scrollController,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            clipBehavior: Clip.none,

            children: [
              Positioned(

                top: -15,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                    ),
                width: 70,
                height: 7,

              )),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: customAlertDialogWidget.templates == null ? [] : customAlertDialogWidget.templates!.map((e) => Card(
                  child: e.customWidget.widget,
                )).toList(growable: false),
              ),
            ],
          )
        )
      )
    );
  }
}
