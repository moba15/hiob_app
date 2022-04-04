import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/manager/cubit/manager_cubit.dart';
import 'package:smart_home/manager/manager.dart';

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
        print("state" + state.status.name);
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
            return MainView(
              size: manager.screenManager.screens.length,
            );
        }
      },
    );
  }
}

class MainView extends StatefulWidget {
  final int size;

  const MainView({Key? key, required this.size}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: widget.size);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Manager manager = context.read<Manager>();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Main screen"),
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
              for (Screen screen
                  in context.read<Manager>().screenManager.screens)
                ScreenTab(
                  screen: screen,
                )
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            for (Screen screen in context.read<Manager>().screenManager.screens)
              ListView(
                  children: context
                      .read<Manager>()
                      .customWidgetManager
                      .templates
                      .where((element) =>
                          screen.widgetTemplates.contains(element.id))
                      .map((e) => e.customWidget.widget)
                      .toList(growable: true))
          ],
        ));
  }
}
