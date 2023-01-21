import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:menoreh_library/core/_core.dart';

part 'country_delete_state.dart';

class CountryDeleteCubit extends Cubit<CountryDeleteState> {
  final CountryDelete deleteCountry;
  CountryDeleteCubit(this.deleteCountry) : super(const CountryDeleteState());

  Future<void> deleteData(int request) async {
    emit(state.copyWith(status: TypeState.loading));
    Either<Failure, bool> data = await deleteCountry.call(request);

    data.fold(
      (failure) => emit(state.copyWith(status: TypeState.notLoaded, errorMessage: failure.message)),
      (value) => emit(state.copyWith(status: TypeState.loaded, value: value)),
    );
  }
}
