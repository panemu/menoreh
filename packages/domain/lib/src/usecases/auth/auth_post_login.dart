import 'package:dartz/dartz.dart';
import 'package:data/core/_core.dart';
import 'package:domain/domain.dart';

class AuthPostLogin extends UseCase<AuthUserEntity, AuthParamsEntity> {
  final AuthRepository authRepository;

  AuthPostLogin(this.authRepository);

  @override
  Future<Either<Failure, AuthUserEntity>> call(AuthParamsEntity params) async {
    Either<Failure, AuthUserEntity> data = await authRepository.postLogin(params);

    return data.fold((failure) => Left(failure), (value) => Right(value));
  }
}
