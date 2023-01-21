part of 'country_put_cubit.dart';

class CountryPutState extends Equatable {
  final TypeState status;
  final bool? value;
  final String? errorMessage;

  const CountryPutState({
    this.status = TypeState.initial,
    this.errorMessage = '',
    this.value = false,
  });

  CountryPutState copyWith({
    TypeState? status,
    bool? value,
    String? errorMessage,
  }) {
    return CountryPutState(
      status: status ?? this.status,
      value: value ?? this.value,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, value!, errorMessage!];
}
