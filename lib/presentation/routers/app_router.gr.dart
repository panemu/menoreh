// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter({
    GlobalKey<NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final AuthGuard authGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
        transitionsBuilder: TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return CustomPage<dynamic>(
        routeData: routeData,
        child: LoginPage(
          key: args.key,
          onLoginResult: args.onLoginResult,
        ),
        transitionsBuilder: TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CardRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const CardPage(),
        transitionsBuilder: TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    UsersRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const UsersPage(),
        transitionsBuilder: TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PaymentRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const PaymentPage(),
        transitionsBuilder: TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ListCardRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const ListCardTab(),
        transitionsBuilder: TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CategoryCardRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const CategoryCardTab(),
        transitionsBuilder: TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    TypeCardRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const TypeCardTab(),
        transitionsBuilder: TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ListUsersRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const ListUsersTab(),
        transitionsBuilder: TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LogUsersRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const LogUsersTab(),
        transitionsBuilder: TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    RoleUsersRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const RoleUsersTab(),
        transitionsBuilder: TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ReportPaymentRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const ReportPaymentTab(),
        transitionsBuilder: TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HistoryPaymentRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const HistoryPaymentTab(),
        transitionsBuilder: TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ManagePackagesRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const ManagePackagesTab(),
        transitionsBuilder: TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          MainRoute.name,
          path: '/',
          guards: [authGuard],
          children: [
            RouteConfig(
              CardRoute.name,
              path: 'card',
              parent: MainRoute.name,
              children: [
                RouteConfig(
                  '#redirect',
                  path: '',
                  parent: CardRoute.name,
                  redirectTo: 'list_card',
                  fullMatch: true,
                ),
                RouteConfig(
                  ListCardRoute.name,
                  path: 'list_card',
                  parent: CardRoute.name,
                ),
                RouteConfig(
                  CategoryCardRoute.name,
                  path: 'category_card',
                  parent: CardRoute.name,
                ),
                RouteConfig(
                  TypeCardRoute.name,
                  path: 'type_card',
                  parent: CardRoute.name,
                ),
              ],
            ),
            RouteConfig(
              UsersRoute.name,
              path: 'users',
              parent: MainRoute.name,
              children: [
                RouteConfig(
                  ListUsersRoute.name,
                  path: 'list_user',
                  parent: UsersRoute.name,
                ),
                RouteConfig(
                  LogUsersRoute.name,
                  path: 'log_user',
                  parent: UsersRoute.name,
                ),
                RouteConfig(
                  RoleUsersRoute.name,
                  path: 'role_user',
                  parent: UsersRoute.name,
                ),
              ],
            ),
            RouteConfig(
              PaymentRoute.name,
              path: 'payment',
              parent: MainRoute.name,
              children: [
                RouteConfig(
                  ReportPaymentRoute.name,
                  path: 'report_payment',
                  parent: PaymentRoute.name,
                ),
                RouteConfig(
                  HistoryPaymentRoute.name,
                  path: 'history_payment',
                  parent: PaymentRoute.name,
                ),
                RouteConfig(
                  ManagePackagesRoute.name,
                  path: 'manage_packages',
                  parent: PaymentRoute.name,
                ),
              ],
            ),
          ],
        ),
        RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
      ];
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    dynamic Function(bool?)? onLoginResult,
  }) : super(
          LoginRoute.name,
          path: '/login',
          args: LoginRouteArgs(
            key: key,
            onLoginResult: onLoginResult,
          ),
        );

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    this.onLoginResult,
  });

  final Key? key;

  final dynamic Function(bool?)? onLoginResult;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onLoginResult: $onLoginResult}';
  }
}

/// generated route for
/// [CardPage]
class CardRoute extends PageRouteInfo<void> {
  const CardRoute({List<PageRouteInfo>? children})
      : super(
          CardRoute.name,
          path: 'card',
          initialChildren: children,
        );

  static const String name = 'CardRoute';
}

/// generated route for
/// [UsersPage]
class UsersRoute extends PageRouteInfo<void> {
  const UsersRoute({List<PageRouteInfo>? children})
      : super(
          UsersRoute.name,
          path: 'users',
          initialChildren: children,
        );

  static const String name = 'UsersRoute';
}

/// generated route for
/// [PaymentPage]
class PaymentRoute extends PageRouteInfo<void> {
  const PaymentRoute({List<PageRouteInfo>? children})
      : super(
          PaymentRoute.name,
          path: 'payment',
          initialChildren: children,
        );

  static const String name = 'PaymentRoute';
}

/// generated route for
/// [ListCardTab]
class ListCardRoute extends PageRouteInfo<void> {
  const ListCardRoute()
      : super(
          ListCardRoute.name,
          path: 'list_card',
        );

  static const String name = 'ListCardRoute';
}

/// generated route for
/// [CategoryCardTab]
class CategoryCardRoute extends PageRouteInfo<void> {
  const CategoryCardRoute()
      : super(
          CategoryCardRoute.name,
          path: 'category_card',
        );

  static const String name = 'CategoryCardRoute';
}

/// generated route for
/// [TypeCardTab]
class TypeCardRoute extends PageRouteInfo<void> {
  const TypeCardRoute()
      : super(
          TypeCardRoute.name,
          path: 'type_card',
        );

  static const String name = 'TypeCardRoute';
}

/// generated route for
/// [ListUsersTab]
class ListUsersRoute extends PageRouteInfo<void> {
  const ListUsersRoute()
      : super(
          ListUsersRoute.name,
          path: 'list_user',
        );

  static const String name = 'ListUsersRoute';
}

/// generated route for
/// [LogUsersTab]
class LogUsersRoute extends PageRouteInfo<void> {
  const LogUsersRoute()
      : super(
          LogUsersRoute.name,
          path: 'log_user',
        );

  static const String name = 'LogUsersRoute';
}

/// generated route for
/// [RoleUsersTab]
class RoleUsersRoute extends PageRouteInfo<void> {
  const RoleUsersRoute()
      : super(
          RoleUsersRoute.name,
          path: 'role_user',
        );

  static const String name = 'RoleUsersRoute';
}

/// generated route for
/// [ReportPaymentTab]
class ReportPaymentRoute extends PageRouteInfo<void> {
  const ReportPaymentRoute()
      : super(
          ReportPaymentRoute.name,
          path: 'report_payment',
        );

  static const String name = 'ReportPaymentRoute';
}

/// generated route for
/// [HistoryPaymentTab]
class HistoryPaymentRoute extends PageRouteInfo<void> {
  const HistoryPaymentRoute()
      : super(
          HistoryPaymentRoute.name,
          path: 'history_payment',
        );

  static const String name = 'HistoryPaymentRoute';
}

/// generated route for
/// [ManagePackagesTab]
class ManagePackagesRoute extends PageRouteInfo<void> {
  const ManagePackagesRoute()
      : super(
          ManagePackagesRoute.name,
          path: 'manage_packages',
        );

  static const String name = 'ManagePackagesRoute';
}
