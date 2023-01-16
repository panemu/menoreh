import 'package:dartz/dartz.dart';
import 'package:data/core/_core.dart';
import 'package:domain/domain.dart';

abstract class ProfileRepository {
  /// get data profile 
  Future<Either<Failure, ProfileEntity>> getProfile();

  /// setup profile 
  Future<Either<Failure, ProfileEntity>> postProfile(ProfileParamsEntity params);

  /// update profile 
  Future<Either<Failure, ProfileEntity>> updateProfile(ProfileParamsEntity params);
}