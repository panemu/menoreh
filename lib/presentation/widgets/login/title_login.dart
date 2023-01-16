import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/injections.dart';

class TitleLogin extends StatelessWidget {
  const TitleLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppImages.logoSvg,
          width: AppDimens.imageAvatarMobile.width,
          height: AppDimens.imageAvatarMobile.height,
        ),
        SizedBox(height: AppDimens.size4M),
        Text('Masuk ke ${sl<FlavorConfig>().values!.appName}', textAlign: TextAlign.center, style: AppTextStyle.titleLoginPage),
        SizedBox(height: AppDimens.size3S),
        Text(
          'Untuk masuk ke ${sl<FlavorConfig>().values!.appName} silahkan isi Email dan Password dibawah ini.',
          textAlign: TextAlign.center,
          style: AppTextStyle.dialogDesc.copyWith(color: AppColors.grey.shade300, fontSize: AppDimens.size2M),
        ),
        SizedBox(height: AppDimens.size2L),
      ],
    );
  }
}
