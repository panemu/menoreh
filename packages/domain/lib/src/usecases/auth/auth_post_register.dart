import 'package:dartz/dartz.dart';
import 'package:data/core/_core.dart';
import 'package:domain/domain.dart';

class AuthPostRegister extends UseCase<AuthUserEntity, AuthParamsEntity> {
  final AuthRepository authRepository;

  AuthPostRegister(this.authRepository);

  @override
  Future<Either<Failure, AuthUserEntity>> call(AuthParamsEntity params) async {
    Either<Failure, AuthUserEntity> data = await authRepository.postRegister(params);

    return data.fold((failure) => Left(failure), (value) => Right(value));
  }
}