import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:menoreh_library/core/_core.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthPostLogin postLogin;

  LoginCubit(this.postLogin) : super(const LoginState());

  Future<void> logInWithCredentials(AuthParamsEntity params) async {
    emit(state.copyWith(status: AuthState.loading));

    final data = await postLogin.call(params);

    data.fold(
      (failure) => emit(
        state.copyWith(
          status: AuthState.notLoggedIn,
          errorMessage: failure.message,
        ),
      ),
      (value) => emit(
        state.copyWith(
          status: AuthState.loggedIn,
          userEntity: value,
        ),
      ),
    );
  }
}
