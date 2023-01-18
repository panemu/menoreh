import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:form_inputs/form_inputs.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthPostLogin postLogin;

  LoginCubit(this.postLogin) : super(const LoginState());

  void emailChange(String value) {
    final email = Email.dirty(value);

    emit(state.copyWith(
      email: email,
      status: Formz.validate([email, state.password]),
    ));
  }

  void passwordChange(String value) {
    final password = Password.dirty(value);

    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.email, password]),
    ));
  }

  Future<void> logInWithCredentials(AuthParamsEntity params) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    final data = await postLogin.call(params);

    data.fold(
      (failure) => emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          errorMessage: failure.message,
        ),
      ),
      (value) => emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          userEntity: value,
        ),
      ),
    );
  }
}
