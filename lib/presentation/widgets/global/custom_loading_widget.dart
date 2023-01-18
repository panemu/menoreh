import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRect(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(AppDimens.radiusLarge)),
            color: AppColors.grey.shade800,
          ),
          padding: EdgeInsets.all(AppDimens.sizeXL),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Theme(
                data: ThemeData(
                  primaryColor: AppColors.white,
                  cupertinoOverrideTheme: const CupertinoThemeData(brightness: Brightness.dark),
                ),
                child: const CupertinoActivityIndicator(radius: AppDimens.radiusLarge),
              ),
              SizedBox(height: AppDimens.sizeM),
              Text('Memuat', style: AppTextStyle.titleLoading),
            ],
          ),
        ),
      ),
    );
  }
}
