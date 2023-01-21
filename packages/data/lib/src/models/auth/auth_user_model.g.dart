// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthUserModelAdapter extends TypeAdapter<AuthUserModel> {
  @override
  final int typeId = 0;

  @override
  AuthUserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthUserModel(
      id: fields[0] as int,
      role: fields[1] as String,
      username: fields[2] as String,
      authToken: fields[3] as String,
      permissions: (fields[4] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, AuthUserModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.role)
      ..writeByte(2)
      ..write(obj.username)
      ..writeByte(3)
      ..write(obj.authToken)
      ..writeByte(4)
      ..write(obj.permissions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthUserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
