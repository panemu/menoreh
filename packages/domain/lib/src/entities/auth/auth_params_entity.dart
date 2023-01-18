import 'dart:convert';
import 'package:equatable/equatable.dart';

class AuthParamsEntity extends Equatable {
  final String username;
  final String password;

  const AuthParamsEntity({
    required this.username,
    required this.password,
  });

  @override
  List<Object> get props => [username, password];

  String toJson() => json.encode(toMap());
  
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
    };
  }
}
