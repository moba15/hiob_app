import 'dart:async';

import 'package:smart_home/custom_theme/custom_theme.dart';
import 'package:smart_home/manager/manager.dart';

class ThemeManager {
  final Manager manager;
  CustomTheme _loadedCustomTheme = Material3DarkCustomTheme();
  final StreamController<CustomTheme> _themeStreamSubscription = StreamController<CustomTheme>.broadcast();

  ThemeManager({required this.manager});



  void loadTheme() async {
    Map<String, dynamic> customThemeJson = await manager.fileManager.getMap("customTheme") ?? _loadedCustomTheme.toJson();
    _loadedCustomTheme = CustomTheme.fromJson(customThemeJson);



  }




  Future<bool> changeTheme({required CustomTheme customTheme}) async {
    _loadedCustomTheme = customTheme;
    manager.fileManager.writeJSON("customTheme", _loadedCustomTheme.toJson());
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




class ThemeRepository {

}