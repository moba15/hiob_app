import 'dart:async';

import 'package:smart_home/custom_theme/custom_theme.dart';
import 'package:smart_home/manager/file_manager.dart';

class ThemeRepository {
  final FileManager fileManager;
  CustomTheme _loadedCustomTheme = CustomTheme(
    customThemeBrightness: CustomThemeBrightness.system,
    customThemeMaterialVersion: CustomThemeMaterialVersion.material3,
  );
  final StreamController<CustomTheme> _themeStreamSubscription =
      StreamController<CustomTheme>.broadcast();

  ThemeRepository({required this.fileManager});

  Future<void> loadTheme() async {
    Map<String, dynamic> customThemeJson =
        await fileManager.getMap("customTheme") ?? _loadedCustomTheme.toJson();
    _loadedCustomTheme = CustomTheme.fromJson(customThemeJson);
  }

  Future<bool> changeTheme({required CustomTheme customTheme}) async {
    _loadedCustomTheme = customTheme;
    fileManager.writeJSON("customTheme", _loadedCustomTheme.toJson());
    _themeStreamSubscription.add(customTheme);
    return true;
  }

  Stream<CustomTheme> get stream {
    return _themeStreamSubscription.stream;
  }

  CustomTheme get loadedCustomTheme {
    return _loadedCustomTheme;
  }
}
