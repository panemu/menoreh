import 'package:equatable/equatable.dart';

class AuthUserEntity extends Equatable {
  final int id;
  final String role;
  final String username;
  final List<String> permissions;

  const AuthUserEntity({
    required this.id,
    required this.role,
    required this.username,
    required this.permissions,
  });

  factory AuthUserEntity.empty() {
    return const AuthUserEntity(
      id: 0,
      role: '',
      username: '',
      permissions: <String>[],
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      role,
      username,
      permissions,
    ];
  }
}
