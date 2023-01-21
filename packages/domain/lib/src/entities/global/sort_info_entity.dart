import 'package:equatable/equatable.dart';

class SortingInfoEntity extends Equatable {
  final String attributeName;
  final String direction;

  const SortingInfoEntity({
    required this.attributeName,
    required this.direction,
  });

  @override
  List<Object> get props => [attributeName, direction];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'attributeName': attributeName,
      'direction': direction,
    };
  }
}
