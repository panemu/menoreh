part of 'check_login_cubit.dart';

class CheckLoginState extends Equatable {
  final TypeState status;
  final AuthUserEntity userEntity;
  final String? message;

  const CheckLoginState({
    this.status = TypeState.initial,
    this.message,
    this.userEntity = const AuthUserEntity(
      id: 0,
      role: '',
      username: '',
      authToken: '',
      permissions: <String>[],
    ),
  });

  @override
  List<Object?> get props => [status, userEntity, message];

  CheckLoginState copyWith({
    TypeState? status,
    AuthUserEntity? userEntity,
    String? message,
  }) {
    return CheckLoginState(
      status: status ?? this.status,
      userEntity: userEntity ?? this.userEntity,
      message: message ?? this.message,
    );
  }
}
