import 'dart:async';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/changelog/view/changelog_view.dart';
import 'package:smart_home/repository/custom_widget_repository.dart';
import 'package:smart_home/services/cubit/manager_cubit.dart';
import 'package:smart_home/repository/general_repository.dart';
import 'package:smart_home/services/impl/iobroker/notification_service.dart';
import 'package:smart_home/repository/screen_repository.dart';
import 'package:smart_home/notifications/view/notifications_log_view.dart';
import 'package:smart_home/screen/view/screen_view.dart';
import 'package:smart_home/services/connection/connection_service_interface.dart';
import 'package:smart_home/settings/ioBroker_settings/view/iobroker_settings_page.dart';
import 'package:smart_home/utils/blinking_widget.dart';
import 'package:smart_home/view/main/cubit/main_view_cubit.dart';

import '../../screen/screen.dart';
import '../../services/impl/iobroker/screen_menu_tabbar.dart';
import '../../settings/view/main_settings_screen.dart';

const double breakpoint = 800;
const int paneProportion = 70;
const bool useBottomTabBar = true;

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScreen();
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceCubit, ServiceState>(
      builder: (context, state) {
        switch (state.status) {
          case ServiceStatus.loading:
            return Scaffold(
              appBar: AppBar(title: const Text("Loading")),
              body: Column(
                children: [
                  const SizedBox(height: 20),
                  const CircularProgressIndicator(),
                  const SizedBox(height: 20),
                  if (state.startupError != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        state.startupError!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.services.length,
                      itemBuilder: (context, index) {
                        final service = state.services[index];
                        IconData icon = Icons.circle_outlined;
                        Color? color;
                        switch (service.status) {
                          case ServiceLoadStatus.pending:
                            icon = Icons.circle_outlined;
                            color = Colors.grey;
                            break;
                          case ServiceLoadStatus.loading:
                            icon = Icons.hourglass_bottom;
                            color = Colors.orange;
                            break;
                          case ServiceLoadStatus.loaded:
                            icon = Icons.check_circle;
                            color = Colors.green;
                            break;
                          case ServiceLoadStatus.failed:
                            icon = Icons.error;
                            color = Colors.red;
                            break;
                        }

                        return ListTile(
                          leading: Icon(icon, color: color),
                          title: Text(service.label),
                          subtitle: service.error == null
                              ? null
                              : Text(
                                  service.error!,
                                  style: const TextStyle(color: Colors.red),
                                ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          case ServiceStatus.changeLog:
            return ChangeLogScreen();
          default:
            return const MainView();
        }
      },
    );
  }
}

class MainView extends StatelessWidget {
  const MainView({super.key});

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
      bloc: MainViewCubit(
        connectionService: context.read<ConnectionServiceInterface>(),
        screenManager: context.read<ScreenRepository>(),
        customWidgetManager: context.read<CustomWidgetRepository>(),
      ),
      builder: (context, state) {
        final generalRepository = context.read<GeneralRepository>();

        return StreamBuilder<int>(
          stream: generalRepository.settingsChangedStreamController.stream,
          initialData: 0,
          builder: (context, _) {
            final useBottomTabBar = generalRepository.useBottomTabBar;

            return DefaultTabController(
              length: state.screens.length,
              child: Builder(
                builder: (context) {
                  final tabBar = TabBar(
                    tabAlignment: TabAlignment.start,
                    onTap: (i) {},
                    indicatorWeight: 3,
                    isScrollable: true,
                    tabs: state.screens
                        .map<ScreenTab>((e) => ScreenTab(screen: e))
                        .toList(),
                  );

                  final PreferredSizeWidget scrollableTabBar = PreferredSize(
                    preferredSize: tabBar.preferredSize,
                    child: ScrollConfiguration(
                      behavior: const _DesktopTabBarScrollBehavior(),
                      child: tabBar,
                    ),
                  );

                  return Scaffold(
                    appBar: AppBar(
                      toolbarHeight: 90,
                      centerTitle: true,
                      leading: MainViewAppBarLeading(
                        connectionStatus: state.connectionStatus,
                      ),
                      title: MainViewBarTitle(screens: state.screens),
                      bottom: useBottomTabBar ? null : scrollableTabBar,
                      actions: [
                        StreamBuilder(
                          stream: context
                              .read<NotificationServiceImpl>()
                              .notificationStream,
                          builder: (context, state) {
                            return Badge(
                              isLabelVisible:
                                  context
                                      .read<NotificationServiceImpl>()
                                      .unreadNotifications >
                                  0,
                              label:
                                  context
                                          .read<NotificationServiceImpl>()
                                          .unreadNotifications >
                                      0
                                  ? Text(
                                      "${context.read<NotificationServiceImpl>().unreadNotifications}",
                                    )
                                  : null,
                              child: IconButton(
                                onPressed: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const NotificationLogViewScreen(),
                                    ),
                                  ),
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
                                builder: (context) => MainSettingsScreen(),
                              ),
                            ),
                          },
                          icon: const Icon(Icons.settings),
                        ),
                      ],
                    ),
                    body: TabBarView(
                      key: GlobalKey(),
                      children: state.screens
                          .map(
                            (t) => ScreenView(
                              screen: t,
                              numberOfRows: numberOfRows,
                            ),
                          )
                          .toList(),
                    ),
                    bottomNavigationBar: useBottomTabBar
                        ? Material(
                            elevation: 8,
                            child: SafeArea(
                              top: false,
                              child: scrollableTabBar,
                            ),
                          )
                        : null,
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}

class _DesktopTabBarScrollBehavior extends MaterialScrollBehavior {
  const _DesktopTabBarScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.stylus,
    PointerDeviceKind.unknown,
  };
}

class MainViewBarTitle extends StatefulWidget {
  final List<Screen> screens;
  const MainViewBarTitle({super.key, required this.screens});

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
  final ConnectionStatus connectionStatus;
  const MainViewAppBarLeading({super.key, required this.connectionStatus});

  @override
  State<MainViewAppBarLeading> createState() => _MainViewAppBarLeadingState();
}

class _MainViewAppBarLeadingState extends State<MainViewAppBarLeading>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return _getAppBarStatus(widget.connectionStatus);
  }

  Widget _getAppBarStatus(ConnectionStatus connectionStatus) {
    BlinkingWidget blinkingWidget;
    switch (connectionStatus) {
      case ConnectionStatus.connected:
      case ConnectionStatus.loggedIn:
        blinkingWidget = BlinkingWidget(
          vsync: this,
          disablerAfter: const Duration(seconds: 3),
          invisibleAfter: true,
          child: const Icon(Icons.done, color: Colors.green),
        );
        break;
      case ConnectionStatus.loggingIn:
        blinkingWidget = BlinkingWidget(
          vsync: this,
          child: const Icon(Icons.login, color: Colors.orange),
        );
        break;
      case ConnectionStatus.loginDeclined:
        blinkingWidget = BlinkingWidget(
          vsync: this,
          child: const Icon(Icons.login, color: Colors.orange),
        );
        break;
      case ConnectionStatus.newAesKey:
        blinkingWidget = BlinkingWidget(
          vsync: this,
          child: const Icon(Icons.add_moderator, color: Colors.yellow),
        );
        break;
      case ConnectionStatus.wrongAdapterVersion:
        blinkingWidget = BlinkingWidget(
          vsync: this,
          child: const Icon(Icons.update, color: Colors.yellow),
        );
        break;
      case ConnectionStatus.emptyAES:
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
              color: Colors.red,
            ),
            onPressed: () => {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (c) => const IoBrokerSettingsPage()),
              ),
            },
          ),
        );
    }
    return blinkingWidget;
  }
}

class MainViewOld extends StatefulWidget {
  const MainViewOld({super.key});

  @override
  State<MainViewOld> createState() => _MainViewOldState();
}

class _MainViewOldState extends State<MainViewOld>
    with TickerProviderStateMixin {
  late StreamController<int> _controller;
  int numberOfRows = 1;
  late StreamSubscription<ConnectionStatus> _ioConnectionSub;
  bool ioConnected = false;

  late TabController _tabController;

  @override
  void initState() {
    _controller = StreamController.broadcast();
    ioConnected = context
        .read<ConnectionServiceInterface>()
        .getConnectionStatus()
        .isConnected;
    context.read<GeneralRepository>().dialogStreamController.stream.listen((
      event,
    ) {
      showDialog(context: context, builder: event);
    });

    _tabController = TabController(initialIndex: 0, length: 1, vsync: this);

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

    return BlocBuilder<MainViewCubit, MainViewState>(
      bloc: MainViewCubit(
        connectionService: context.read<ConnectionServiceInterface>(),
        screenManager: context.read<ScreenRepository>(),
        customWidgetManager: context.read<CustomWidgetRepository>(),
      ),
      builder: (context, state) {
        List<Screen> screens = state.screens
            .where((element) => element.enabled)
            .toList();
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
            leading: Container(child: _getAppBarStatus(state.connectionStatus)),
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
                stream: context
                    .read<NotificationServiceImpl>()
                    .notificationStream,
                builder: (context, state) {
                  return Badge(
                    isLabelVisible:
                        context
                            .read<NotificationServiceImpl>()
                            .unreadNotifications >
                        0,
                    label:
                        context
                                .read<NotificationServiceImpl>()
                                .unreadNotifications >
                            0
                        ? Text(
                            "${context.read<NotificationServiceImpl>().unreadNotifications}",
                          )
                        : null,
                    child: IconButton(
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const NotificationLogViewScreen(),
                          ),
                        ),
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
                      builder: (context) => MainSettingsScreen(),
                    ),
                  ),
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
                  ScreenTab(screen: screens[i]),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: screens
                .map((t) => ScreenView(screen: t, numberOfRows: numberOfRows))
                .toList(),
          ),
        );
      },
    );
  }

  Widget? _getAppBarStatus(ConnectionStatus connectionStatus) {
    BlinkingWidget blinkingWidget;
    switch (connectionStatus) {
      case ConnectionStatus.connected:
      case ConnectionStatus.loggedIn:
        blinkingWidget = BlinkingWidget(
          vsync: this,
          disablerAfter: const Duration(seconds: 3),
          invisibleAfter: true,
          child: const Icon(Icons.done, color: Colors.green),
        );
        break;
      case ConnectionStatus.loggingIn:
        blinkingWidget = BlinkingWidget(
          vsync: this,
          child: const Icon(Icons.login, color: Colors.orange),
        );
        break;
      case ConnectionStatus.loginDeclined:
        blinkingWidget = BlinkingWidget(
          vsync: this,
          child: const Icon(Icons.login, color: Colors.orange),
        );
        break;
      case ConnectionStatus.newAesKey:
        blinkingWidget = BlinkingWidget(
          vsync: this,
          child: const Icon(Icons.add_moderator, color: Colors.yellow),
        );
        break;
      case ConnectionStatus.wrongAdapterVersion:
        blinkingWidget = BlinkingWidget(
          vsync: this,
          child: const Icon(Icons.update, color: Colors.yellow),
        );
        break;
      case ConnectionStatus.emptyAES:
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
              color: Colors.red,
            ),
            onPressed: () => {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (c) => const IoBrokerSettingsPage()),
              ),
            },
          ),
        );
    }
    return blinkingWidget;
  }
}
