import 'package:auto_route/auto_route.dart';
import 'package:menoreh_library/presentation/_presentation.dart';

class AuthGuard extends AutoRouteGuard {
  final bool status;

  AuthGuard(this.status);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (!status) {
      router.pushAndPopUntil(
        LoginRoute(
          onLoginResult: (value) {
            if(value ?? false) {
              resolver.next();
              router.removeLast();
            }
          },
        ),
        predicate: (r) => true,
      );
    } else {
      resolver.next(true);
    }
  }
}
