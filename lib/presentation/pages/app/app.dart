import 'package:data/core/config/flavor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menoreh_library/core/_core.dart';
import 'package:menoreh_library/injections.dart';
import 'package:menoreh_library/presentation/_presentation.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:menoreh_library/presentation/routers/auth_guard.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CheckLoginCubit>(
          create: (_) => sl<CheckLoginCubit>()..checkLogin(),
        ),
      ],
      child: BlocBuilder<CheckLoginCubit, CheckLoginState>(
        builder: (context, state) {
          final appRouter = AppRouter(auth: AuthGuard(state.value));

          return MaterialApp.router(
            title: sl<FlavorConfig>().values!.appName!,
            themeMode: ThemeMode.system,
            theme: AppTheme.light(),
            builder: FlutterSmartDialog.init(),
            routerDelegate: appRouter.delegate(),
            routeInformationParser: appRouter.defaultRouteParser(),
            routeInformationProvider: appRouter.routeInfoProvider(),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              SfGlobalLocalizations.delegate,
            ],
            supportedLocales: const [Locale('id'), Locale('en')],
            locale: const Locale('id'),
            
          );
        },
      ),
    );
  }
}
