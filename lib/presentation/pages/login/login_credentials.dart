import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class LoginCredentials extends StatelessWidget {
  const LoginCredentials({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    late TextEditingController username = TextEditingController();
    late TextEditingController password = TextEditingController();

    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFieldEmail(
            controller: username,
            title: 'Username',
            hint: 'Masukan username',
            // validator: (_) => state.email.error?.name,
          ),
          SizedBox(height: AppDimens.size4M),
          TextFieldPassword(
            controller: password,
            title: 'Password',
            hint: 'Masukan password',
            // validator: (_) => state.password.error?.name,
          ),
          SizedBox(height: AppDimens.size4M),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  context.read<LoginCubit>().logInWithCredentials(AuthParamsEntity(username: username.text, password: password.text));
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.green,
                foregroundColor: AppColors.white,
              ),
              child: const Text('Masuk'),
            ),
          ),
        ],
      ),
    );
  }
}
