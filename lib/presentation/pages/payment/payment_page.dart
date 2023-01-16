import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const <PageRouteInfo<dynamic>>[
        ReportPaymentRoute(),
        HistoryPaymentRoute(),
        ManagePackagesRoute(),
      ],
      builder: (context, child, _) {
        var tabsRouter = context.tabsRouter;

        return DefaultTabController(
          length: 3,
          initialIndex: tabsRouter.activeIndex,
          child: Scaffold(
            appBar: SidebarBodyApp(
              title: 'Pembayaran',
              tabBar: TabBar(
                onTap: tabsRouter.setActiveIndex,
                isScrollable: true,
                tabs: const <Tab>[
                  Tab(text: 'Ringkasan'),
                  Tab(text: 'Riwayat Pembayaran'),
                  Tab(text: 'Kelola Paket'),
                ],
              ),
              profile: SidebarBodyProfile(
                onTap: () {},
                user: UserProfileModel(
                  name: 'Nanang Prasetya Bekti',
                  image: AppImages.avatarUrl,
                  role: 'Admin',
                  email: 'nanang@mail.com',
                  package: 'FREE',
                  uuid: 'vpUi37K2f7',
                ),
              ),
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
