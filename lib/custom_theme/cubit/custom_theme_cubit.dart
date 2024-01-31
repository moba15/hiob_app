import 'package:bloc/bloc.dart';
import 'package:smart_home/manager/manager.dart';

import '../custom_theme.dart';

part 'custom_theme_state.dart';

class CustomThemeCubit extends Cubit<CustomThemeState> {
  final Manager manager;
  CustomThemeCubit({required this.manager}) : super(CustomThemeState(customTheme: manager.themeManager.loadedCustomTheme));


  void loadTheme() async {
    manager.themeManager.stream.listen((event) {
      emit(CustomThemeState(customTheme: event));
    });


  }
}
