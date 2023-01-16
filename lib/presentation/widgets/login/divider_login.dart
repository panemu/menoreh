import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';

class DividerLogin extends StatelessWidget {
  const DividerLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Divider(color: AppColors.grey.shade400)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingMedium),
          child: Text('ATAU', style: TextStyle(color: AppColors.grey.shade400)),
        ),
        Expanded(child: Divider(color: AppColors.grey.shade400)),
      ],
    );
  }
}
