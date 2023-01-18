import 'package:auto_route/auto_route.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/injections.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class SidebarDrawer extends StatelessWidget {
  final List<SidebarDrawerItem> listMenu;
  final bool isExpanded;
  final int indexPage;
  final Function(int index) onChange;
  final Function(bool value) onExpanded;

  const SidebarDrawer({
    super.key,
    required this.listMenu,
    required this.indexPage,
    required this.isExpanded,
    required this.onChange,
    required this.onExpanded,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: isExpanded ? MainAxisAlignment.start : MainAxisAlignment.center,
      children: [
        _Company(isExpanded: isExpanded),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: listMenu.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SidebarDrawerItem(
                      onPressed: () => onChange.call(index),
                      title: listMenu[index].title,
                      icon: listMenu[index].icon,
                      isActive: indexPage == index,
                      isExpanded: isExpanded,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) => SizedBox(height: AppDimens.size4S),
                ),
              ),
              _TileCollapse(
                isExpanded: isExpanded,
                onExpanded: () => onExpanded.call(!isExpanded),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TileCollapse extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback? onExpanded;

  const _TileCollapse({
    Key? key,
    required this.isExpanded,
    this.onExpanded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: isExpanded ? '' : 'Lebarkan menu',
      child: ListTileTheme(
        iconColor: AppColors.white,
        child: ListTile(
          onTap: onExpanded,
          horizontalTitleGap: 0.0,
          textColor: AppColors.white,
          title: Row(
            children: [
              Icon(isExpanded ? Icons.arrow_back_ios_new_outlined : Icons.arrow_forward_ios_outlined),
              Visibility(visible: isExpanded, child: const SizedBox(width: AppDimens.radiusLarge)),
              Visibility(visible: isExpanded, child: const Text('Ciutkan menu')),
            ],
          ),
        ),
      ),
    );
  }
}

class _Company extends StatelessWidget {
  final bool isExpanded;

  const _Company({required this.isExpanded});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isExpanded
          ? const EdgeInsets.symmetric(horizontal: AppDimens.paddingMediumX)
          : const EdgeInsets.symmetric(horizontal: AppDimens.paddingSmallX),
      height: AppDimens.appBarHeight,
      child: InkWell(
        onTap: () => context.router.pushAndPopUntil(const MainRoute(), predicate: (r) => true),
        focusColor: AppColors.transparent,
        hoverColor: AppColors.transparent,
        splashColor: AppColors.transparent,
        highlightColor: AppColors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              AppImages.logoSvg,
              width: AppDimens.sizeXL,
              height: AppDimens.sizeXL,
            ),
            Visibility(
              visible: isExpanded,
              child: const SizedBox(width: AppDimens.paddingMediumX),
            ),
            Visibility(
              visible: isExpanded,
              child: Text(
                sl<FlavorConfig>().values!.appName!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.titleDrawer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
