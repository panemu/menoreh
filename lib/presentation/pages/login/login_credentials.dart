import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class LoginCredentials extends StatelessWidget {
  const LoginCredentials({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password || previous.email != current.email,
      builder: (context, state) {
        return Column(
          children: [
            TextFieldEmail(
              onChanged: context.read<LoginCubit>().emailChange,
              title: 'Email',
              hint: 'Masukan email',
              validator: (_) => state.email.error?.name,
            ),
            SizedBox(height: AppDimens.size4M),
            TextFieldPassword(
              onChanged: context.read<LoginCubit>().passwordChange,
              title: 'Password',
              hint: 'Masukan password',
              validator: (_) => state.password.error?.name,
            ),
            SizedBox(height: AppDimens.size4M),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: context.read<LoginCubit>().logInWithCredentials,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.green,
                  foregroundColor: AppColors.white,
                ),
                child: const Text('Masuk'),
              ),
            ),
          ],
        );
      },
    );
  }
}
