import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class SidebarBodyProfile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String role;
  final List<ProfileTile> listContents;
  final void Function() onLogout;

  const SidebarBodyProfile({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.listContents,
    required this.role,
    required this.onLogout,
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
        builder: (_) => _PopDetailProfile(
          imageUrl: imageUrl,
          name: name,
          listContents: listContents,
          role: role,
          onLogout: onLogout,
        ),
      ),
      focusColor: AppColors.transparent,
      hoverColor: AppColors.transparent,
      splashColor: AppColors.transparent,
      highlightColor: AppColors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CacheImageWidget(
            imageUrl: imageUrl,
            size: Size(AppDimens.sizeXL, AppDimens.sizeXL),
            defaultImage: AppImages.emptyAvatar,
          ),
          Visibility(
            visible: context.responsiveValue<bool>(mobile: false, desktop: true),
            child: SizedBox(width: AppDimens.size3S),
          ),
          Visibility(
            visible: context.responsiveValue<bool>(mobile: false, desktop: true),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  constraints: const BoxConstraints(
                    maxWidth: AppDimens.widthAppProfile,
                  ),
                  child: Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.titleAppProfile,
                  ),
                ),
                SizedBox(height: AppDimens.size2S),
                Offstage(
                  offstage: role.isEmpty,
                  child: ChipWidget(
                    color: AppColors.purple,
                    value: role,
                    fontSize: 9.0,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final String label;
  final String value;

  const ProfileTile({Key? key, required this.label, required this.value}) : super(key: key);

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

class SideBodyProfileLoading extends StatelessWidget {
  const SideBodyProfileLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ShimmerCustom(size: Size(AppDimens.sizeXL, AppDimens.sizeXL)),
        Visibility(
          visible: context.responsiveValue<bool>(mobile: false, desktop: true),
          child: SizedBox(width: AppDimens.size3S),
        ),
        Visibility(
          visible: context.responsiveValue<bool>(mobile: false, desktop: true),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShimmerCustom(size: Size(AppDimens.size8X, AppDimens.size3M)),
              SizedBox(height: AppDimens.size2S),
              ShimmerCustom(size: Size(AppDimens.sizeXL, AppDimens.size2M)),
            ],
          ),
        )
      ],
    );
  }
}

class _PopDetailProfile extends StatelessWidget {
  final List<ProfileTile> listContents;
  final String imageUrl;
  final String name;
  final String? role;
  final void Function() onLogout;

  const _PopDetailProfile({
    required this.imageUrl,
    required this.name,
    required this.listContents,
    required this.role,
    required this.onLogout,
  });

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
                ),
                SizedBox(height: AppDimens.size3S),
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.titleAppProfile.copyWith(fontSize: AppDimens.size4M),
                ),
                SizedBox(height: AppDimens.size2S),
                Offstage(
                  offstage: role == null,
                  child: ChipWidget(
                    color: AppColors.purple,
                    value: role ?? '',
                    fontSize: AppDimens.sizeM,
                  ),
                ),
                Divider(height: AppDimens.size3L),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: listContents.length,
                  itemBuilder: (_, index) => ProfileTile(
                    label: listContents[index].label,
                    value: listContents[index].value,
                  ),
                  separatorBuilder: (_, __) => SizedBox(height: AppDimens.sizeM),
                ),
                SizedBox(height: AppDimens.sizeL),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      SmartDialog.dismiss();
                      onLogout.call();
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
