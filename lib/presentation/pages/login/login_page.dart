import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
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
          if (state.status.isLoading) {
            SmartDialog.showLoading();
          } else if (state.status.isLoggedIn) {
            SmartDialog.dismiss();
            if (onLoginResult != null) {
              onLoginResult!(true);
            } else {
              context.router.pushAndPopUntil(const MainRoute(), predicate: (r) => true);
            }
          } else if (state.status.isNotLoggedIn) {
            SmartDialog.dismiss();
            AppDialog.handleError(context, state.errorMessage!);
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
            desktop: context.width / 3.2,
            tablet: context.width / 5,
            mobile: AppDimens.sizeXL,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            TopLogin(),
            LoginCredentials(),
            VersioningLogin(),
            // SizedBox(height: AppDimens.size2M),
            // const DividerLogin(),
            // SizedBox(height: AppDimens.size2M),
            // const LoginFacebook(),
            // SizedBox(height: AppDimens.sizeM),
            // const LoginGoogle(),
            // SizedBox(height: AppDimens.sizeM),
            // const LoginApple(),
          ],
        ),
      ),
    );
  }
}
