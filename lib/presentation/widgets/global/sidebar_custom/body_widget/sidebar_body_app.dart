import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:menoreh_library/core/_core.dart';

class SidebarBodyApp extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  /// if you use tabBar please wrap [SidaberBodyApp] with [DefaultTabController] on top widget
  final Widget? tabBar;
  final Widget? profile;
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
    return SizedBox(
      height: preferredSize.height,
      child: _Layout(
        title: Text(title, style: AppTextStyle.appBarTitle),
        action: action,
        profile: profile,
        tabBar: tabBar,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? AppDimens.appBarHeight);
}

class _Layout extends StatelessWidget {
  final Widget title;
  final Widget? tabBar;
  final Widget? profile;
  final List<Widget>? action;

  const _Layout({
    Key? key,
    required this.tabBar,
    required this.profile,
    required this.action,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.responsiveValue<Widget>(
      tablet: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingLargeX),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.dividerLight)),
        ),
        alignment: (tabBar != null) ? Alignment.bottomLeft : Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                title,
                if (tabBar != null) SizedBox(width: AppDimens.size3M),
                if (tabBar != null) tabBar!,
              ],
            ),
            _ActionLayout(action: action!, profile: profile!),
          ],
        ),
      ),
      mobile: Container(
        color: AppColors.white,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(top: kIsWeb ? 0 : context.topSafeArea),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: AppDimens.paddingMediumX,
                right: AppDimens.paddingMediumX,
                top: (tabBar != null) ? AppDimens.paddingSmallX : AppDimens.sizeZero,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppImages.logoSvg,
                        width: AppDimens.size4L,
                        height: AppDimens.size4L,
                      ),
                      SizedBox(width: AppDimens.size3M),
                      title,
                    ],
                  ),
                  _ActionLayout(action: action!, profile: profile!),
                ],
              ),
            ),
            if (tabBar != null)
              Theme(
                data: ThemeData(
                  tabBarTheme: const TabBarTheme(
                    indicatorSize: TabBarIndicatorSize.tab,
                    unselectedLabelColor: AppColors.labelPrimary,
                    labelColor: AppColors.secondary,
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                        width: 2.0,
                        color: AppColors.secondary,
                      ),
                    ),
                  ),
                ),
                child: tabBar!,
              ),
          ],
        ),
      ),
    );
  }
}

class _ActionLayout extends StatelessWidget {
  final List<Widget>? action;
  final Widget? profile;

  const _ActionLayout({
    Key? key,
    required this.action,
    required this.profile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        for (var i = 0; i < action!.length; i++) action![i],
        SizedBox(width: AppDimens.size3M),
        profile!,
      ],
    );
  }
}
