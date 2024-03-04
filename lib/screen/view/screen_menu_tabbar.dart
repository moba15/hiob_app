import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/manager/screen_manager.dart';
import 'package:smart_home/settings/screen_setting/screen_list/cubit/screen_list_cubit.dart';

import '../screen.dart';

class ScreenTabBarPage extends StatelessWidget {
  final Manager manager;

  const ScreenTabBarPage({Key? key, required this.manager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => ScreenListCubit(screenManager: manager.screenManager),
        child: ScreenTabView(
          screenManager: manager.screenManager,
        ));
  }

  // TODO: implement preferredSize
  Size get preferredSize => Size.zero;
}

class ScreenTabView extends StatelessWidget {
  final ScreenManager screenManager;

  const ScreenTabView({Key? key, required this.screenManager})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ScreenListCubit>().state;
    return ScreenTabBar(
      screens: state.screens,
    );
  }
}

class ScreenTabBar extends StatefulWidget {
  final List<Screen> screens;

  const ScreenTabBar({Key? key, required this.screens}) : super(key: key);

  @override
  State<ScreenTabBar> createState() => _ScreenTabBarState();
}

class _ScreenTabBarState extends State<ScreenTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      controller: _tabController,
      tabs: const [
        Tab(
          text: "LOL",
        ),
        Tab(
          text: "LOL",
        )
      ],
    );
  }
}

class ScreenTab extends StatelessWidget {
  final Screen screen;

  const ScreenTab({Key? key, required this.screen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      text: screen.name,
      icon: screen.iconWrapper.icon,
    );
  }
}
