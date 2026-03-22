import 'package:bloc/bloc.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/manager/theme/theme_manager.dart';
import 'package:smart_home/services/service_container.dart';

import '../custom_theme.dart';

part 'custom_theme_state.dart';

class CustomThemeCubit extends Cubit<CustomThemeState> {
  final ThemeManager themeManager;
  CustomThemeCubit({required this.themeManager})
    : super(CustomThemeState(customTheme: themeManager.loadedCustomTheme));

  void loadTheme() async {
    themeManager.stream.listen((event) {
      emit(CustomThemeState(customTheme: event));
    });
  }
}
