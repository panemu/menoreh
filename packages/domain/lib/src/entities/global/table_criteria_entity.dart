import 'package:equatable/equatable.dart';

class TableCriteriaEntity extends Equatable {
 	final String attributeName;
	final String value; 

  const TableCriteriaEntity({
    required this.attributeName,
    required this.value,
  });

  @override
  List<Object> get props => [attributeName, value];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'attributeName': attributeName,
      'value': value,
    };
  }

  TableCriteriaEntity copyWith({
    String? attributeName,
    String? value,
  }) {
    return TableCriteriaEntity(
      attributeName: attributeName ?? this.attributeName,
      value: value ?? this.value,
    );
  }
}
