import 'package:bloc/bloc.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:menoreh_library/core/_core.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final AuthLogout authLogout;

  LogoutCubit(this.authLogout) : super(const LogoutState());

  Future<void> logout() async {
    emit(state.copyWith(status: TypeState.loading));
    final data = await authLogout.call(NoParams());

    data.fold(
      (failure) => emit(state.copyWith(status: TypeState.notLoaded, errorMessage: failure.message)),
      (value) => emit(state.copyWith(status: TypeState.loaded)),
    );
  }
}
