import 'package:auto_route/auto_route.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/presentation/_presentation.dart';
import 'package:flutter/material.dart';
import 'package:menoreh_library/presentation/routers/auth_guard.dart';

part 'app_router.gr.dart';

@CustomAutoRouter(
  replaceInRouteName: 'Page,Route,Tab',
  transitionsBuilder: TransitionsBuilders.noTransition,
  routes: [
    AutoRoute(
      path: mainPath,
      page: MainPage,
      // guards: [AuthGuard],
      name: 'MainRoute',
      children: [
        AutoRoute(
          path: cardPath,
          page: CardPage,
          name: 'CardRoute',
          children: [
            AutoRoute(
              path: listCardPath,
              name: 'ListCardRoute',
              page: ListCardTab,
              initial: true,
            ),
            AutoRoute(
              path: categoryCardPath,
              name: 'CategoryCardRoute',
              page: CategoryCardTab,
            ),
            AutoRoute(
              path: typeCardPath,
              name: 'TypeCardRoute',
              page: TypeCardTab,
            ),
          ],
        ),
        AutoRoute(
          path: usersPath,
          name: 'UsersRoute',
          page: UsersPage,
          children: [
            AutoRoute(
              path: listUsersPath,
              name: 'ListUsersRoute',
              page: ListUsersTab,
            ),
            AutoRoute(
              path: logUsersPath,
              name: 'LogUsersRoute',
              page: LogUsersTab,
            ),
            AutoRoute(
              path: roleUsersPath,
              name: 'RoleUsersRoute',
              page: RoleUsersTab,
            ),
          ],
        ),
        AutoRoute(
          path: paymentPath,
          name: 'PaymentRoute',
          page: PaymentPage,
          children: [
            AutoRoute(
              path: reportPaymentPath,
              name: 'ReportPaymentRoute',
              page: ReportPaymentTab,
            ),
            AutoRoute(
              path: historyPaymentPath,
              name: 'HistoryPaymentRoute',
              page: HistoryPaymentTab,
            ),
            AutoRoute(
              path: packagesPath,
              name: 'ManagePackagesRoute',
              page: ManagePackagesTab,
            ),
          ],
        ),
      ],
    ),
    AutoRoute(path: loginPath, name: 'LoginRoute', page: LoginPage),   
  ],
)
class AppRouter extends _$AppRouter {
  // final AuthGuard auth;

  // AppRouter({required this.auth}) : super(authGuard: auth);
}
