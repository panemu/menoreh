import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

part 'auth_user_model.g.dart';

@HiveType(typeId: HiveTypes.authUserModel, adapterName: HiveAdapters.authUserModel)
class AuthUserModel extends AuthUserEntity {
  @HiveField(0)
  final String authToken;
  @HiveField(1)
  final int id;
  @HiveField(2)
  final String role;
  @HiveField(3)
  final String username;
  @HiveField(4)
  final List<String> permissions;

  const AuthUserModel({
    required this.authToken,
    required this.id,
    required this.role,
    required this.username,
    required this.permissions,
  }) : super(
          authToken: authToken,
          id: id,
          role: role,
          username: username,
          permissions: permissions,
        );

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

  factory AuthUserModel.fromJson(String source) =>
      AuthUserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory AuthUserModel.fromMap(Map<String, dynamic> map) {
    return AuthUserModel(
      authToken: map['authToken'] as String,
      id: map['id'] as int,
      role: map['role'] as String,
      username: map['username'] as String,
      permissions: List<String>.from((map['permissions'] as List<String>)),
    );
  }
}
