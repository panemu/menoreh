import 'package:equatable/equatable.dart';

class TableDataEntity<T> extends Equatable {
  final List<T> rows;
  final int totalRows;

  const TableDataEntity({
    required this.rows,
    required this.totalRows,
  });

  @override
  List<Object> get props => [rows, totalRows];

  TableDataEntity get empty => TableDataEntity<T>(rows: const [], totalRows: 0);

  factory TableDataEntity.fromMap(Map<String, dynamic> map, Function(List data) f) {
    return TableDataEntity(
      rows: f(map['rows']),
      totalRows: map['totalRows'],
    );
  }
}
