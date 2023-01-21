import 'package:dartz/dartz.dart';
import 'package:data/core/_core.dart';
import 'package:domain/domain.dart';

class CountryGetByIdData extends UseCase<CountryEntity, int> {
  final CountryRepository countryRepository;

  CountryGetByIdData(this.countryRepository);
  
  @override
  Future<Either<Failure, CountryEntity>> call(int params) async {
    Either<Failure, CountryEntity> data = await countryRepository.getByIdCountry(params);

    return data.fold((failure) => Left(failure), (value) => Right(value));
  }
}
