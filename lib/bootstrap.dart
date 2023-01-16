import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:menoreh_library/injections.dart';
import 'package:url_strategy/url_strategy.dart';


Future<void> bootstrap(FutureOr<Widget> Function() builder, {required FlavorConfig flavor}) async {
  await runZonedGuarded(
    () async {
      Bloc.observer = AppBlocObserver();

      //! remove the leading hash (#) from the URL
      setPathUrlStrategy();

      //! init injection locator
      initLocator(flavor);

      //! setup and run app
      runApp(await builder());
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
}

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, \n $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}
