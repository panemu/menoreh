import 'package:dartz/dartz.dart';
import 'package:data/core/_core.dart';
import 'package:domain/domain.dart';

class CountryGetData extends UseCase<TableDataEntity<CountryEntity>, CountryParamsEntity> {
  final CountryRepository countryRepository;

  CountryGetData(this.countryRepository);
  
  @override
  Future<Either<Failure, TableDataEntity<CountryEntity>>> call(CountryParamsEntity params) async {
    Either<Failure, TableDataEntity<CountryEntity>> data = await countryRepository.getCountry(params);

    return data.fold((failure) => Left(failure), (value) => Right(value));
  }
}
