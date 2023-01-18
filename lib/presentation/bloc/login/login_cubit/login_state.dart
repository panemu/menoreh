part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = AuthState.initial,
    this.errorMessage = '',
    this.userEntity = const AuthUserEntity(
      id: 0,
      role: '',
      username: '',
      permissions: <String>[],
    ),
  });

  final AuthState status;
  final String? errorMessage;
  final AuthUserEntity? userEntity;

  @override
  List<Object> get props => [status, errorMessage!, userEntity!];

  LoginState copyWith({
    AuthState? status,
    String? errorMessage,
    AuthUserEntity? userEntity,
  }) {
    return LoginState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      userEntity: userEntity ?? this.userEntity,
    );
  }
}
