import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home/customwidgets/customwidgets_rework/table/custom_table_widget.dart';

import 'package:smart_home/device/state/bloc/datapoint_bloc.dart';

class CustomTableWidgetView extends StatefulWidget {
  final CustomTableWidget customTableWidget;
  const CustomTableWidgetView({Key? key, required this.customTableWidget})
    : super(key: key);

  @override
  State<CustomTableWidgetView> createState() => _CustomTableWidgetViewState();
}

class _CustomTableWidgetViewState extends State<CustomTableWidgetView> {
  int? sortedColumn;
  late bool sortedAsc;
  late bool sort;
  DataPointBloc? _bloc;

  @override
  void initState() {
    sort = widget.customTableWidget.initialSortEnabled;
    if (sort) {
      sortedColumn = widget.customTableWidget.initalSortColumn;
    }
    if (widget.customTableWidget.dataPoint != null) {
      _bloc = DataPointBloc(widget.customTableWidget.dataPoint!);
    }
    sortedAsc = widget.customTableWidget.sortAsc;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    sort = widget.customTableWidget.initialSortEnabled;
    if (sort) {
      sortedColumn = widget.customTableWidget.initalSortColumn;
    }
    _bloc?.close();
    if (widget.customTableWidget.dataPoint != null) {
      _bloc = DataPointBloc(widget.customTableWidget.dataPoint!);
    }
    sortedAsc = widget.customTableWidget.sortAsc;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _bloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.customTableWidget.dataPoint == null) {
      return const ListTile(title: Text("Error 404: Device Not found"));
    }
    return BlocBuilder<DataPointBloc, DataPointState>(
      bloc: _bloc,
      builder: (c, state) {
        List<Map<String, dynamic>> data = [];
        if (state.value is! String) {
          return const Text("No valid data format");
        }
        List<dynamic> raw = jsonDecode(state.value ?? "[]");
        for (Map m in raw) {
          data.add(Map.from(m));
        }
        int rowsPerPage = (widget.customTableWidget.elementsPerPage <= 0
            ? data.length
            : widget.customTableWidget.elementsPerPage);
        if (rowsPerPage <= 0) {
          rowsPerPage = 1;
        }
        return PaginatedDataTable(
          header: Text(widget.customTableWidget.header ?? ""),
          headingRowHeight: 30,
          sortColumnIndex: sortedColumn,
          sortAscending: sortedAsc,
          rowsPerPage: rowsPerPage,
          columns: widget.customTableWidget.columns.entries
              .map(
                (e) => DataColumn(
                  label: Text(e.value),
                  onSort: (i, asc) => _sortByKey(
                    i,
                    data,
                    asc,
                    widget.customTableWidget.columns.keys.toList(),
                  ),
                ),
              )
              .toList(),
          source: _DataSource(
            data: data,
            columnKeys: widget.customTableWidget.columns.keys.toList(),
            asc: sortedAsc,
            sort: sort,
            sortCol: sortedColumn,
          ),
        );
      },
    );
  }

  void _sortByKey(
    int index,
    List<Map<String, dynamic>> data,
    bool asc,
    List<String> columns,
  ) {
    setState(() {
      sortedAsc = asc;
      sortedColumn = index;
      sort = true;
    });
  }
}

class _DataSource extends DataTableSource {
  List<Map<String, dynamic>> data;
  List<String> columnKeys;
  int? sortCol;
  bool sort;
  bool asc;
  _DataSource({
    required this.data,
    required this.columnKeys,
    required this.sortCol,
    required this.asc,
    required this.sort,
  }) {
    if (sortCol != null && sort) {
      _sortByKey(sortCol!, data, asc, columnKeys);
    }
  }
  @override
  DataRow? getRow(int index) {
    Map<String, dynamic> row = data[index];

    return DataRow.byIndex(index: index, cells: getCells(row));
  }

  void _sortByKey(
    int index,
    List<Map<String, dynamic>> data,
    bool asc,
    List<String> columns,
  ) {
    String colToSort = columns[index];
    data.sort((a, b) {
      dynamic valueA = a[colToSort];
      dynamic valueB = b[colToSort];
      if (valueA == null && valueB != null) {
        if (asc) {
          return -1;
        }
        return 1;
      } else if (valueA != null && valueB == null) {
        if (asc) {
          return 1;
        }
        return -1;
      } else if (valueA == null && valueB == null) {
        return 0;
      }
      if (!asc) {
        return valueA.toString().compareTo(valueB.toString());
      } else {
        return valueB.toString().compareTo(valueA.toString());
      }
    });
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;

  List<DataCell> getCells(Map<String, dynamic> row) {
    List<DataCell> d = [];
    for (String col in columnKeys) {
      dynamic value = row[col];
      d.add(DataCell(Text(value.toString())));
    }

    return d;
  }
}
