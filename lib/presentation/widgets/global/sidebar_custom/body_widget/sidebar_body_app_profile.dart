import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class SidebarBodyProfile extends StatelessWidget {
  final VoidCallback onTap;
  final UserProfileModel user;

  const SidebarBodyProfile({
    super.key,
    required this.onTap,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SmartDialog.showAttach(
        targetContext: context,
        usePenetrate: true,
        keepSingle: true,
        alignment: Alignment.bottomRight,
        clickMaskDismiss: true,
        useAnimation: false,
        debounce: true,
        targetBuilder: (targetOffset, targetSize) => Offset(targetOffset.dx - 144, targetOffset.dy - 10),
        builder: (_) => _PopDetailProfile(user: user),
      ),
      focusColor: AppColors.transparant,
      hoverColor: AppColors.transparant,
      splashColor: AppColors.transparant,
      highlightColor: AppColors.transparant,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CacheImageWidget(
            imageUrl: user.image,
            size: Size(AppDimens.sizeXL, AppDimens.sizeXL),
            defaultImage: AppImages.emptyAvatar,
            disbleTap: true,
          ),
          context.responsiveValue(
            desktop: SizedBox(width: AppDimens.size3S),
            mobile: const SizedBox(),
          ),
          Visibility(
            visible: context.responsiveValue<bool>(mobile: false, desktop: true),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: AppDimens.widthAppProfile,
                  child: Text(
                    user.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.titleAppProfile,
                  ),
                ),
                SizedBox(height: AppDimens.size2S),
                ChipWidget(
                  color: AppColors.purple,
                  value: user.role,
                  fontSize: 9.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _PopDetailProfile extends StatelessWidget {
  final UserProfileModel user;

  const _PopDetailProfile({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimens.widthDetailProfile,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimens.radiusLargeX),
        boxShadow: [AppShadows.button],
      ),
      child: Stack(
        children: [
          Positioned(
            right: AppDimens.sizeM,
            top: AppDimens.sizeM,
            child: IconButton(
              onPressed: () {
                SmartDialog.dismiss();
              },
              icon: const Icon(Icons.edit),
              color: AppColors.labelSecondary,
              splashRadius: AppDimens.size2M,
              iconSize: AppDimens.size4M,
              padding: EdgeInsets.all(AppDimens.sizeZero),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppDimens.sizeL, horizontal: AppDimens.size4L),
            child: Column(
              children: [
                CacheImageWidget(
                  imageUrl: AppImages.avatarUrl,
                  size: Size(AppDimens.size2X, AppDimens.size2X),
                  defaultImage: AppImages.emptyAvatar,
                  disbleTap: true,
                ),
                SizedBox(height: AppDimens.size3S),
                Text(
                  user.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.titleAppProfile.copyWith(fontSize: AppDimens.size4M),
                ),
                SizedBox(height: AppDimens.size2S),
                ChipWidget(
                  color: AppColors.purple,
                  value: user.role,
                  fontSize: AppDimens.sizeM,
                ),
                Divider(height: AppDimens.size3L),
                _ListColumn(
                  label: 'Email',
                  value: user.email,
                ),
                SizedBox(height: AppDimens.sizeM),
                _ListColumn(
                  label: 'UUID',
                  value: user.uuid,
                ),
                SizedBox(height: AppDimens.sizeM),
                _ListColumn(
                  label: 'Paket',
                  value: user.package,
                ),
                SizedBox(height: AppDimens.sizeL),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      SmartDialog.dismiss();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.lightRed,
                      foregroundColor: AppColors.red,
                    ),
                    icon: const Icon(Icons.exit_to_app_outlined),
                    label: const Text('Keluar'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ListColumn extends StatelessWidget {
  final String label;
  final String value;

  const _ListColumn({Key? key, required this.label, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(color: AppColors.labelSecondary, fontSize: 13),
          ),
          SizedBox(width: AppDimens.size4S),
          SelectableText(
            value,
            maxLines: 1,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: AppColors.labelPrimary,
              fontSize: AppDimens.size2M,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

///TODO please set to repository entity
class UserProfileModel {
  final String image;
  final String name;
  final String uuid;
  final String role;
  final String email;
  final String package;

  UserProfileModel({
    required this.image,
    required this.name,
    required this.uuid,
    required this.role,
    required this.email,
    required this.package,
  });
}
