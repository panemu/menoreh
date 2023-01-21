import 'package:auto_route/auto_route.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthCheck authChack;

  AuthGuard(this.authChack);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final data = await authChack.call(NoParams());

    data.fold(
      (failure) => router.pushAndPopUntil(
        LoginRoute(
          onLoginResult: (value) {
            if (value ?? false) {
              resolver.next();
              router.removeLast();
            }
          },
        ),
        predicate: (r) => true,
      ),
      (value) {
        resolver.next(true);
        BaseApi.AUTHTOKEN = value.authToken;
      },
    );
  }
}
