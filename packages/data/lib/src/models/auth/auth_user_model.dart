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
  final String authToken;
  @HiveField(4)
  final List<String> permissions;

  const AuthUserModel({
    required this.id,
    required this.role,
    required this.username,
    required this.authToken,
    required this.permissions,
  }) : super(
          id: id,
          role: role,
          username: username,
          authToken: authToken,
          permissions: permissions,
        );

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

  factory AuthUserModel.formJson(Map<String, dynamic> json) {
    return AuthUserModel(
      id: json['id'] as int,
      role: json['role'] as String,
      username: json['username'] as String,
      authToken: json['authToken'] as String,
      permissions: (json['permissions'] as List).map((e) => e.toString()).toList(),
    );
  }
}
