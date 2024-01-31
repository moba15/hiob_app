import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_home/customwidgets/widgets/graphs/graph_axis.dart';
import 'package:smart_home/customwidgets/widgets/graphs/graph_widget.dart';

class AxisSettingsPage extends StatelessWidget {
  final GraphWidget graphWidget;
  final GraphAxis graphAxis;
  final Function(GraphAxis) onSave;
  const AxisSettingsPage({Key? key, required this.graphWidget, required this.graphAxis, required this.onSave}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Axis"),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _save(context),
        child: const Icon(Icons.save),
      ),
      body: _AxisSettingsBody(graphWidget: graphWidget, graphAxis: graphAxis,),
    );
  }
  bool _validate() {
    return graphAxis.dataType != null && graphAxis.description != null && graphAxis.description!.isNotEmpty &&   (graphAxis.dataInterval ?? 0) >= 0;
  }
  void _save(context) {
    if(_validate()) {
      onSave(graphAxis);
      Navigator.pop(context);
    }
  }
}



class _AxisSettingsBody extends StatefulWidget {
   final GraphWidget graphWidget;
   final GraphAxis graphAxis;
  const _AxisSettingsBody({Key? key, required this.graphWidget, required this.graphAxis}) : super(key: key);

  @override
  State<_AxisSettingsBody> createState() => _AxisSettingsBodyState();
}

class _AxisSettingsBodyState extends State<_AxisSettingsBody> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: ListView(
        children: [
          TextFormField(
            initialValue: widget.graphAxis.description,
            onChanged: (v) => widget.graphAxis.description = v,
            decoration: const InputDecoration(
                labelText: "Description"
            ),
          ),
          if(widget.graphAxis.dataType == AxisDataType.time)
            _timeAxisSettings(),
          if(widget.graphAxis.dataType == AxisDataType.numbers)
            _dataAxisSettings()
        ],

        //TODO: Color picker

      ),
    );
  }

  Row _dataAxisSettings() {
    return Row(
          children: [
            Expanded(
              child: TextFormField(
                initialValue: widget.graphAxis.min?.toString() ?? "",
                onChanged: (v)  {
                  if(v.isEmpty) {
                    widget.graphAxis.min = null;
                  } else {
                    widget.graphAxis.min = int.tryParse(v);
                  }
                },
                decoration: const InputDecoration(
                  labelText: "min (optional)"
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
            ),
            Expanded(
              child: TextFormField(
                initialValue: widget.graphAxis.max?.toString() ?? "",
                onChanged: (v)  {
                  if(v.isEmpty) {
                    widget.graphAxis.max = null;
                  } else {
                    widget.graphAxis.max = int.tryParse(v);
                  }
                },
                decoration: const InputDecoration(
                    labelText: "max (optional)"
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
            ),
            Expanded(
              child: TextFormField(
                initialValue: widget.graphAxis.dataInterval?.toString() ?? "",
                onChanged: (v)  {
                  if(v.isEmpty) {
                    widget.graphAxis.dataInterval = null;
                  } else {
                    widget.graphAxis.dataInterval = int.tryParse(v);
                  }
                },
                decoration: const InputDecoration(
                    labelText: "interval (optional)"
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            )
          ],
        );
  }
  
  Widget _timeAxisSettings() {
    return Column(
      children: [
        DropdownSearch<TimeAxisEnd>(
          onChanged: (timeAxisEnd) {
            setState(() {
               widget.graphAxis.timeAxisEnd = timeAxisEnd ?? TimeAxisEnd.hour;
            });
          },
          items: TimeAxisEnd.values,
          itemAsString: (i) => i.name,
          popupProps:   PopupProps.modalBottomSheet(
            showSelectedItems: true,
            searchDelay: const Duration(seconds: 0),
            showSearchBox: true,
            title: const Text("End of axis", style: TextStyle(fontSize: 17.5),),
            modalBottomSheetProps: ModalBottomSheetProps(
              backgroundColor: Theme.of(context).colorScheme.background
            )

          ),
          dropdownDecoratorProps: const DropDownDecoratorProps(

            dropdownSearchDecoration: InputDecoration(
              labelText: "End of axis",
            ),
          ),
          compareFn: (i, i1) => i==i1,

          selectedItem: widget.graphAxis.timeAxisEnd,
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                initialValue: widget.graphAxis.scope.toString(),
                onChanged: (v)  {
                  if(v.isEmpty) {
                    widget.graphAxis.scope = 1;
                  } else {
                    widget.graphAxis.scope = int.tryParse(v) ?? 1;
                  }
                },
                decoration: const InputDecoration(
                    labelText: "Scope"
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
            ),
            Expanded(
              child: DropdownSearch<UnitOfTime>(
                selectedItem: widget.graphAxis.scopeUnit,
                compareFn: (i, i1) => i1==i,
                itemAsString: (i) => i.name,
                items: UnitOfTime.values,
                onChanged: (u) => widget.graphAxis.scopeUnit = u ?? UnitOfTime.hour,
                popupProps:  PopupProps.modalBottomSheet(
                  showSelectedItems: true,
                  searchDelay: const Duration(seconds: 0),
                  showSearchBox: true,
                  title: const Text("Scope Unit", style: TextStyle(fontSize: 17.5),),
                  modalBottomSheetProps: ModalBottomSheetProps(
                    backgroundColor: Theme.of(context).colorScheme.background,
                  )

                ),
                dropdownDecoratorProps: const DropDownDecoratorProps(

                  dropdownSearchDecoration: InputDecoration(
                    labelText: "Scope Unit",
                  ),
                ),

              )
            ),
          ],
        )
      ],
    );
  }
}

