import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/templates/custom_widget_template.dart';
import 'package:smart_home/customwidgets/widgets/group/custom_group_widget.dart';
import 'package:smart_home/manager/cubit/manager_cubit.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/manager/screen_manager.dart';
import 'package:smart_home/settings/screen_setting/screen_list/cubit/screen_list_cubit.dart';

import '../../screen/screen.dart';
import '../../screen/view/screen_menu_tabbar.dart';
import 'main_settings_screen.dart';
const double breakpoint = 800;
const int paneProportion = 70;
class MainPage extends StatelessWidget {


  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      manager: context.read<Manager>(),
    );
  }
}

class MainScreen extends StatelessWidget {
  final Manager manager;

  const MainScreen({Key? key, required this.manager}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ManagerCubit, ManagerState>(
      builder: (context, state) {
        switch (state.status) {
          case ManagerStatus.loading:
            return Scaffold(
              appBar: AppBar(
                title: const Text("Loading"),
                actions: [
                  IconButton(
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MainSettingsScreen(manager: manager)),
                        )
                      },
                      icon: const Icon(Icons.settings))
                ],
              ),
              body: const Center(
                child: CircularProgressIndicator(),
              )
            );
          default:
            return const MainView();
        }
      },
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with TickerProviderStateMixin {
  late StreamController<int> _controller;
  int numberOfRows = 1;
  late AnimationController _animationController;
  late StreamSubscription<bool> _ioConnectionSub;
  bool ioConnected = false;
  @override
  void initState() {
    _controller = StreamController.broadcast();
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    ioConnected = context.read<Manager>().connectionManager.ioBConnected;
    super.initState();
    _ioConnectionSub = context.read<Manager>().ioBrokerManager.connectionStatusStreamController.stream.listen((event) {
      if(ioConnected != event) {
        setState(() {
        ioConnected = event;
      });
      }
    });

  }


  int currentTab = 0;

  void onViewChange() {
    setState(() {

    });
  }

  @override
  void dispose() {
    //_tabController.dispose();
    //_tabController.removeListener(onViewChange);
    _controller.close();
    _ioConnectionSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if(width >= 960.0 )  {
      numberOfRows = 2;
    }
    if(width>=1300) {
      numberOfRows = 3;
    }
    if(width < 960.0) {
      numberOfRows = 1;
    }
    Manager manager = context.read<Manager>();

    ScreenManager screenManager = manager.screenManager;
    return BlocBuilder<ScreenListCubit, ScreenListState>(
      bloc: ScreenListCubit(screenManager: screenManager)..fetchList(),
      builder: (context, state) {
        List<Screen> screens = state.screens;
        TabController _tabController = TabController(length: screens.length, vsync: this);
        _tabController.addListener(() { _controller.add(_tabController.index);});
        return Scaffold(
            appBar: AppBar(
              backgroundColor: !ioConnected ? Colors.red : null,
              centerTitle: true,
              leading: !ioConnected ? const Icon(Icons.signal_cellular_off_sharp) : null,
              title: screens.isEmpty ? const Text("Loading") : StreamBuilder<int>(
                stream: _controller.stream,
                builder: (context, snapshot) {
                  if(snapshot.hasError) {
                    return const Text("Error");
                  }
                  return Text(screens[snapshot.data ?? 0].name);

                },
              ),
              actions: [
                AnimatedBuilder(
                  builder: (context, child)  {
                    return Transform.rotate(angle: _animationController.value * 2 * math.pi, child: child,);
                  },
                  animation: _animationController,
                  child: IconButton(
                      onPressed: () => {
                        _animationController.forward().whenComplete(() => _animationController.reset()),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MainSettingsScreen(manager: manager)),
                        )

                      },
                      icon: const Icon(Icons.settings),
                      )

                )
              ],
              automaticallyImplyLeading: false,
              bottom: TabBar(
                onTap: (i)  {
                  _controller.add(i);
                },
                indicatorWeight: 3,
                isScrollable: true,
                controller: _tabController,
                tabs: [
                  for (int i = 0; i<screens.length; i++)
                    ScreenTab(
                      screen: screens[i],
                    )
                ],
              ),
            ),
            body: _tabController.length == 0 ? const Text("null"): TabBarView(
              controller: _tabController,
              children: [
                for (int i = 0; i<_tabController.length; i++)
                  ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      Screen screen = screens[i];
                      List<dynamic> templates = screen.widgetTemplates;
                      List<List<dynamic>> rows = List.generate(numberOfRows, (index)  {
                        List<dynamic> row = [];
                        for(int i = index; i<templates.length; i+=numberOfRows) {
                          row.add(templates[i]);
                        }
                        return row;
                      });
                      rows.removeWhere((element) => element.isEmpty);
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for(List<dynamic> t in rows)
                            Expanded(
                              child: Column(
                                children: t.map((e) {
                                  if(e is CustomWidgetTemplate) {
                                    return Card(
                                      child: e.customWidget.widget,
                                    );
                                  } else if(e is CustomGroupWidget) {
                                    return Card(
                                      child: e.widget,
                                    );
                                  } else {
                                    return const Text("Error 404");
                                  }
                                }).toList(),
                              ),
                            )


                        ],

                      );
                    },
                  )
              ],
            )
        );
      },

    );
  }
}
