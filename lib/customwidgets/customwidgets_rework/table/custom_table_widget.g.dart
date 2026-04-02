// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_table_widget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomTableWidgetImpl _$$CustomTableWidgetImplFromJson(
  Map<String, dynamic> json,
) => _$CustomTableWidgetImpl(
  type:
      $enumDecodeNullable(_$CustomWidgetTypeDeprecatedEnumMap, json['type']) ??
      CustomWidgetTypeDeprecated.tableNew,
  id: json['id'] as String,
  name: json['name'] as String,
  dataPoint: json['dataPoint'] as String?,
  header: json['header'] as String?,
  sortAsc: json['sortAsc'] as bool? ?? false,
  initalSortColumn: (json['initalSortColumn'] as num?)?.toInt() ?? 0,
  initialSortEnabled: json['initialSortEnabled'] as bool? ?? false,
  elementsPerPage: (json['elementsPerPage'] as num?)?.toInt() ?? 10,
  columns: Map<String, String>.from(json['columns'] as Map),
  customPopupmenu: json['customPopupmenu'] == null
      ? null
      : CustomPopupmenu.fromJson(
          json['customPopupmenu'] as Map<String, dynamic>,
        ),
  customTheme: json['customTheme'] == null
      ? null
      : CustomThemeForWidget.fromJson(
          json['customTheme'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$$CustomTableWidgetImplToJson(
  _$CustomTableWidgetImpl instance,
) => <String, dynamic>{
  'type': _$CustomWidgetTypeDeprecatedEnumMap[instance.type]!,
  'id': instance.id,
  'name': instance.name,
  'dataPoint': instance.dataPoint,
  'header': instance.header,
  'sortAsc': instance.sortAsc,
  'initalSortColumn': instance.initalSortColumn,
  'initialSortEnabled': instance.initialSortEnabled,
  'elementsPerPage': instance.elementsPerPage,
  'columns': instance.columns,
  'customPopupmenu': instance.customPopupmenu,
  'customTheme': instance.customTheme,
};

const _$CustomWidgetTypeDeprecatedEnumMap = {
  CustomWidgetTypeDeprecated.group: 'group',
  CustomWidgetTypeDeprecated.alertDialog: 'alertDialog',
  CustomWidgetTypeDeprecated.graph: 'graph',
  CustomWidgetTypeDeprecated.colorPallete: 'colorPallete',
  CustomWidgetTypeDeprecated.mediaPlayer: 'mediaPlayer',
  CustomWidgetTypeDeprecated.input: 'input',
  CustomWidgetTypeDeprecated.button: 'button',
  CustomWidgetTypeDeprecated.webViewNew: 'webViewNew',
  CustomWidgetTypeDeprecated.tableNew: 'tableNew',
  CustomWidgetTypeDeprecated.valueNew: 'valueNew',
  CustomWidgetTypeDeprecated.multiselection: 'multiselection',
  CustomWidgetTypeDeprecated.slider: 'slider',
  CustomWidgetTypeDeprecated.networkPlayer: 'networkPlayer',
  CustomWidgetTypeDeprecated.colorPicker: 'colorPicker',
  CustomWidgetTypeDeprecated.switchWidget: 'switchWidget',
  CustomWidgetTypeDeprecated.divisionLine: 'divisionLine',
  CustomWidgetTypeDeprecated.line: 'line',
};
