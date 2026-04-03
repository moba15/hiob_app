import 'package:bloc/bloc.dart';
import 'package:smart_home/custom_theme/theme_repository.dart';

import '../custom_theme.dart';

part 'custom_theme_state.dart';

class CustomThemeCubit extends Cubit<CustomThemeState> {
  final ThemeRepository themeRepository;
  CustomThemeCubit({required this.themeRepository})
    : super(CustomThemeState(customTheme: themeRepository.loadedCustomTheme));

  void loadTheme() async {
    themeRepository.stream.listen((event) {
      emit(CustomThemeState(customTheme: event));
    });
  }
}
