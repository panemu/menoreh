import 'package:dartz/dartz.dart';
import 'package:data/core/_core.dart';
import 'package:domain/domain.dart';

class CountryDelete extends UseCase<bool, int> {
  final CountryRepository countryRepository;

  CountryDelete(this.countryRepository);
  
  @override
  Future<Either<Failure, bool>> call(int params) async {
    Either<Failure, bool> data = await countryRepository.deleteCountry(params);

    return data.fold((failure) => Left(failure), (value) => Right(value));
  }
}
