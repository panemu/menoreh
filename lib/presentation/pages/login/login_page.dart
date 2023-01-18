import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/injections.dart';
import 'package:menoreh_library/presentation/_presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  final Function(bool? value)? onLoginResult;
  const LoginPage({Key? key, this.onLoginResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginCubit>(),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.status == FormzStatus.submissionSuccess) {
            onLoginResult!(true);
          } 
          if(state.status == FormzStatus.submissionFailure){
            AppDialog.confirm(context: context, title: "Error", description: state.errorMessage);
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.primary,
          body: Stack(
            children: const [
              // BgLeftLogin(),
              // BgRightLogin(),
              Align(
                alignment: Alignment.center,
                child: _ContentBuilder(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContentBuilder extends StatelessWidget {
  const _ContentBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.responsiveValue(
            desktop: context.width / 3,
            tablet: context.width / 5,
            mobile: AppDimens.sizeXL,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            TitleLogin(),
            LoginCredentials(),
            // SizedBox(height: AppDimens.size2M),
            // const DividerLogin(),
            // SizedBox(height: AppDimens.size2M),
            // const LoginFacebook(),
            // SizedBox(height: AppDimens.sizeM),
            // const LoginGoogle(),
            // SizedBox(height: AppDimens.sizeM),
            // const LoginApple(),
            // const VersioningLogin(),
          ],
        ),
      ),
    );
  }
}
