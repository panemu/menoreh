import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class SidebarResponsive extends StatefulWidget {
  final Color? backgroundColor;

  /// please use widget [SidebarBody]
  final List<PageRouteInfo<dynamic>> body;
  final List<SidebarDrawerItem> listMenu;

  const SidebarResponsive({
    Key? key,
    required this.body,
    required this.listMenu,
    this.backgroundColor = AppColors.primary,
  }) : super(key: key);

  @override
  State<SidebarResponsive> createState() => _SidebarResponsiveState();
}

class _SidebarResponsiveState extends State<SidebarResponsive> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: widget.body,
      builder: (context, child, animation) {
        var tabsRouter = context.tabsRouter;

        return Material(
          color: widget.backgroundColor,
          child: _Layout(
            isExpanded: _isExpanded,
            body: ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppDimens.sizeL),
                bottomLeft: Radius.circular(AppDimens.sizeL),
              ),
              child: child,
            ),
            drawer: SidebarDrawer(
              listMenu: widget.listMenu,
              onChange: tabsRouter.setActiveIndex,
              indexPage: tabsRouter.activeIndex,
              isExpanded: _isExpanded,
              onExpanded: (bool value) {
                setState(() => _isExpanded = value);
              },
            ),
            type: context.responsiveValue<ResponsiveType>(
              desktop: ResponsiveType.desktop,
              tablet: ResponsiveType.tablet,
              mobile: ResponsiveType.mobile,
            ),
          ),
        );
      },
    );
  }
}

class _Layout extends StatelessWidget {
  final bool isExpanded;
  final Widget body;
  final Widget drawer;
  final ResponsiveType type;

  const _Layout({
    Key? key,
    required this.isExpanded,
    required this.body,
    required this.type,
    required this.drawer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: isExpanded ? AppDimens.maxWidthSide : AppDimens.minWidthSide,
          child: drawer,
        ),
        Expanded(
          flex: 6,
          child: body,
        ),
      ],
    );
  }
}
