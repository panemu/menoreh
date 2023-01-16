import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class SidebarBodyApp extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  /// if you use tabBar please wrap [SidaberBodyApp] with [DefaultTabController] on top widget
  final Widget? tabBar;
  final SidebarBodyProfile? profile;
  final List<Widget>? action;
  final double? height;

  const SidebarBodyApp({
    super.key,
    required this.title,
    this.height,
    this.action,
    this.profile,
    this.tabBar,
  });

  @override
  Widget build(BuildContext context) {
    Widget titleWidget = Text(
      title,
      style: context.isSmallTablet
          ? AppTextStyle.appBarTitle
          : AppTextStyle.appBarTitle.copyWith(fontSize: AppDimens.size4M),
    );

    Widget desktop = Row(
      children: [
        titleWidget,
        if (tabBar != null) SizedBox(width: AppDimens.size3M),
        if (tabBar != null) tabBar!,
      ],
    );

    Widget mobile = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [titleWidget, if (tabBar != null) tabBar!],
    );

    return Container(
      height: preferredSize.height,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.dividerLight),
        ),
      ),
      padding: context.isPhone
          ? const EdgeInsets.symmetric(horizontal: AppDimens.paddingMediumX)
          : const EdgeInsets.symmetric(horizontal: AppDimens.paddingLargeX),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          context.responsiveValue<Widget>(
            desktop: desktop,
            tablet: desktop,
            mobile: mobile,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              for (var i = 0; i < action!.length; i++) action![i],
              if (profile != null) SizedBox(width: AppDimens.size3M),
              if (profile != null) profile!,
            ],
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? AppDimens.appBarHeight);
}
