import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/index.dart';
import '../../index.dart';

mixin RouterMixin on State<App> {
  GoRouter createRouter(AuthStatusBloc bloc) {
    return GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: AppRoutes.root,
      errorBuilder: (context, state) => const ErrorScreen(),
      routes: routes,
      redirect: (context, state) async {
        final gateState = context.read<AuthStatusBloc>().state.user;
        final isLoginRoute = state.matchedLocation == AppRoutes.login;
        final isAuthenticated = gateState.userId != null && gateState.name != null;

        // redirect to login page after signOut, and to home page after signIn
        if (isLoginRoute && isAuthenticated) {
          return AppRoutes.root;
        } else if (!isLoginRoute && !isAuthenticated) {
          return AppRoutes.login;
        }

        return null;
      },
      refreshListenable: bloc,
    );
  }
}
