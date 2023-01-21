import 'package:domain/src/entities/global/_global.dart';
import 'package:equatable/equatable.dart';

class TableQueryEntity extends Equatable {
  final List<TableCriteriaEntity> tableCriteria;
  final List<SortingInfoEntity> sortingInfos;

  const TableQueryEntity({
    required this.tableCriteria,
    required this.sortingInfos,
  });

  @override
  List<Object> get props => [tableCriteria, sortingInfos];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'tableCriteria': tableCriteria,
      'sortingInfos': sortingInfos,
    };
  }
}
