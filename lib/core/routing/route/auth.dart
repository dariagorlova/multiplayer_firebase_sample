part of '../routes.dart';

@TypedGoRoute<LoginRoute>(path: AppRoutes.login)
class LoginRoute extends GoRouteData {
  LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const LoginScreen();
}
