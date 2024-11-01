import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/changelog/view/changelog_view.dart';
import 'package:smart_home/manager/connection/connection_manager.dart' as man;
import 'package:smart_home/manager/cubit/manager_cubit.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/notifications/view/notifications_log_view.dart';
import 'package:smart_home/screen/view/screen_view.dart';
import 'package:smart_home/settings/ioBroker_settings/view/iobroker_settings_page.dart';
import 'package:smart_home/utils/blinking_widget.dart';
import 'package:smart_home/view/main/cubit/main_view_cubit.dart';

import '../../screen/screen.dart';
import '../../screen/view/screen_menu_tabbar.dart';
import '../../settings/view/main_settings_screen.dart';

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
                                        const NotificationLogViewScreen()),
                              )
                            },
                        icon: const Icon(Icons.notifications)),
                    IconButton(
                        onPressed: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MainSettingsScreen(manager: manager)),
                              )
                            },
                        icon: const Icon(Icons.settings)),
                  ],
                ),
                body:  Center(
                  key: GlobalKey(),
                  child: const CircularProgressIndicator(),
                ));
          case ManagerStatus.changeLog:
            return ChangeLogScreen(manager: manager);
          default:
            return const MainView();
        }
      },
    );
  }
}

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int numberOfRows = 1;
    /*if (width >= 960.0) {
      numberOfRows = 2;
    }
    if (width >= 1300) {
      numberOfRows = 3;
    }
    if (width < 960.0) {
      numberOfRows = 1;
    }*/
    return BlocBuilder<MainViewCubit, MainViewState>(
      bloc: MainViewCubit(),
      builder: (context, state) {
        return DefaultTabController(
            length: state.screens.length,
            child: Scaffold(
              appBar: AppBar(
                toolbarHeight: 90,
                centerTitle: true,
                leading: MainViewAppBarLeading(
                  connectionStatus: state.connectionStatus,
                ),
                title: MainViewBarTitle(
                  screens: state.screens,
                ),
                bottom: TabBar(
                    tabAlignment: TabAlignment.start,
                    onTap: (i) {},
                    indicatorWeight: 3,
                    isScrollable: true,
                    tabs: state.screens
                        .map<ScreenTab>(
                          (e) => ScreenTab(screen: e),
                        )
                        .toList()),
                actions: [
                  StreamBuilder(
                    stream:
                        Manager.instance.notificationManager.notificationStream,
                    builder: (context, state) {
                      return Badge(
                        isLabelVisible: Manager.instance.notificationManager
                                .unreadNotifications >
                            0,
                        label: Manager.instance.notificationManager
                                    .unreadNotifications >
                                0
                            ? Text(
                                "${Manager.instance.notificationManager.unreadNotifications}")
                            : null,
                        child: IconButton(
                          onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const NotificationLogViewScreen())),
                          },
                          icon: const Icon(Icons.notifications),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MainSettingsScreen(manager: Manager())),
                      )
                    },
                    icon: const Icon(Icons.settings),
                  ),
                ],
              ),
              body: TabBarView(
                key: GlobalKey(),
                  children: state.screens
                      .map((t) =>
                          ScreenView(screen: t, numberOfRows: numberOfRows))
                      .toList()),
            ));
      },
    );
  }
}

class MainViewBarTitle extends StatefulWidget {
  final List<Screen> screens;
  const MainViewBarTitle({Key? key, required this.screens}) : super(key: key);

  @override
  State<MainViewBarTitle> createState() => _MainViewBarTitleState();
}

