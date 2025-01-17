part of '../routes.dart';

@TypedGoRoute<HomeRoute>(path: AppRoutes.root)
class HomeRoute extends GoRouteData {
  HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}
