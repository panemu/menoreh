part of 'country_delete_cubit.dart';

class CountryDeleteState extends Equatable {
   final TypeState status;
  final bool? value;
  final String? errorMessage;

  const CountryDeleteState({
    this.status = TypeState.initial,
    this.errorMessage = '',
    this.value = false,
  });

  CountryDeleteState copyWith({
    TypeState? status,
    bool? value,
    String? errorMessage,
  }) {
    return CountryDeleteState(
      status: status ?? this.status,
      value: value ?? this.value,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, value!, errorMessage!];
}