class _MainViewBarTitleState extends State<MainViewBarTitle> {
  late StreamController<int> tabStreamController;
  late TabController _tabController;
  bool listend = false;
  int index = 0;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {});
  }

  @override
  void dispose() {
    listend = false;
    _tabController.removeListener(listen);

    super.dispose();
  }

  listen() {
    setState(() {
      index = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _tabController = DefaultTabController.of(context);
    _tabController.addListener(listen);

    listend = true;

    if (widget.screens.isEmpty) {
      return const Text("Empty");
    }
    return Text(widget.screens[index].name);
  }
}

class MainViewAppBarLeading extends StatefulWidget {
  final man.ConnectionStatus connectionStatus;
  const MainViewAppBarLeading({Key? key, required this.connectionStatus})
      : super(key: key);

  @override
  State<MainViewAppBarLeading> createState() => _MainViewAppBarLeadingState();
}

class _MainViewAppBarLeadingState extends State<MainViewAppBarLeading>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return _getAppBarStatus(widget.connectionStatus);
  }

  Widget _getAppBarStatus(man.ConnectionStatus connectionStatus) {
    debugPrint("AppBar Status: ${connectionStatus.name}");
    int n = 0;
    BlinkingWidget blinkingWidget;
    switch (connectionStatus) {
      case man.ConnectionStatus.connected:
      case man.ConnectionStatus.loggedIn:
        blinkingWidget = BlinkingWidget(
          vsync: this,
          disablerAfter: const Duration(seconds: 3),
          invisibleAfter: true,
          child: const Icon(Icons.done, color: Colors.green),
        );
        break;
      case man.ConnectionStatus.loggingIn:
        blinkingWidget = BlinkingWidget(
          vsync: this,
          child: const Icon(
            Icons.login,
            color: Colors.orange,
          ),
        );
        break;
      case man.ConnectionStatus.loginDeclined:
        blinkingWidget = BlinkingWidget(
          vsync: this,
          child: const Icon(Icons.login, color: Colors.orange),
        );
        break;
      case man.ConnectionStatus.newAesKey:
        blinkingWidget = BlinkingWidget(
          vsync: this,
          child: const Icon(Icons.add_moderator, color: Colors.yellow),
        );
        break;
      case man.ConnectionStatus.wrongAdapterVersion:
        blinkingWidget = BlinkingWidget(
          vsync: this,
          child: const Icon(Icons.update, color: Colors.yellow),
        );
        break;
      case man.ConnectionStatus.emptyAES:
        blinkingWidget = BlinkingWidget(
          vsync: this,
          child: const Icon(Icons.add_moderator_outlined, color: Colors.red),
        );
        break;

      default:
        blinkingWidget = BlinkingWidget(
          vsync: this,
          child: IconButton(
              icon: const Icon(
                  Icons.signal_wifi_connected_no_internet_4_outlined,
                  color: Colors.red),
              onPressed: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (c) => const IoBrokerSettingsPage()))
                  }),
        );
    }
    return blinkingWidget;
  }
}

class MainViewOld extends StatefulWidget {
  const MainViewOld({Key? key}) : super(key: key);

  @override
  State<MainViewOld> createState() => _MainViewOldState();
}

