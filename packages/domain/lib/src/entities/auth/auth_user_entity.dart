import 'package:equatable/equatable.dart';

class AuthUserEntity extends Equatable {
  final String authToken;
  final int id;
  final String role;
  final String username;
  final List<String> permissions;

  const AuthUserEntity({
    required this.authToken,
    required this.id,
    required this.role,
    required this.username,
    required this.permissions,
  });

  @override
  List<Object> get props {
    return [
      authToken,
      id,
      role,
      username,
      permissions,
    ];
  }
}
