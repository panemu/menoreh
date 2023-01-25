// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'country_cubit.dart';

class CountryState extends Equatable {
  final TypeState status;
  final TableDataEntity<CountryEntity>? countryEntity;
  final int? totalPopulation;
  final int? totalCountry;
  final String? latestIndependence;
  final String? earliestIndependence;
  final String? errorMessage;

  const CountryState({
    this.totalPopulation = 0,
    this.totalCountry = 0,
    this.latestIndependence = '',
    this.earliestIndependence = '',
    this.status = TypeState.initial,
    this.errorMessage = '',
    this.countryEntity = const TableDataEntity(rows: [], totalRows: 0),
  });

  CountryState copyWith({
    TypeState? status,
    TableDataEntity<CountryEntity>? countryEntity,
    int? totalPopulation,
    int? totalCountry,
    String? latestIndependence,
    String? earliestIndependence,
    String? errorMessage,
  }) {
    return CountryState(
      status: status ?? this.status,
      countryEntity: countryEntity ?? this.countryEntity,
      totalPopulation: totalPopulation ?? this.totalPopulation,
      totalCountry: totalCountry ?? this.totalCountry,
      latestIndependence: latestIndependence ?? this.latestIndependence,
      earliestIndependence: earliestIndependence ?? this.earliestIndependence,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props {
    return [
      status,
      countryEntity!,
      totalPopulation!,
      totalCountry!,
      latestIndependence!,
      earliestIndependence!,
      errorMessage!,
    ];
  }
}
