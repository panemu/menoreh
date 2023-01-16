part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage = '',
    this.userEntity,
  });

  final Email email;
  final Password password;
  final FormzStatus status;
  final String? errorMessage;
  final AuthUserEntity? userEntity;

  @override
  List<Object> get props => [email, password, status, userEntity!];

  LoginState copyWith({
    Email? email,
    Password? password,
    FormzStatus? status,
    String? errorMessage,
    AuthUserEntity? userEntity,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      userEntity: userEntity ?? this.userEntity,
    );
  }
}
