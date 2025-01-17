import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/index.dart';
import '../../index.dart';

mixin RouterMixin on State<App> {
  final _router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: AppRoutes.root,
    errorBuilder: (context, state) => const ErrorScreen(),
    routes: routes,
    redirect: (context, state) async {
      final gateState = sl<AuthStatusBloc>().state.user;
      final isLoginRoute = state.matchedLocation == AppRoutes.login;
      final isAuthenticated = gateState.userId != null;

      // redirect to login page after signOut, and to home page after signIn
      if (isLoginRoute && isAuthenticated) {
        return AppRoutes.root;
      } else if (!isLoginRoute && !isAuthenticated) {
        return AppRoutes.login;
      }

      return null;
    },
    refreshListenable: sl<AuthStatusBloc>(),
  );

  GoRouter get router => _router;
}
