import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:menoreh_library/core/_core.dart';

part 'country_put_state.dart';

class CountryPutCubit extends Cubit<CountryPutState> {
  final CountryPut putCountry;
  CountryPutCubit(this.putCountry) : super(const CountryPutState());

  Future<void> putData(CountryRequestEntity request) async {
    emit(state.copyWith(status: TypeState.loading));
    Either<Failure, bool> data = await putCountry.call(request);

    data.fold(
      (failure) => emit(state.copyWith(status: TypeState.notLoaded, errorMessage: failure.message)),
      (value) => emit(state.copyWith(status: TypeState.loaded, value: value)),
    );
  }
}
