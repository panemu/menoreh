import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:menoreh_library/core/_core.dart';

part 'country_by_id_state.dart';

class CountryByIdCubit extends Cubit<CountryByIdState> {
  final CountryGetByIdData getByIdCountry;
  CountryByIdCubit(this.getByIdCountry) : super(const CountryByIdState());

  Future<void> getByIdData(int request) async {
    emit(state.copyWith(status: TypeState.loading));
    Either<Failure, CountryEntity> data = await getByIdCountry.call(request);

    data.fold(
      (failure) => emit(state.copyWith(status: TypeState.notLoaded, errorMessage: failure.message)),
      (value) => emit(state.copyWith(status: TypeState.loaded, countryEntity: value)),
    );
  }
}
