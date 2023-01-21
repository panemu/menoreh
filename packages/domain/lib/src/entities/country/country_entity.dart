import 'package:equatable/equatable.dart';

class CountryEntity extends Equatable {
  final int id;
  final String capital;
  final String continent;
  final String independence;
  final String name;
  final int population;
  final int version;

  const CountryEntity({
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

  @override
  bool get stringify => true;
}
