import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:menoreh_library/core/_core.dart';

class VersioningLogin extends StatelessWidget {
  const VersioningLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (_, AsyncSnapshot<PackageInfo> snapshot) {
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.only(top: AppDimens.paddingLarge),
            child: Text(
              'v${snapshot.data!.version}.beta',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.grey.shade100),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
