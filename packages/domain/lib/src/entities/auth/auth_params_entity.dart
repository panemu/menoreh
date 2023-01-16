import 'dart:convert';
import 'package:equatable/equatable.dart';

class AuthParamsEntity extends Equatable {
  final String email;
  final String password;

  const AuthParamsEntity({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];

  String toJson() => json.encode(toMap());
  
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }
}
