import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:menoreh_library/core/_core.dart';

part 'country_post_state.dart';

class CountryPostCubit extends Cubit<CountryPostState> {
  final CountryPost postCountry;
  CountryPostCubit(this.postCountry) : super(const CountryPostState());

  Future<void> postData(CountryRequestEntity request) async {
    emit(state.copyWith(status: TypeState.loading));
    Either<Failure, bool> data = await postCountry.call(request);

    data.fold(
      (failure) => emit(state.copyWith(status: TypeState.notLoaded, errorMessage: failure.message)),
      (value) => emit(state.copyWith(status: TypeState.loaded, value: value)),
    );
  }
}
