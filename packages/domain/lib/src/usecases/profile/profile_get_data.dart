import 'package:dartz/dartz.dart';
import 'package:data/core/_core.dart';
import 'package:domain/domain.dart';

class ProfileGetData extends UseCase<ProfileEntity, NoParams> {
  final ProfileRepository profileRepository;

  ProfileGetData(this.profileRepository);

  @override
  Future<Either<Failure, ProfileEntity>> call(NoParams params) async {
    Either<Failure, ProfileEntity> data = await profileRepository.getProfile();

    return data.fold((failure) => Left(failure), (value) => Right(value));
  }
}
