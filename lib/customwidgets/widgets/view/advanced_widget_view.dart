import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/triggerAction/button_trigger_action.dart';
import 'package:smart_home/customwidgets/triggerAction/multiselection_trigger_action.dart';
import 'package:smart_home/customwidgets/triggerAction/none_trigger_action.dart';
import 'package:smart_home/customwidgets/triggerAction/slider_trigger_action.dart';
import 'package:smart_home/customwidgets/triggerAction/switch_trigger_action.dart';
import 'package:smart_home/customwidgets/triggerAction/trigger_actions.dart';
import 'package:smart_home/customwidgets/widgets/advanced_custom_widget.dart';
import 'package:smart_home/device/state/bloc/datapoint_bloc.dart';
import 'package:smart_home/manager/manager.dart';

import '../../../device/bloc/device_bloc.dart';

class AdvancedWidgetView extends StatelessWidget {
  final AdvancedCustomWidget advancedCustomWidget;
  const AdvancedWidgetView({Key? key, required this.advancedCustomWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (advancedCustomWidget.mainBody == null) {
      return const ListTile(
        title: Text("No Trigger Found"),
      );
    }

    switch (advancedCustomWidget.mainBody!.type) {
      case TriggerActionType.none:
        return _NoneTriggerActionView(
          advancedCustomWidget: advancedCustomWidget,
          noneTriggerAction: advancedCustomWidget.mainBody as NoneTriggerAction,
          onLongTab: () => _onLongTab(context),
        );
      case TriggerActionType.multiSelection:
        return _MultiSelectionTriggerActionView(
          advancedCustomWidget: advancedCustomWidget,
          multiSelectionTriggerAction:
              advancedCustomWidget.mainBody as MultiSelectionTriggerAction,
          onLongTab: () => _onLongTab(context),
        );
      case TriggerActionType.slider:
        return _SliderTriggerView(
            advancedCustomWidget: advancedCustomWidget,
            sliderTriggerAction:
                advancedCustomWidget.mainBody as SliderTriggerAction,
            onLongTab: () => _onLongTab(context));
      case TriggerActionType.handleSwitch:
        return _SwitchTriggerView(
            advancedCustomWidget: advancedCustomWidget,
            switchTriggerAction:
                advancedCustomWidget.mainBody as SwitchTriggerAction,
            onLongTab: () => _onLongTab(context));
      case TriggerActionType.button:
        return _ButtonTriggerView(
            advancedCustomWidget: advancedCustomWidget,
            buttonTriggerAction:
                advancedCustomWidget.mainBody as ButtonTriggerAction,
            onLongTab: () => _onLongTab(context));
      default:
        return const Text("Error 404 no view found");
    }
  }

  void _onLongTab(BuildContext context) {
    if (advancedCustomWidget.customAlertDialogWidget == null) {
      return;
    }
    if (Manager().generalManager.useBottomSheet) {
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) =>
              advancedCustomWidget.customAlertDialogWidget!.widget);
    } else {
      showDialog(
          context: context,
          builder: (_) => advancedCustomWidget.customAlertDialogWidget!.widget);
    }
  }
}

