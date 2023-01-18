import 'package:data/core/config/flavor.dart';
import 'package:flutter/material.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/injections.dart';
import 'package:menoreh_library/presentation/_presentation.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:menoreh_library/presentation/routers/auth_guard.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter(auth: sl<AuthGuard>());

    return MaterialApp.router(
      title: sl<FlavorConfig>().values!.appName!,
      themeMode: ThemeMode.system,
      theme: AppTheme.light(),
      routeInformationParser: appRouter.defaultRouteParser(),
      routeInformationProvider: appRouter.routeInfoProvider(),
      routerDelegate: appRouter.delegate(
        navigatorObservers: () => [FlutterSmartDialog.observer],
      ),
      supportedLocales: const [Locale('id'), Locale('en')],
      locale: const Locale('id'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        SfGlobalLocalizations.delegate,
      ],
      builder: FlutterSmartDialog.init(
        loadingBuilder: (String value) => const CustomLoadingWidget(),
        builder: (_, widget) => ResponsiveWrapper.builder(
          widget,
          defaultScale: true,
          background: Container(color: AppColors.bgPrimary),
          breakpoints: const [
            ResponsiveBreakpoint.resize(450, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
        ),
      ),
    );
  }
}
