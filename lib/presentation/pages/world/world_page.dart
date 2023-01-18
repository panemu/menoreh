import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class WorldPage extends StatelessWidget {
  const WorldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const <PageRouteInfo<dynamic>>[
        CountryRoute(),
        CityRoute(),
      ],
      builder: (context, child, _) {
        late TabsRouter tabsRouter = context.tabsRouter;

        return DefaultTabController(
          length: 2,
          initialIndex: tabsRouter.activeIndex,
          child: Scaffold(
            appBar: SidebarBodyApp(
              title: 'World',
              tabBar: TabBar(
                onTap: tabsRouter.setActiveIndex,
                isScrollable: true,
                tabs: const <Tab>[
                  Tab(text: 'Country'),
                  Tab(text: 'City'),
                ],
              ),
              profile: const ProfilePage(),
              action: [
                ElevatedButtonIcon(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_none_rounded, color: AppColors.labelPrimary),
                  backgroundColor: AppColors.grey.shade50,
                ),
              ],
              height: context.responsiveValue<double>(
                desktop: AppDimens.appBarHeight,
                tablet: AppDimens.appBarHeight,
                mobile: AppDimens.appBarHeightM,
              ),
            ),
            body: child,
          ),
        );
      },
    );
  }
}
