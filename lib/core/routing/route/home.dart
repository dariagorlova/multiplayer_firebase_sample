part of '../routes.dart';

@TypedGoRoute<HomeRoute>(
  path: AppRoutes.root,
  routes: [
    TypedGoRoute<JoinGameRoute>(path: AppRoutes.joinGame),
    TypedGoRoute<HostGameRoute>(path: AppRoutes.hostGame),
    TypedGoRoute<WaitingGameRoute>(path: AppRoutes.waitGame),
    TypedGoRoute<GameRoute>(path: AppRoutes.gameProcess),
    TypedGoRoute<GameOverRoute>(path: AppRoutes.gameOver),
  ],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

class HostGameRoute extends GoRouteData {
  const HostGameRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => BlocProvider<HostGameCubit>(
        create: (context) => sl<HostGameCubit>(),
        child: const HostGameScreen(),
      );
}

class JoinGameRoute extends GoRouteData {
  const JoinGameRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => BlocProvider<JoinGameCubit>(
        create: (context) => sl<JoinGameCubit>(),
        child: const JoinGameScreen(),
      );
}

class WaitingGameRoute extends GoRouteData {
  final String id;
  const WaitingGameRoute(this.id);

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => FadeTransitionPage(
      state.pageKey,
      BlocProvider<WaitingGameCubit>(
        create: (context) => sl<WaitingGameCubit>()..init(id),
        child: const GameWaitingScreen(),
      ));
}

class GameRoute extends GoRouteData {
  final String id;
  const GameRoute(this.id);

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => FadeTransitionPage(
      state.pageKey,
      BlocProvider<GameCubit>(
        create: (context) => sl<GameCubit>()..init(id),
        child: const GameScreen(),
        lazy: false,
      ));
}

class GameOverRoute extends GoRouteData {
  final String result;
  const GameOverRoute({required this.result});

  @override
  Widget build(BuildContext context, GoRouterState state) => GameOverScreen(result: result);
}
