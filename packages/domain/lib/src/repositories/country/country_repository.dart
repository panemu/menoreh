import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:domain/src/_src.dart';

abstract class CountryRepository {
  /// Get data country
  Future<Either<Failure, TableDataEntity<CountryEntity>>> getCountry(CountryParamsEntity params);

  /// Get by id country
  Future<Either<Failure, CountryEntity>> getByIdCountry(int request);

  /// Add data country
  Future<Either<Failure, bool>> postCountry(CountryRequestEntity request);

  /// Edit data country
  Future<Either<Failure, bool>> putCountry(CountryRequestEntity request);

  /// Delete data country
  Future<Either<Failure, bool>> deleteCountry(int request);
}