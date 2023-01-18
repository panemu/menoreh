import 'package:bloc/bloc.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:menoreh_library/core/_core.dart';

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  final AuthGetUser getUser;
  UserInfoCubit(this.getUser) : super(const UserInfoState());

  Future<void> getData() async {
    emit(state.copyWith(status: TypeState.loading));
    final data = await getUser.call(NoParams());

    data.fold(
      (failure) => emit(state.copyWith(status: TypeState.notLoaded, errorMessage: failure.message)),
      (value) => emit(state.copyWith(status: TypeState.loaded, userEntity: value)),
    );
  }
}
