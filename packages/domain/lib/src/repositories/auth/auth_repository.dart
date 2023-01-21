import 'package:dartz/dartz.dart';
import 'package:data/core/_core.dart';
import 'package:domain/src/_src.dart';

abstract class AuthRepository {
  /// check local auth
  Future<Either<Failure, AuthUserEntity>> checkLogin();

  /// check local auth
  Future<Either<Failure, bool>> logout();

  /// get user data local
  Future<Either<Failure, AuthUserEntity>> getUserData();

  /// Login with email and password
  Future<Either<Failure, AuthUserEntity>> postLogin(AuthParamsEntity params);
  
  /// Register with email and password
  Future<Either<Failure, AuthUserEntity>> postRegister(AuthParamsEntity params);
}
