part of '../routes.dart';

@TypedGoRoute<LoginRoute>(path: AppRoutes.login)
class LoginRoute extends GoRouteData {
  LoginRoute();

  Widget build(BuildContext context, GoRouterState state) {
    context.read<AuthCubit>().signIn();
    return const LoginScreen();
  }
}
