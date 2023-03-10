import 'package:domain/domain.dart';

class CountryModel extends CountryEntity {
  final int id;
  final String capital;
  final String continent;
  final String independence;
  final String name;
  final int population;
  final int version;

  const CountryModel({
    required this.id,
    required this.capital,
    required this.continent,
    required this.independence,
    required this.name,
    required this.population,
    required this.version,
  }) : super(
          id: id,
          capital: capital,
          continent: continent,
          independence: independence,
          name: name,
          population: population,
          version: version,
        );

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

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['id'] as int,
      name: json['name'] ?? '',
      capital: json['capital'] ?? '',
      continent: json['continent'] ?? '' ,
      independence: json['independence'] ?? '',
      version: json['version']  ?? '',
      population: json['population'] ?? 0,
    );
  }
}
