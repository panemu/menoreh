import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:menoreh_library/core/_core.dart';

class BgRightLogin extends StatelessWidget {
  const BgRightLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Offstage(
        offstage: context.isPhone,
        child: SvgPicture.asset(
          AppImages.bgRightSvg,
          width: context.responsiveValue(
            desktop: AppDimens.size8X * 2.5,
            tablet: AppDimens.size7X * 2,
            mobile: AppDimens.size2X * 2,
          ),
        ),
      ),
    );
  }
}
