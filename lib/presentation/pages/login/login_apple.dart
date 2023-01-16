import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';

class LoginApple extends StatelessWidget {
  const LoginApple({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.apple,
        ),
        icon: const Icon(Icons.apple_outlined),
        label: const Text('Masuk dengan Apple'),
      ),
    );
  }
}
