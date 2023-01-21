import 'dart:developer';

import 'package:data/data.dart';
import 'package:domain/domain.dart';

abstract class CountryRemoteDatasource {
  /// Get data country
  Future<TableDataEntity<CountryEntity>> getCountry(CountryParamsEntity params);

  /// Get by id country
  Future<CountryEntity> getByIdCountry(int request);

  /// Add data country
  Future<bool> postCountry(CountryRequestEntity request);

  /// Edit data country
  Future<bool> putCountry(CountryRequestEntity request);

  /// Delete data country
  Future<bool> deleteCountry(int request);
}

class CountryRemoteDatasourceImpl implements CountryRemoteDatasource {
  final BaseApi baseApi;

  CountryRemoteDatasourceImpl(this.baseApi);

  @override
  Future<TableDataEntity<CountryEntity>> getCountry(CountryParamsEntity params) async {
    try {
      final map = await baseApi.post(
        '$COUNTRY?start=${params.start}&max=${params.max}',
        data: params.tableQuery!.toJson(),
      );

      return TableDataEntity.fromMap(map, (data) => data.map((aRow) => CountryModel.fromJson(aRow)).toList());
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      if (e is ServerException) {
        throw ServerException(message: e.message);
      } else {
        throw ServerException(message: EXCEPTION_WRONG);
      }
    }
  }

  @override
  Future<CountryEntity> getByIdCountry(int request) async {
    try {
      final data = await baseApi.get('$COUNTRY/$request');

      return CountryModel.fromJson(data);
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      if (e is ServerException) {
        throw ServerException(message: e.message);
      } else {
        throw ServerException(message: EXCEPTION_WRONG);
      }
    }
  }

  @override
  Future<bool> postCountry(CountryRequestEntity request) async {
    await baseApi.post(COUNTRY, data: request.toJson());
    return true;
  }

  @override
  Future<bool> putCountry(CountryRequestEntity request) async {
    await baseApi.put(COUNTRY, data: request.toJson());
    return true;
  }

  @override
  Future<bool> deleteCountry(int request) async {
    await baseApi.delete('$COUNTRY/$request');
    return true;
  }
}
