import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String uid;
  final String email;
  final String displayName;
  final String photoUrl;
  final int packageId;
  final int methodId;
  final int roleId;
  final bool isActive;
  final int createData;
  final int updataData;

  const ProfileEntity({
    required this.uid,
    required this.email,
    required this.displayName,
    required this.photoUrl,
    required this.packageId,
    required this.methodId,
    required this.roleId,
    required this.isActive,
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
      packageId,
      methodId,
      roleId,
      isActive,
      createData,
      updataData,
    ];
  }
}
