import 'package:dartz/dartz.dart';
import 'package:data/core/_core.dart';
import 'package:domain/domain.dart';

class CountryPut extends UseCase<bool, CountryRequestEntity> {
  final CountryRepository countryRepository;

  CountryPut(this.countryRepository);
  
  @override
  Future<Either<Failure, bool>> call(CountryRequestEntity params) async {
    Either<Failure, bool> data = await countryRepository.putCountry(params);

    return data.fold((failure) => Left(failure), (value) => Right(value));
  }
}
