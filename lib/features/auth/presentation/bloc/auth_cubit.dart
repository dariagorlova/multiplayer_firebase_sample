import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/index.dart';
import '../../../../core_features/toast_notifications/index.dart';
import '../../index.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _repository;
  final NotificationMediator _notificationMediator;
  final LoggerService _logger;

  AuthCubit(AuthRepository repository, NotificationMediator notificationMediator, LoggerService logger)
      : _repository = repository,
        _notificationMediator = notificationMediator,
        _logger = logger,
        super(const AuthState.initial()) {
    _logger.simple('AuthCubit is created');
  }

  Future<void> signIn() async {
    if (state is _AuthStateLoading) return;
    emit(const AuthState.loading());
    try {
      await _repository.signIn();
    } on LocalizedException catch (e) {
      _notificationMediator.notify(AppErrorNotification(e));
    }
    emit(const AuthState.initial());
  }

  Future<void> setName(String name) async {
    if (state is _AuthStateLoading) return;
    emit(const AuthState.loading());
    try {
      await _repository.setName(name);
    } on LocalizedException catch (e) {
      _notificationMediator.notify(AppErrorNotification(e));
      emit(const AuthState.initial());
    }
  }

  Future<void> signOut() async {
    if (state is _AuthStateLoading) return;
    emit(const AuthState.loading());
    try {
      await _repository.signOut();
    } on LocalizedException catch (e) {
      _notificationMediator.notify(AppErrorNotification(e));
      emit(const AuthState.initial());
    }
  }

  @override
  Future<void> close() {
    // bloc is destroyed, we don't need it any more
    _logger.simple('AuthCubit is destroyed');
    return super.close();
  }
}