class _MainViewOldState extends State<MainViewOld>
    with TickerProviderStateMixin {
  late StreamController<int> _controller;
  int numberOfRows = 1;
  late StreamSubscription<man.ConnectionStatus> _ioConnectionSub;
  bool ioConnected = false;

  late TabController _tabController;

  @override
  void initState() {
    _controller = StreamController.broadcast();
    ioConnected = context.read<Manager>().connectionManager.ioBConnected;
    context
        .read<Manager>()
        .generalManager
        .dialogStreamController
        .stream
        .listen((event) {
      showDialog(context: context, builder: event);
    });

    _tabController = TabController(
      initialIndex: 0,
      length: 1,
      vsync: this,
    );

    super.initState();
  }

  int currentTab = 0;

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
    if (width >= 960.0) {
      numberOfRows = 2;
    }
    if (width >= 1300) {
      numberOfRows = 3;
    }
    if (width < 960.0) {
      numberOfRows = 1;
    }
    Manager manager = Manager();

    return BlocBuilder<MainViewCubit, MainViewState>(
      bloc: MainViewCubit(),
      builder: (context, state) {
        List<Screen> screens =
            state.screens.where((element) => element.enabled).toList();
        _tabController = TabController(
          initialIndex: _tabController.index,
          length: screens.length,
          vsync: this,
        );
        _tabController.addListener(() {
          _controller.add(_tabController.index);
        });
        /*if (screens.isEmpty) {
          return Scaffold(
            appBar: AppBar(),
          );
        }*/
        return Scaffold(
            appBar: AppBar(
              toolbarHeight: 90,
              centerTitle: true,
              leading: Container(
                child: _getAppBarStatus(state.connectionStatus),
              ),
              title: screens.isEmpty
                  ? const Text("Loading")
                  : StreamBuilder<int>(
                      stream: _controller.stream,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Text("Error");
                        }
                        return Text(screens[snapshot.data ?? 0].name);
                      },
                    ),
              actions: [
                StreamBuilder(
                  stream:
                      Manager.instance.notificationManager.notificationStream,
                  builder: (context, state) {
                    return Badge(
                      isLabelVisible: Manager.instance.notificationManager
                              .unreadNotifications >
                          0,
                      label: Manager.instance.notificationManager
                                  .unreadNotifications >
                              0
                          ? Text(
                              "${Manager.instance.notificationManager.unreadNotifications}")
                          : null,
                      child: IconButton(
                        onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const NotificationLogViewScreen())),
                        },
                        icon: const Icon(Icons.notifications),
                      ),
                    );
                  },
                ),
                IconButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MainSettingsScreen(manager: manager)),
                    )
                  },
                  icon: const Icon(Icons.settings),
                ),
              ],
              automaticallyImplyLeading: false,
              bottom: TabBar(
                tabAlignment: TabAlignment.start,
                onTap: (i) {
                  _controller.add(i);
                },
                indicatorWeight: 3,
                isScrollable: true,
                controller: _tabController,
                tabs: [
                  for (int i = 0; i < screens.length; i++)
                    ScreenTab(
                      screen: screens[i],
                    ),
                ],
              ),
            ),
            body: TabBarView(
                controller: _tabController,
                children: screens
                    .map((t) =>
                        ScreenView(screen: t, numberOfRows: numberOfRows))
                    .toList()));
      },
    );
  }

  Widget? _getAppBarStatus(man.ConnectionStatus connectionStatus) {
    debugPrint("AppBar Status: ${connectionStatus.name}");
    int n = 0;
    BlinkingWidget blinkingWidget;
    switch (connectionStatus) {
      case man.ConnectionStatus.connected:
      case man.ConnectionStatus.loggedIn:
        blinkingWidget = BlinkingWidget(
          vsync: this,
          disablerAfter: const Duration(seconds: 3),
          invisibleAfter: true,
          child: const Icon(Icons.done, color: Colors.green),
        );
        break;
      case man.ConnectionStatus.loggingIn:
        blinkingWidget = BlinkingWidget(
          vsync: this,
          child: const Icon(
            Icons.login,
            color: Colors.orange,
          ),
        );
        break;
      case man.ConnectionStatus.loginDeclined:
        blinkingWidget = BlinkingWidget(
          vsync: this,
          child: const Icon(Icons.login, color: Colors.orange),
        );
        break;
      case man.ConnectionStatus.newAesKey:
        blinkingWidget = BlinkingWidget(
          vsync: this,
          child: const Icon(Icons.add_moderator, color: Colors.yellow),
        );
        break;
      case man.ConnectionStatus.wrongAdapterVersion:
        blinkingWidget = BlinkingWidget(
          vsync: this,
          child: const Icon(Icons.update, color: Colors.yellow),
        );
        break;
      case man.ConnectionStatus.emptyAES:
        blinkingWidget = BlinkingWidget(
          vsync: this,
          child: const Icon(Icons.add_moderator_outlined, color: Colors.red),
        );
        break;

      default:
        blinkingWidget = BlinkingWidget(
          vsync: this,
          child: IconButton(
              icon: const Icon(
                  Icons.signal_wifi_connected_no_internet_4_outlined,
                  color: Colors.red),
              onPressed: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (c) => const IoBrokerSettingsPage()))
                  }),
        );
    }
    return blinkingWidget;
  }
}
