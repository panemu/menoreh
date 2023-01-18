import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({required this.remoteDatasource, required this.localDatasource});

  final AuthRemoteDatasource remoteDatasource;
  final AuthLocalDatasource localDatasource;

  @override
  Future<Either<Failure, bool>> checkLogin() async {
    try {
      bool status = await localDatasource.checkLogin();

      return Right(status);
    } catch (e) {
      if (e is CacheException) {
        return Left(CacheFailure(message: e.message));
      } else {
        return Left(UnknownFailure(message: FAILURE_UNKNOWN));
      }
    }
  }

  @override
  Future<Either<Failure, AuthUserEntity>> getUserData() async {
    try {
      AuthUserEntity user = await localDatasource.getUserData();

      return Right(user);
    } catch (e) {
      if (e is CacheException) {
        return Left(CacheFailure(message: e.message));
      } else {
        return Left(UnknownFailure(message: FAILURE_UNKNOWN));
      }
    }
  }

  @override
  Future<Either<Failure, AuthUserEntity>> postLogin(AuthParamsEntity params) async {
    try {
      AuthUserEntity user = await remoteDatasource.postLoginCredentials(params);

      localDatasource.cacheLogin(user as AuthUserModel);

      return Right(user);
    } catch (e) {
      if (e is AuthException) {
        return Left(AuthFailure(message: e.message));
      } else if (e is CacheException) {
        return Left(CacheFailure(message: e.message));
      } else {
        return Left(UnknownFailure(message: FAILURE_UNKNOWN));
      }
    }
  }

  @override
  Future<Either<Failure, AuthUserEntity>> postRegister(AuthParamsEntity params) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      await remoteDatasource.logout();
      final data = await localDatasource.logout();

      return Right(data);
    } catch (e) {
      if (e is ServerException) {
        return Left(ServerFailure(message: e.message));
      } else if (e is CacheException) {
        return Left(CacheFailure(message: e.message));
      } else {
        return Left(UnknownFailure(message: FAILURE_UNKNOWN));
      }
    }
  }
}
