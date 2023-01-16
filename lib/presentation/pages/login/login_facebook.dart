import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';

class LoginFacebook extends StatelessWidget {
  const LoginFacebook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.facebook,
          foregroundColor: AppColors.white,
        ),
        icon: const Icon(Icons.facebook_outlined),
        label: const Text('Masuk dengan Facebook'),
      ),
    );
  }
}
