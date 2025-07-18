import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/custompopup/custom_popupmenu.dart';
import 'package:smart_home/device/state/bloc/datapoint_bloc.dart';

class CutsomPopupmenuView extends StatelessWidget {
  final CustomPopupmenu customPopupmenu;
  const CutsomPopupmenuView({super.key, required this.customPopupmenu});

  @override
  Widget build(BuildContext context) {
    return providers(
        child: DraggableScrollableSheet(
            expand: false,
            maxChildSize: 0.9,
            minChildSize: 0.1,
            initialChildSize: 0.3,
            builder: (context, scrollController) => SingleChildScrollView(
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
                              borderRadius: BorderRadius.circular(5)),
                          width: 70,
                          height: 7,
                        )),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: customPopupmenu.customWidgets
                          .map((e) => Card(
                                child: e.widget,
                              ))
                          .toList(growable: false),
                    ),
                  ],
                ))));
  }

  MultiBlocProvider providers({required Widget child}) {
    return MultiBlocProvider(
        providers: customPopupmenu
            .getDependentDataPoints()
            .map((t) => BlocProvider<DataPointBloc>(
                create: (context) => DataPointBloc(t)))
            .toList(),
        child: child);
  }
}
