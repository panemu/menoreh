import 'package:dartz/dartz.dart';
import 'package:data/core/_core.dart';
import 'package:domain/domain.dart';

class AuthCheck extends UseCase<bool, NoParams> {
  final AuthRepository authRepository;

  AuthCheck(this.authRepository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    Either<Failure, bool> data = await authRepository.checkLogin();

    return data.fold((failure) => Left(failure), (value) => Right(value));
  }
}