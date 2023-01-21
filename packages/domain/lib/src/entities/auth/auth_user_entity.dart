import 'package:equatable/equatable.dart';

class AuthUserEntity extends Equatable {
  final int id;
  final String role;
  final String username;
  final String authToken;
  final List<String> permissions;

  const AuthUserEntity({
    required this.id,
    required this.role,
    required this.username,
    required this.authToken,
    required this.permissions,
  });

  @override
  List<Object> get props {
    return [
      id,
      role,
      username,
      authToken,
      permissions,
    ];
  }

  @override
  bool get stringify => true;
}
