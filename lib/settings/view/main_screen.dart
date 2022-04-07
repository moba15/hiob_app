import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/manager/cubit/manager_cubit.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/manager/screen_manager.dart';
import 'package:smart_home/settings/screen_setting/screen_list/cubit/screen_list_cubit.dart';

import '../../screen/screen.dart';
import '../../screen/view/screen_menu_tabbar.dart';
import 'main_settings_screen.dart';

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
                title: Text("Loading"),
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
            return MainView();
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

class _MainViewState extends State<MainView>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    //_tabController = TabController(vsync: this, length: widget.size);
    //_tabController.addListener(onViewChange);

  }

  void onViewChange() {
    print("change");
    setState(() {

    });
  }

  @override
  void dispose() {
    //_tabController.dispose();
    //_tabController.removeListener(onViewChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Manager manager = context.read<Manager>();
    ScreenManager screenManager = manager.screenManager;
    return BlocBuilder<ScreenListCubit, ScreenListState>(
      bloc: ScreenListCubit(screenManager: screenManager)..fetchList(),
      builder: (context, state) {
        List<Screen> screens = state.screens;
        TabController _tabController = TabController(length: screens.length, vsync: this);
        return Scaffold(
            appBar: AppBar(
              title: Text(screenManager.screens[_tabController.index].name),
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
              automaticallyImplyLeading: false,
              bottom: TabBar(
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
            body: _tabController.length == 0 ? Text("null"): TabBarView(
              controller: _tabController,
              children: [
                for (int i = 0; i<_tabController.length; i++)
                  ListView(
                      children: context
                          .read<Manager>()
                          .customWidgetManager
                          .templates
                          .where((element) =>
                          screens[i].widgetTemplates.contains(element.id))
                          .map((e) => e.customWidget.widget)
                          .toList(growable: true))
              ],
            )
        );
      },

    );

    /*return Scaffold(
        appBar: AppBar(
          title: Text(context.read<Manager>().screenManager.screens[_tabController.index].name),
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
          automaticallyImplyLeading: false,
          bottom: TabBar(
            isScrollable: true,
            controller: _tabController,
            tabs: [
              for (int i = 0; i<widget.size; i++)
                ScreenTab(
                  screen: screens[i],
                )
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            for (int i = 0; i<widget.size; i++)
              ListView(
                  children: context
                      .read<Manager>()
                      .customWidgetManager
                      .templates
                      .where((element) =>
                        screens[i].widgetTemplates.contains(element.id))
                      .map((e) => e.customWidget.widget)
                      .toList(growable: true))
          ],
        ));*/
  }
}
