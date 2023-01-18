part of 'user_info_cubit.dart';

class UserInfoState extends Equatable {
  final String? errorMessage;
  final TypeState status;
  final AuthUserEntity? userEntity;

  const UserInfoState({
    this.errorMessage,
    this.status = TypeState.initial,
    this.userEntity,
  });

  @override
  List<Object?> get props => [errorMessage, status, userEntity];

  UserInfoState copyWith({
    String? errorMessage,
    TypeState? status,
    AuthUserEntity? userEntity,
  }) {
    return UserInfoState(
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
      userEntity: userEntity ?? this.userEntity,
    );
  }
}
