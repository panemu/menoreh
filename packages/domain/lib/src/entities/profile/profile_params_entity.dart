import 'package:equatable/equatable.dart';

class ProfileParamsEntity extends Equatable {
  final String uid;
  final String email;
  final String displayName;
  final String photoUrl;
  final String methodLogin;
  final String role;
  final int createData;
  final int updataData;

  const ProfileParamsEntity({
    required this.uid,
    required this.email,
    required this.displayName,
    required this.photoUrl,
    required this.methodLogin,
    required this.role,
    required this.createData,
    required this.updataData,
  });

  @override
  List<Object> get props {
    return [
      uid,
      email,
      displayName,
      photoUrl,
      methodLogin,
      role,
      createData,
      updataData,
    ];
  }

  ProfileParamsEntity copyWith({
    String? uid,
    String? email,
    String? displayName,
    String? photoUrl,
    String? methodLogin,
    String? role,
    int? createData,
    int? updataData,
  }) {
    return ProfileParamsEntity(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      photoUrl: photoUrl ?? this.photoUrl,
      methodLogin: methodLogin ?? this.methodLogin,
      role: role ?? this.role,
      createData: createData ?? this.createData,
      updataData: updataData ?? this.updataData,
    );
  }
}