//TODO: Maybe in sperate File usw.
class _NoneTriggerActionView extends StatelessWidget {
  final AdvancedCustomWidget advancedCustomWidget;
  final NoneTriggerAction noneTriggerAction;
  final VoidCallback onLongTab;
  const _NoneTriggerActionView(
      {Key? key,
      required this.advancedCustomWidget,
      required this.noneTriggerAction,
      required this.onLongTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (noneTriggerAction.dataPoint == null) {
      return const ListTile(
        title: Text("No Device found"),
      );
    }

    return BlocBuilder<DataPointBloc, DataPointState>(
      bloc: DataPointBloc(noneTriggerAction.dataPoint!),
      builder: (context, state) {
        String leading = state.value.toString();
        if (noneTriggerAction.displayRules?.containsKey(leading) ?? false) {
          leading =
              noneTriggerAction.displayRules?[leading] ?? "Error in Filter";
        } else if (state.value is double) {
          leading =
              (state.value as double).toStringAsFixed(noneTriggerAction.round);
        }
        if (noneTriggerAction.unit != null) {
          leading = "$leading ${noneTriggerAction.unit!}";
        }

        return ListTile(
          onLongPress: onLongTab,
          title: advancedCustomWidget.value == null
              ? Text(
                  advancedCustomWidget.name ?? "No Name Found",
                  overflow: TextOverflow.clip,
                )
              : Text(
                  advancedCustomWidget.value!,
                  overflow: TextOverflow.ellipsis,
                ),
          subtitle: noneTriggerAction.dataPoint?.device?.getDeviceStatus() !=
                  DeviceStatus.ready
              ? const Text(
                  "U/A",
                  style: TextStyle(color: Colors.red),
                  overflow: TextOverflow.ellipsis,
                )
              : null,
          trailing: Container(
            constraints: const BoxConstraints(maxWidth: 200),
            child: Text(
              leading,
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        );
      },
    );
  }
}

class _MultiSelectionTriggerActionView extends StatelessWidget {
  final AdvancedCustomWidget advancedCustomWidget;
  final MultiSelectionTriggerAction multiSelectionTriggerAction;
  final VoidCallback onLongTab;
  const _MultiSelectionTriggerActionView(
      {Key? key,
      required this.advancedCustomWidget,
      required this.multiSelectionTriggerAction,
      required this.onLongTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (multiSelectionTriggerAction.dataPoint == null) {
      return const ListTile(
        title: Text("No Device found"),
      );
    }
    if (multiSelectionTriggerAction.selections.length < 2) {
      return const ListTile(
        title: Text("Please add more selections"),
      );
    }
    return ListTile(
      title: Row(
        children: [
          Flexible(
            child: Text(
              advancedCustomWidget.value ??
                  advancedCustomWidget.name ??
                  "No Name Found",
              overflow: TextOverflow.clip,
            ),
          ),
          if (multiSelectionTriggerAction.dataPoint?.device
                  ?.getDeviceStatus() !=
              DeviceStatus.ready)
            const Flexible(
              child: Text(
                " U/A",
                style: TextStyle(color: Colors.red),
                overflow: TextOverflow.clip,
              ),
            )
        ],
      ),
      //subtitle: multiSelectionTriggerAction.dataPoint?.device?.getDeviceStatus() != DeviceStatus.ready ? const  Text("U/A", style: TextStyle(color: Colors.red),) : null,
      trailing: FractionallySizedBox(
        widthFactor: 0.40,
        child: multiSelectionTriggerAction.getWidget(),
      ),
      onLongPress: onLongTab,
    );
  }
}

class _SliderTriggerView extends StatelessWidget {
  final AdvancedCustomWidget advancedCustomWidget;
  final SliderTriggerAction sliderTriggerAction;
  final VoidCallback onLongTab;
  const _SliderTriggerView(
      {Key? key,
      required this.advancedCustomWidget,
      required this.sliderTriggerAction,
      required this.onLongTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (sliderTriggerAction.dataPoint == null) {
      return const ListTile(
        title: Text("No Device found"),
      );
    }
    return ListTile(
      onLongPress: onLongTab,
      title: Row(
        children: [
          Flexible(
            child: Text(
              advancedCustomWidget.value ??
                  advancedCustomWidget.name ??
                  "No Name found",
              overflow: TextOverflow.clip,
            ),
          ),
          if (sliderTriggerAction.dataPoint?.device?.getDeviceStatus() !=
              DeviceStatus.ready)
            const Flexible(
              child: Text(
                " U/A",
                style: TextStyle(color: Colors.red),
                overflow: TextOverflow.clip,
              ),
            )
        ],
      ),
      subtitle: Column(
        children: [
          sliderTriggerAction.getWidget(),
          //if(sliderTriggerAction.dataPoint?.device?.getDeviceStatus() != DeviceStatus.ready)
          //const Text("U/A", style: TextStyle(color: Colors.red),),
        ],
      ),
    );
  }
}

class _SwitchTriggerView extends StatelessWidget {
  final AdvancedCustomWidget advancedCustomWidget;
  final SwitchTriggerAction switchTriggerAction;
  final VoidCallback onLongTab;
  const _SwitchTriggerView(
      {Key? key,
      required this.advancedCustomWidget,
      required this.switchTriggerAction,
      required this.onLongTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (switchTriggerAction.dataPoint == null) {
      return const ListTile(
        title: Text("No Device found"),
      );
    }
    final bloc = DataPointBloc(switchTriggerAction.dataPoint!);
    return ListTile(
      onLongPress: onLongTab,
      onTap: () => {
        if (bloc.state.value == switchTriggerAction.switchFalse)
          {
            bloc.add(DataPointValueUpdateRequest(
                value: switchTriggerAction.switchTrue,
                oldValue: bloc.state.value))
          }
        else
          {
            bloc.add(DataPointValueUpdateRequest(
                value: switchTriggerAction.switchFalse,
                oldValue: bloc.state.value))
          }
      },
      trailing: BlocBuilder<DataPointBloc, DataPointState>(
          bloc: bloc,
          builder: (_, state) => Switch(
                value: state.value == switchTriggerAction.switchTrue,
                onChanged: (v) => {
                  if (v)
                    {
                      bloc.add(DataPointValueUpdateRequest(
                          value: switchTriggerAction.switchTrue,
                          oldValue: bloc.state.value))
                    }
                  else
                    {
                      bloc.add(DataPointValueUpdateRequest(
                          value: switchTriggerAction.switchFalse,
                          oldValue: bloc.state.value))
                    }
                },
              )),
      title: Row(
        children: [
          Flexible(
              child: Text(
            advancedCustomWidget.value ??
                advancedCustomWidget.name ??
                "No Name found",
            overflow: TextOverflow.clip,
          )),
          BlocBuilder<DataPointBloc, DataPointState>(
            bloc: bloc,
            builder: (context, state) {
              if (switchTriggerAction.dataPoint?.device?.getDeviceStatus() !=
                  DeviceStatus.ready) {
                const Flexible(
                    child: Text(
                  " U/A",
                  style: TextStyle(color: Colors.red),
                  overflow: TextOverflow.clip,
                ));
              }
              return const SizedBox.shrink();
            },
          )
        ],
      ),
    );
  }
}

class _ButtonTriggerView extends StatefulWidget {
  final AdvancedCustomWidget advancedCustomWidget;
  final ButtonTriggerAction buttonTriggerAction;
  final VoidCallback onLongTab;
  const _ButtonTriggerView(
      {Key? key,
      required this.advancedCustomWidget,
      required this.buttonTriggerAction,
      required this.onLongTab})
      : super(key: key);

  @override
  State<_ButtonTriggerView> createState() => _ButtonTriggerViewState();
}

class _ButtonTriggerViewState extends State<_ButtonTriggerView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 80),
        lowerBound: 0,
        upperBound: 0.15);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.buttonTriggerAction.dataPoint == null) {
      return const ListTile(
        title: Text("No Device found"),
      );
    }
    final bloc = DataPointBloc(widget.buttonTriggerAction.dataPoint!);
    return ListTile(
      onLongPress: widget.onLongTab,
      onTap: () => {
        bloc.add(DataPointValueUpdateRequest(
            value: true, oldValue: bloc.state.value))
      },
      trailing: BlocBuilder<DataPointBloc, DataPointState>(
          bloc: bloc,
          builder: (_, state) => AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.scale(
                  scale: 1 - _animationController.value,
                  child: child,
                );
              },
              child: OutlinedButton(
                child: Text(widget.buttonTriggerAction.label ?? "No Lable Set"),
                onPressed: () async {
                  bloc.add(DataPointValueUpdateRequest(
                      value: true, oldValue: bloc.state.value == true));
                },
              ))),
      title: Row(
        children: [
          Flexible(
              child: Text(
            widget.advancedCustomWidget.value ??
                widget.advancedCustomWidget.name ??
                "No Name found",
            overflow: TextOverflow.clip,
          )),
          if (widget.buttonTriggerAction.dataPoint?.device?.getDeviceStatus() !=
              DeviceStatus.ready)
            const Flexible(
                child: Text(
              " U/A",
              style: TextStyle(color: Colors.red),
              overflow: TextOverflow.clip,
            ))
        ],
      ),
    );
  }
}
