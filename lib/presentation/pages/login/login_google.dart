import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:menoreh_library/core/_core.dart';

class LoginGoogle extends StatelessWidget {
  const LoginGoogle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.google,
          foregroundColor: AppColors.white,
        ),
        icon: SvgPicture.asset(AppImages.googleIcon, width: AppDimens.size4M, height: AppDimens.size4M),
        label: const Text('Masuk dengan Google'),
      ),
    );
  }
}
