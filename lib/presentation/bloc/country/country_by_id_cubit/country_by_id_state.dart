part of 'country_by_id_cubit.dart';

class CountryByIdState extends Equatable {
  final TypeState status;
  final CountryEntity? countryEntity;
  final String? errorMessage;

  const CountryByIdState({
    this.status = TypeState.initial,
    this.errorMessage = '',
    this.countryEntity,
  });

  CountryByIdState copyWith({
    TypeState? status,
    CountryEntity? countryEntity,
    String? errorMessage,
  }) {
    return CountryByIdState(
      status: status ?? this.status,
      countryEntity: countryEntity ?? this.countryEntity,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, countryEntity!, errorMessage!];
}
