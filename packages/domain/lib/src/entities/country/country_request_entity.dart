import 'package:equatable/equatable.dart';

class CountryRequestEntity extends Equatable {
  final int id;
  final String capital;
  final String continent;
  final String independence;
  final String name;
  final int population;
  final int version;

  const CountryRequestEntity({
    required this.id,
    required this.capital,
    required this.continent,
    required this.independence,
    required this.name,
    required this.population,
    required this.version,
  });

  @override
  List<Object> get props {
    return [
      capital,
      continent,
      id,
      independence,
      name,
      population,
      version,
    ];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'capital': capital,
      'continent': continent,
      'independence': independence,
      'name': name,
      'population': population,
      'version': version,
    };
  }

  @override
  bool get stringify => true;
}
