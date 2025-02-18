part of '../routes.dart';

@TypedGoRoute<LoginRoute>(path: AppRoutes.login)
class LoginRoute extends GoRouteData {
  LoginRoute();

  Widget build(BuildContext context, GoRouterState state) => BlocProvider<AuthCubit>(
        create: (context) => sl<AuthCubit>()..signIn(),
        child: const LoginScreen(),
      );
}
