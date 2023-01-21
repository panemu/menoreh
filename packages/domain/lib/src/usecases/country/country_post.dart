import 'package:dartz/dartz.dart';
import 'package:data/core/_core.dart';
import 'package:domain/domain.dart';

class CountryPost extends UseCase<bool, CountryRequestEntity> {
  final CountryRepository countryRepository;

  CountryPost(this.countryRepository);
  
  @override
  Future<Either<Failure, bool>> call(CountryRequestEntity params) async {
    Either<Failure, bool> data = await countryRepository.postCountry(params);

    return data.fold((failure) => Left(failure), (value) => Right(value));
  }
}
