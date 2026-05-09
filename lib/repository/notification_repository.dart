import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:smart_home/manager/file_manager.dart';
import 'package:smart_home/services/notification/custom_notification.dart';

enum NotificationAuthStatus { loggedOut, loggedInAndEnabled, error }

class NotificationRepository {
  final FileManager fileManager;
  final FlutterSecureStorage secureStorage;

  final String _settingsKey = 'notificationSettings';
  final String _passwordKey = 'notificationSettingsPassword';
  final String _logKey = 'notificationLog';

  bool backgroundNotificationsEnabled = false;
  String userUuid = '';
  NotificationAuthStatus authStatus = NotificationAuthStatus.loggedOut;
  List<CustomNotification> notificationLog = [];

  NotificationRepository({
    required this.fileManager,
    FlutterSecureStorage? secureStorage,
  }) : secureStorage = secureStorage ?? const FlutterSecureStorage();

  Future<void> load() async {
    if (!await fileManager.containsKey(_settingsKey)) {
      await fileManager.writeJSON(_settingsKey, _defaultSettings());
    }

    final Map<String, dynamic> settings =
        (await fileManager.getMap(_settingsKey)) ?? _defaultSettings();

    backgroundNotificationsEnabled =
        settings['backgroundNotificationsEnabled'] == true;
    userUuid = (settings['userUuid'] as String?) ?? '';

    final String rawStatus =
        (settings['authStatus'] as String?) ??
        NotificationAuthStatus.loggedOut.name;
    authStatus = NotificationAuthStatus.values.firstWhere(
      (value) => value.name == rawStatus,
      orElse: () => NotificationAuthStatus.loggedOut,
    );

    if (await fileManager.containsKey(_logKey)) {
      final List<dynamic>? log = await fileManager.getJSON(_logKey);
      if (log != null) {
        notificationLog =
            log.map((e) => CustomNotification.fromJSON(e)).toList();
      }
    }

    await _save();
  }

  Future<void> saveNotificationLog() async {
    await fileManager.writeJSON(
      _logKey,
      notificationLog.map((e) => e.toJson()).toList(),
    );
  }

  Future<void> clearNotificationLog() async {
    notificationLog.clear();
    await saveNotificationLog();
  }

  Future<void> updateBackgroundNotificationsEnabled(bool enabled) async {
    backgroundNotificationsEnabled = enabled;
    if (!enabled) {
      authStatus = NotificationAuthStatus.loggedOut;
    }
    await _save();
  }

  Future<void> updateUserUuid(String uuid) async {
    userUuid = uuid;
    await _save();
  }

  Future<void> updateAuthStatus(NotificationAuthStatus status) async {
    authStatus = status;
    await _save();
  }

  Future<String> getPassword() async {
    return await secureStorage.read(key: _passwordKey) ?? '';
  }

  Future<void> updatePassword(String password) async {
    if (password.isEmpty) {
      await secureStorage.delete(key: _passwordKey);
      return;
    }

    await secureStorage.write(key: _passwordKey, value: password);
  }

  Map<String, dynamic> _defaultSettings() {
    return {
      'backgroundNotificationsEnabled': false,
      'userUuid': '',
      'authStatus': NotificationAuthStatus.loggedOut.name,
    };
  }

  Future<void> _save() async {
    await fileManager.writeJSON(_settingsKey, {
      'backgroundNotificationsEnabled': backgroundNotificationsEnabled,
      'userUuid': userUuid,
      'authStatus': authStatus.name,
    });
  }
}
