import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';

class SidebarDrawerItem extends StatelessWidget {
  final String title;
  final Widget icon;
  final VoidCallback? onPressed;
  final bool? isActive;
  final bool? isExpanded;

  const SidebarDrawerItem({
    super.key,
    required this.title,
    required this.icon,
    this.onPressed,
    this.isActive,
    this.isExpanded,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isExpanded!
          ? const EdgeInsets.symmetric(horizontal: AppDimens.paddingMediumX)
          : const EdgeInsets.symmetric(horizontal: AppDimens.paddingSmallX),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimens.radiusMediumX)),
        contentPadding: isExpanded!
            ? const EdgeInsets.symmetric(horizontal: AppDimens.paddingMediumX)
            : EdgeInsets.symmetric(horizontal: AppDimens.paddingSmallX, vertical: AppDimens.sizeZero),
        onTap: onPressed,
        horizontalTitleGap: 0.0,
        selected: isActive!,
        iconColor: AppColors.bgSecondary,
        textColor: AppColors.bgSecondary,
        selectedTileColor: AppColors.listMenu,
        focusColor: AppColors.transparent,
        selectedColor: AppColors.white,
        dense: !isExpanded!,
        title: Row(
          children: [
            icon,
            (isExpanded!) ? const SizedBox(width: AppDimens.radiusLarge) : const SizedBox(),
            (isExpanded!) ? Text(title) : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
