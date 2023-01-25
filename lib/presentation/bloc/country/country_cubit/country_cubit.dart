import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:menoreh_library/core/_core.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  final CountryGetData getCountry;
  CountryCubit(this.getCountry) : super(const CountryState());

  Future<void> getAllData(CountryParamsEntity params) async {
    emit(state.copyWith(status: TypeState.loading));
    Either<Failure, TableDataEntity<CountryEntity>> data = await getCountry.call(params);

    data.fold(
      (failure) => emit(state.copyWith(status: TypeState.notLoaded, errorMessage: failure.message)),
      (value) {
        final lstPo  = <int>[];
        final lstInd = <String>[];
        _calculation(value, lstPo, lstInd);
        
        emit(state.copyWith(
          status: TypeState.loaded,
          countryEntity: value,
          totalCountry: value.totalRows,
          totalPopulation: lstPo.reduce((a, b) => a + b),
          latestIndependence: lstInd.last,
          earliestIndependence: lstInd.first,
        ));
      },
    );
  }

  void _calculation(TableDataEntity<CountryEntity> value, List<int> lstPo, List<String> lstInd) {
    for (var i = 0; i < value.rows.length; i++) {
      lstPo.add(value.rows[i].population);
      lstInd.add(value.rows[i].independence);
    }
    
    lstInd.sort((a,b) => a.compareTo(b));
  }
}
