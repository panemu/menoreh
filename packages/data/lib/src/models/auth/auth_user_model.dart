import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

part 'auth_user_model.g.dart';

@HiveType(typeId: HiveTypes.authUserModel, adapterName: HiveAdapters.authUserModel)
class AuthUserModel extends AuthUserEntity {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String role;
  @HiveField(2)
  final String username;
  @HiveField(3)
  final List<String> permissions;

  const AuthUserModel({
    required this.id,
    required this.role,
    required this.username,
    required this.permissions,
  }) : super(
          id: id,
          role: role,
          username: username,
          permissions: permissions,
        );

  @override
  List<Object> get props {
    return [
      id,
      role,
      username,
      permissions,
    ];
  }

  factory AuthUserModel.toJson(Map<String, dynamic> json) {
    return AuthUserModel(
      id: json['id'] as int,
      role: json['role'] as String,
      username: json['username'] as String,
      permissions: (json['permissions'] as List).map((e) => e.toString()).toList(),
    );
  }
}
