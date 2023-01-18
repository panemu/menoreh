part of 'logout_cubit.dart';

class LogoutState extends Equatable {
  final String? errorMessage;
  final TypeState status;

  const LogoutState({
    this.errorMessage = '',
    this.status = TypeState.initial,
  });

  @override
  List<Object> get props => [errorMessage!, status];

  LogoutState copyWith({
    String? errorMessage,
    TypeState? status,
  }) {
    return LogoutState(
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
    );
  }
}
