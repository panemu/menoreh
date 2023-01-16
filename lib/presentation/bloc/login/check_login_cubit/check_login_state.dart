part of 'check_login_cubit.dart';

class CheckLoginState extends Equatable {
  final TypeState status;
  final bool value;
  final String? message;

  const CheckLoginState({
    this.status = TypeState.initial,
    this.value = false,
    this.message,
  });

  @override
  List<Object?> get props => [status, value, message];

  CheckLoginState copyWith({
    TypeState? status,
    bool? value,
    String? message,
  }) {
    return CheckLoginState(
      status: status ?? this.status,
      value: value ?? this.value,
      message: message ?? this.message,
    );
  }
}
