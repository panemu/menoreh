import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/injections.dart';

class TopLogin extends StatelessWidget {
  const TopLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppImages.logoSvg,
          width: AppDimens.imageAvatar.width,
          height: AppDimens.imageAvatar.height,
        ),
        SizedBox(height: AppDimens.size3M),
        Text('Masuk ke ${sl<FlavorConfig>().values!.appName}',
            textAlign: TextAlign.center, style: AppTextStyle.titleLoginPage),
        SizedBox(height: AppDimens.size3S),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: AppTextStyle.dialogDesc.copyWith(color: AppColors.grey.shade300, fontSize: AppDimens.size2M),
            text: 'Untuk masuk ke ${sl<FlavorConfig>().values!.appName} silahkan isi Email dan Password dibawah ini.',
            children: [
              const TextSpan(text: '\n*', style: TextStyle(color: AppColors.red)),
              TextSpan(text: 'username & password: hellocountry', style: TextStyle(color: AppColors.grey.shade100)),
            ],
          ),
        ),
        SizedBox(height: AppDimens.size2L),
      ],
    );
  }
}
