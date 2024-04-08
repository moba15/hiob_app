import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:smart_home/custom_theme/cubit/custom_theme_cubit.dart';
import 'package:smart_home/custom_theme/custom_theme.dart';
import 'package:smart_home/manager/cubit/manager_cubit.dart';
import 'package:smart_home/manager/manager.dart';
import 'package:smart_home/manager/screen_manager.dart';
import 'package:smart_home/view/main/main_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Init the MaterialApp widget: Controls the Theme of the complete App
class App extends StatelessWidget {
  final Manager manager;
  final ScreenManager screenManager;
  const App({Key? key, required this.manager, required this.screenManager})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomThemeCubit, CustomThemeState>(
      bloc: CustomThemeCubit(manager: manager)..loadTheme(),
      builder: (context, state) {
        debugPrint("Change Theme");

        return MaterialApp(
            builder: (context, child) {
              // Retrieve the MediaQueryData from the current context.
              final mediaQueryData = MediaQuery.of(context);

              // Calculate the scaled text factor using the clamp function to ensure it stays within a specified range.
              final scale = mediaQueryData.textScaler.clamp(
                minScaleFactor: state
                    .customTheme.textScale, // Minimum scale factor allowed.
                maxScaleFactor: state
                    .customTheme.textScale, // Maximum scale factor allowed.
              );

              // Create a new MediaQueryData with the updated text scaling factor.
              // This will override the existing text scaling factor in the MediaQuery.
              // This ensures that text within this subtree is scaled according to the calculated scale factor.
              return MediaQuery(
                // Copy the original MediaQueryData and replace the textScaler with the calculated scale.
                data: mediaQueryData.copyWith(
                  textScaler: scale,
                ),
                // Pass the original child widget to maintain the widget hierarchy.
                child: child!,
              );
            },
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
            theme: state.customTheme.themeDataLight,
            themeMode: state.customTheme.customThemeBrightness.themeMode,
            darkTheme: state.customTheme.themeDataDark,
            home: RepositoryProvider<Manager>.value(
                value: manager,
                child: BlocProvider(
                    child: const MainPage(),
                    create: (_) => ManagerCubit(manager: manager))));
      },
    );
  }
}
