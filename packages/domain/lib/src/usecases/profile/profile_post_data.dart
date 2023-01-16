import 'package:dartz/dartz.dart';
import 'package:data/core/_core.dart';
import 'package:domain/domain.dart';

class ProfilePostData extends UseCase<ProfileEntity, ProfileParamsEntity> {
  final ProfileRepository profileRepository;

  ProfilePostData(this.profileRepository);

  @override
  Future<Either<Failure, ProfileEntity>> call(ProfileParamsEntity params) async {
    Either<Failure, ProfileEntity> data = await profileRepository.postProfile(params);

    return data.fold((failure) => Left(failure), (value) => Right(value));
  }
}