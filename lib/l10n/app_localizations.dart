import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// Title of the Screen (listing) Settings Page
  ///
  /// In en, this message translates to:
  /// **'Screen Settings'**
  String get screenSettingsPageTitle;

  /// Title of the Screen Add Page
  ///
  /// In en, this message translates to:
  /// **'Add Screen'**
  String get screenAddPageTitle;

  /// No description provided for @template_widget_settings_page_title.
  ///
  /// In en, this message translates to:
  /// **'Widget Templates'**
  String get template_widget_settings_page_title;

  /// No description provided for @device_settings_page_title.
  ///
  /// In en, this message translates to:
  /// **'Device Settings'**
  String get device_settings_page_title;

  /// No description provided for @device_add_page_title.
  ///
  /// In en, this message translates to:
  /// **'Add Device'**
  String get device_add_page_title;

  /// No description provided for @no_device_found.
  ///
  /// In en, this message translates to:
  /// **'There are no Devices'**
  String get no_device_found;

  /// No description provided for @edit_template_page_title.
  ///
  /// In en, this message translates to:
  /// **'Edit Template'**
  String get edit_template_page_title;

  /// No description provided for @no_templates_found.
  ///
  /// In en, this message translates to:
  /// **'There are no Widget templates'**
  String get no_templates_found;

  /// No description provided for @add_data_point.
  ///
  /// In en, this message translates to:
  /// **'Add State man.'**
  String get add_data_point;

  /// No description provided for @add_enum.
  ///
  /// In en, this message translates to:
  /// **'Add Enum'**
  String get add_enum;

  /// No description provided for @settings_page_screen_setting.
  ///
  /// In en, this message translates to:
  /// **'Screen Settings'**
  String get settings_page_screen_setting;

  /// No description provided for @settings_page_widget_setting.
  ///
  /// In en, this message translates to:
  /// **'Template Settings'**
  String get settings_page_widget_setting;

  /// No description provided for @settings_page_device_setting.
  ///
  /// In en, this message translates to:
  /// **'Device Settings'**
  String get settings_page_device_setting;

  /// No description provided for @settings_page_iobroker_settings.
  ///
  /// In en, this message translates to:
  /// **'IoBroker Settings'**
  String get settings_page_iobroker_settings;

  /// No description provided for @settings_page_general_settings.
  ///
  /// In en, this message translates to:
  /// **'General Settings'**
  String get settings_page_general_settings;

  /// No description provided for @settings_page_config_sync.
  ///
  /// In en, this message translates to:
  /// **'Config Sync'**
  String get settings_page_config_sync;

  /// No description provided for @group_edit_page_title.
  ///
  /// In en, this message translates to:
  /// **'Edit group'**
  String get group_edit_page_title;

  /// No description provided for @screen_edit_page_title.
  ///
  /// In en, this message translates to:
  /// **'Edit screen'**
  String get screen_edit_page_title;

  /// No description provided for @general_settings_page_title.
  ///
  /// In en, this message translates to:
  /// **'General settings'**
  String get general_settings_page_title;

  /// No description provided for @export.
  ///
  /// In en, this message translates to:
  /// **'Export'**
  String get export;

  /// No description provided for @import.
  ///
  /// In en, this message translates to:
  /// **'Import'**
  String get import;

  /// No description provided for @vibration.
  ///
  /// In en, this message translates to:
  /// **'Vibration'**
  String get vibration;

  /// No description provided for @device_name.
  ///
  /// In en, this message translates to:
  /// **'Device name'**
  String get device_name;

  /// No description provided for @device_id.
  ///
  /// In en, this message translates to:
  /// **'device_id'**
  String get device_id;

  /// No description provided for @background_notifications.
  ///
  /// In en, this message translates to:
  /// **'Background notifications'**
  String get background_notifications;

  /// No description provided for @select_widget_template_alert_title.
  ///
  /// In en, this message translates to:
  /// **'Select Widget Template'**
  String get select_widget_template_alert_title;

  /// No description provided for @add_group_alert_title.
  ///
  /// In en, this message translates to:
  /// **'Add Group'**
  String get add_group_alert_title;

  /// No description provided for @add_divider_alert_title.
  ///
  /// In en, this message translates to:
  /// **'Add Divider'**
  String get add_divider_alert_title;

  /// No description provided for @not_saved_alert_title.
  ///
  /// In en, this message translates to:
  /// **'Changes not saved'**
  String get not_saved_alert_title;

  /// No description provided for @want_to_exit_alert.
  ///
  /// In en, this message translates to:
  /// **'Do you want to exit without save'**
  String get want_to_exit_alert;

  /// No description provided for @group_name.
  ///
  /// In en, this message translates to:
  /// **'Group Name'**
  String get group_name;

  /// No description provided for @enabled.
  ///
  /// In en, this message translates to:
  /// **'Enabled'**
  String get enabled;

  /// No description provided for @expanded.
  ///
  /// In en, this message translates to:
  /// **'Expanded'**
  String get expanded;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @thickness.
  ///
  /// In en, this message translates to:
  /// **'Thickness'**
  String get thickness;

  /// No description provided for @exit.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get exit;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @data_points.
  ///
  /// In en, this message translates to:
  /// **'States'**
  String get data_points;

  /// No description provided for @custom_theme_settings_page_title.
  ///
  /// In en, this message translates to:
  /// **'Custom Theme Settings'**
  String get custom_theme_settings_page_title;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
