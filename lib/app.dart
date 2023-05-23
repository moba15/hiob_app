import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:smart_home/custom_theme/cubit/custom_theme_cubit.dart';
import 'package:smart_home/custom_theme/custom_theme.dart';
import 'package:smart_home/manager/cubit/manager_cubit.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/manager/screen_manager.dart';
import 'package:smart_home/view/main/main_screen.dart';
import 'package:smart_home/utils/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Init the MaterialApp widget: Controls the Theme of the complete App
class App extends StatelessWidget {
  final Manager manager;
  final ScreenManager screenManager;
  const App({Key? key, required this.manager,
    required this.screenManager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomThemeCubit, CustomThemeState>(
      bloc: CustomThemeCubit(manager),
      builder: (context, state) {
        return MaterialApp(
            key: key,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'), // English
            ],
            navigatorKey: Manager.navigatorKey,

            theme: Material3Theme.lightMaterial3Theme,
            themeMode: state.customTheme.customThemeBrightness.themeMode,
            darkTheme: Material3Theme.darkMaterial3Theme,
            home: RepositoryProvider<Manager>.value(
                value: manager,
                child: BlocProvider(
                    child: const MainPage(),
                    create: (_) => ManagerCubit(manager: manager)))
        );
      },
    );
  }
}
