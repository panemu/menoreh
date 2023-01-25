import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

class CountryRepositoryImpl extends CountryRepository {
  final CountryRemoteDatasource remoteDatasource;

  CountryRepositoryImpl(this.remoteDatasource);

  @override
  Future<Either<Failure, TableDataEntity<CountryEntity>>> getCountry(CountryParamsEntity params) async {
    try {
      TableDataEntity<CountryEntity> data = await remoteDatasource.getCountry(params);

      if (data.totalRows == 0) return Left(NotFoundFailure());

      return Right(data);
    } catch (e) {
      if (e is ServerException) {
        return Left(ServerFailure(message: e.message));
      } else {
        return Left(ServerFailure(message: FAILURE_UNKNOWN));
      }
    }
  }

  @override
  Future<Either<Failure, CountryEntity>> getByIdCountry(int request) async {
    try {
      CountryEntity data = await remoteDatasource.getByIdCountry(request);

      return Right(data);
    } catch (e) {
      if (e is ServerException) {
        return Left(ServerFailure(message: e.message));
      } else {
        return Left(ServerFailure(message: FAILURE_UNKNOWN));
      }
    }
  }

  @override
  Future<Either<Failure, bool>> postCountry(CountryRequestEntity request) async {
    try {
      bool data = await remoteDatasource.postCountry(request);

      return Right(data);
    } catch (e) {
      if (e is ServerException) {
        return Left(ServerFailure(message: e.message));
      } else {
        return Left(ServerFailure(message: FAILURE_UNKNOWN));
      }
    }
  }

  @override
  Future<Either<Failure, bool>> putCountry(CountryRequestEntity request) async {
    try {
      bool data = await remoteDatasource.putCountry(request);

      return Right(data);
    } catch (e) {
      if (e is ServerException) {
        return Left(ServerFailure(message: e.message));
      } else {
        return Left(ServerFailure(message: FAILURE_UNKNOWN));
      }
    }
  }

  @override
  Future<Either<Failure, bool>> deleteCountry(int request) async {
    try {
      bool data = await remoteDatasource.deleteCountry(request);

      return Right(data);
    } catch (e) {
      if (e is ServerException) {
        return Left(ServerFailure(message: e.message));
      } else {
        return Left(ServerFailure(message: FAILURE_UNKNOWN));
      }
    }
  }
}
