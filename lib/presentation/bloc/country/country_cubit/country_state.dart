part of 'country_cubit.dart';

class CountryState extends Equatable {
  final TypeState status;
  final TableDataEntity<CountryEntity>? countryEntity;
  final String? errorMessage;

  const CountryState({
    this.status = TypeState.initial,
    this.errorMessage = '',
    this.countryEntity = const TableDataEntity(rows: [], totalRows: 0),
  });

  CountryState copyWith({
    TypeState? status,
    TableDataEntity<CountryEntity>? countryEntity,
    String? errorMessage,
  }) {
    return CountryState(
      status: status ?? this.status,
      countryEntity: countryEntity ?? this.countryEntity,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, countryEntity!, errorMessage!];
}
