import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/manager/manager.dart';

import '../../screen/screen.dart';
import '../../screen/view/screen_menu_tabbar.dart';
import '../screen_setting/screen_list/cubit/screen_list_cubit.dart';
import 'main_settings_screen.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Nice");
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
    return BlocBuilder<ScreenListCubit, ScreenListState>(
      builder: (context, state) {
        print("Saze: " + state.screens.length.toString());

        switch (state.status) {
          case ListStatus.loading:
            return Scaffold(
              appBar: AppBar(
                title: Text("Loading"),
              ),
              body: CircularProgressIndicator(),
            );
          default:
            return MainView(
              size: state.screens.length,
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
          children: const [
            Text("Nice"),
            Text("Nice"),
            Text("Nice"),
            Text("Nice"),
            Text("Nice"),
            Text("Nice"),
            Text("Nice"),
            Text("Nice"),
            Text("Nice"),
          ],
        ));
  }
}
