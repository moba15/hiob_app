import 'package:bloc/bloc.dart';
import 'package:smart_home/repository/notification_repository.dart';
import 'package:smart_home/services/impl/iobroker/notification_service.dart';

part 'notification_auth_state.dart';

class NotificationAuthCubit extends Cubit<NotificationAuthStatus> {
  final NotificationServiceImpl notificationService;

  NotificationAuthCubit({required this.notificationService})
    : super(notificationService.authStatus);

  Future<void> onNotificationsToggle(bool enabled) async {
    await notificationService.changeBackgroundNotificationsEnabled(enabled);

    if (!enabled) {
      await notificationService.updateAuthStatus(
        NotificationAuthStatus.loggedOut,
      );
      emit(NotificationAuthStatus.loggedOut);
      return;
    }

    emit(notificationService.authStatus);
  }

  Future<void> onCredentialsChanged({
    required String userUuid,
    required String password,
  }) async {
    await notificationService.updateUserUuid(userUuid);
    await notificationService.updatePassword(password);
  }

  Future<void> login({
    required String userUuid,
    required String password,
  }) async {
    final NotificationAuthStatus status = await notificationService.login(
      userUuid: userUuid,
      password: password,
    );
    emit(status);
  }
}
