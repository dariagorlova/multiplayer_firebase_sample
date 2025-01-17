import '../../index.dart';

class AppNavigationRepositoryImpl implements AppAuthRepository {
  final AuthStatusService _authStatusService;
  final OnlineStatusService _onlineStatusService;

  const AppNavigationRepositoryImpl(
    AuthStatusService authStatusService,
    OnlineStatusService onlineStatusService,
  )   : _authStatusService = authStatusService,
        _onlineStatusService = onlineStatusService;

  @override
  Stream<UserStatus> get authorizationStatus => _authStatusService.authStatus.asyncMap((authStatus) async {
        if (authStatus.userId == null) {
          return authStatus;
        }
        // if we need to return user data from corresponding table, here is the best place to do it here
        // but now we simply return what we got from service
        return authStatus;
      });

  @override
  Stream<bool> get connectionStream => _onlineStatusService.connectionStatus(_authStatusService.userId);
}
