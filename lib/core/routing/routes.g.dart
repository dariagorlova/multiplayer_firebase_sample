// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $loginRoute,
      $homeRoute,
    ];

RouteBase get $loginRoute => GoRouteData.$route(
      path: '/login',
      factory: $LoginRouteExtension._fromState,
    );

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => LoginRoute();

  String get location => GoRouteData.$location(
        '/login',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/',
      factory: $HomeRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'join-game',
          factory: $JoinGameRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'host-game',
          factory: $HostGameRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'wait-game',
          factory: $WaitingGameRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'game-process',
          factory: $GameRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'game-over',
          factory: $GameOverRouteExtension._fromState,
        ),
      ],
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $JoinGameRouteExtension on JoinGameRoute {
  static JoinGameRoute _fromState(GoRouterState state) => const JoinGameRoute();

  String get location => GoRouteData.$location(
        '/join-game',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $HostGameRouteExtension on HostGameRoute {
  static HostGameRoute _fromState(GoRouterState state) => const HostGameRoute();

  String get location => GoRouteData.$location(
        '/host-game',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $WaitingGameRouteExtension on WaitingGameRoute {
  static WaitingGameRoute _fromState(GoRouterState state) => WaitingGameRoute(
        state.uri.queryParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/wait-game',
        queryParams: {
          'id': id,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $GameRouteExtension on GameRoute {
  static GameRoute _fromState(GoRouterState state) => GameRoute(
        state.uri.queryParameters['id']!,
        int.parse(state.uri.queryParameters['duration']!),
      );

  String get location => GoRouteData.$location(
        '/game-process',
        queryParams: {
          'id': id,
          'duration': duration.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $GameOverRouteExtension on GameOverRoute {
  static GameOverRoute _fromState(GoRouterState state) => GameOverRoute(
        result: state.uri.queryParameters['result']!,
      );

  String get location => GoRouteData.$location(
        '/game-over',
        queryParams: {
          'result': result,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) => context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
