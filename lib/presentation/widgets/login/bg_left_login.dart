import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:menoreh_library/core/_core.dart';

class BgLeftLogin extends StatelessWidget {
  const BgLeftLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Offstage(
        offstage: context.isPhone,
        child: SvgPicture.asset(
          AppImages.bgLeftSvg,
          width: context.responsiveValue(
            desktop: AppDimens.size8X * 2.5,
            tablet: AppDimens.size6X * 2,
            mobile: AppDimens.size2X * 2,
          ),
        ),
      ),
    );
  }
}
