part of 'country_post_cubit.dart';

class CountryPostState extends Equatable {
  final TypeState status;
  final bool? value;
  final String? errorMessage;

  const CountryPostState({
    this.status = TypeState.initial,
    this.errorMessage = '',
    this.value = false,
  });

  CountryPostState copyWith({
    TypeState? status,
    bool? value,
    String? errorMessage,
  }) {
    return CountryPostState(
      status: status ?? this.status,
      value: value ?? this.value,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, value!, errorMessage!];
}
