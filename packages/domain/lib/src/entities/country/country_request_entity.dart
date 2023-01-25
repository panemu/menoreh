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

  Map<String, dynamic> toPostJson() {
    return <String, dynamic>{
      'id': id,
      'capital': capital,
      'continent': continent,
      'independence': independence,
      'name': name,
      'population': population,
    };
  }

  Map<String, dynamic> toPutJson() {
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

  CountryRequestEntity copyWith({
    int? id,
    String? capital,
    String? continent,
    String? independence,
    String? name,
    int? population,
    int? version,
  }) {
    return CountryRequestEntity(
      id: id ?? this.id,
      capital: capital ?? this.capital,
      continent: continent ?? this.continent,
      independence: independence ?? this.independence,
      name: name ?? this.name,
      population: population ?? this.population,
      version: version ?? this.version,
    );
  }
}
