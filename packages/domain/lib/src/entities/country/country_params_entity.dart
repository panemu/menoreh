import 'package:domain/src/entities/global/_global.dart';
import 'package:equatable/equatable.dart';

class CountryParamsEntity extends Equatable {
  final int? start;
  final int? max;
  final TableQueryEntity? tableQuery;

  const CountryParamsEntity({
    this.start = 0,
    this.max = 999,
    this.tableQuery = const TableQueryEntity(
      tableCriteria: [],
      sortingInfos: [],
    ),
  });

  @override
  List<Object> get props => [start!, max!, tableQuery!];

  @override
  bool get stringify => true;
}
