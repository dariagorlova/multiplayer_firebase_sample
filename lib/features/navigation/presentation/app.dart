import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/index.dart';
import '../../../core_features/toast_notifications/index.dart';
import '../../../localization/l10n.dart';
import '../index.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with RouterMixin {
  var _shouldCloseOfflineDialog = false;
  var _isInitiallyConnected = true;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthStatusBloc>(create: (context) => sl<AuthStatusBloc>()),
        BlocProvider<UserNotificationCubit>(create: (context) => sl<UserNotificationCubit>()),
      ],
      child: GestureDetector(
        // this will hide virtual keyboard if you tab anywhere on screen's empty space
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp.router(
          scaffoldMessengerKey: scaffoldMessengerKey,
          title: AppConst.applicationName,
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          builder: (context, child) => BlocListener<AuthStatusBloc, AuthStatusBlocState>(
            listener: (context, state) {
              switch (state.user.connectionStatus) {
                case ConnectionStatus.online:
                  if (_shouldCloseOfflineDialog) {
                    if (navigatorKey.currentContext!.canPop()) {
                      navigatorKey.currentContext!.pop();
                    }
                    _shouldCloseOfflineDialog = false;
                  }
                  _isInitiallyConnected = true; // initial connection established
                  break;
                case ConnectionStatus.offline:
                  if (_isInitiallyConnected) {
                    _shouldCloseOfflineDialog = true;
                    showDialog<void>(
                      useSafeArea: false,
                      barrierDismissible: false,
                      context: navigatorKey.currentContext!,
                      builder: (context) => const OfflineScreen(),
                    );
                  }
                  break;
                default:
                  break;
              }
            },
            child: child,
          ),
        ),
      ),
    );
  }
}
