import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/manager/notification/custom_notification.dart';
import 'package:smart_home/notifications/bloc/notifications_bloc.dart';

class NotificationLogViewScreen extends StatelessWidget {
  const NotificationLogViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NotificationsBloc bloc = NotificationsBloc();
    bloc.add(NotificationsGetEvent());
    return PopScope(
      onPopInvoked: (didPop) {
        if (didPop) {
          bloc.add(NotificationsReadEvent());
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Notifications"),
          actions: [
            IconButton(
                onPressed: () {
                  bloc.add(NotificationsDeleteAllEvent());
                },
                icon: Icon(Icons.delete_forever))
          ],
        ),
        body: BlocProvider<NotificationsBloc>(
          create: (context) {
            return bloc;
          },
          child: const _NotificationLogBody(),
        ),
      ),
    );
  }
}

class _NotificationLogBody extends StatelessWidget {
  const _NotificationLogBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NotificationsBloc bloc = context.watch<NotificationsBloc>();
    if (bloc.state.customNotification.isEmpty) {
      return const Center(
        child: Text(
          "No Notifications!",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      );
    }
    List<CustomNotification> notifications =
        bloc.state.customNotification.reversed.toList();
    return ListView.builder(
        itemCount: bloc.state.customNotification.length,
        itemBuilder: (context, index) {
          return Dismissible(
              onDismissed: (direction) {
                bloc.add(NotificationsRemoveEvent(
                    index: notifications.length - index - 1));
              },
              key: ValueKey(notifications[index]),
              background: Container(
                color: const Color.fromARGB(255, 239, 235, 235),
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                  child: const Icon(Icons.delete_forever),
                ),
              ),
              secondaryBackground: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20.0),
                  child: const Icon(Icons.delete_forever),
                ),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.notifications_active,
                  color: notifications[index].color,
                ),
                trailing: notifications[index].getDateWidget(),
                title: Text(
                  notifications[index].title ?? "No Title",
                  style: TextStyle(
                      color:
                          notifications[index].read ? null : Colors.lightBlue),
                ),
                subtitle: Text(notifications[index].bodyText ?? "No Body"),
              ));
        });
  }
}
