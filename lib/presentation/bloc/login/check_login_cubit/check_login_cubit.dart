import 'package:bloc/bloc.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:menoreh_library/core/_core.dart';

part 'check_login_state.dart';

class CheckLoginCubit extends Cubit<CheckLoginState> {
  final AuthCheck _authCheck;

  CheckLoginCubit(this._authCheck) : super(const CheckLoginState());

  Future<void> checkLogin() async {
    final data = await _authCheck.call(NoParams());

    data.fold(
      (failure) => emit(state.copyWith(status: TypeState.notLoaded, value: false, message: failure.message)),
      (value) => emit(state.copyWith(status: TypeState.loaded, value: value)),
    );
  }
}
