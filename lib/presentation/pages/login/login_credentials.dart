import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class LoginCredentials extends StatelessWidget {
  const LoginCredentials({super.key});

  @override
  Widget build(BuildContext context) {
    late GlobalKey<FormState> formKey = GlobalKey<FormState>();
    late FocusNode fnPassword = FocusNode();
    late FocusNode fnUsername = FocusNode();
    late TextEditingController username = TextEditingController();
    late TextEditingController password = TextEditingController();

    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFieldUsername(
            controller: username,
            focusNode: fnUsername,
            title: 'Username',
            hint: 'Enter username',
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Userneme is Empty';
              }
              return null;
            },
          ),
          SizedBox(height: AppDimens.size4M),
          TextFieldPassword(
            controller: password,
            focusNode: fnPassword,
            title: 'Password',
            hint: 'Enter password',
            onSubmitted: (_) {
              fnUsername.unfocus();
              fnPassword.unfocus();
            },
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Password is Empty';
              }
              return null;
            },
          ),
          SizedBox(height: AppDimens.sizeL),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (_, state) {
              return SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      if (!state.status.isLoading) {
                        context.read<LoginCubit>().logInWithCredentials(AuthParamsEntity(
                              username: username.text,
                              password: password.text,
                            ));

                        fnUsername.unfocus();
                        fnPassword.unfocus();
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.green,
                    foregroundColor: AppColors.white,
                  ),
                  child: (state.status.isLoading)
                      ? Center(
                          child: SpinKitCircle(
                            size: AppDimens.sizeL,
                            color: AppColors.white,
                          ),
                        )
                      : const Text('Masuk'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
