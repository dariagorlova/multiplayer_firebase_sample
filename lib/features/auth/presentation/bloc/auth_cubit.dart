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

  AuthCubit(AuthRepository repository, NotificationMediator notificationMediator)
      : _repository = repository,
        _notificationMediator = notificationMediator,
        super(const AuthState.initial());

  Future<void> signIn(String name) async {
    if (state is _AuthStateLoading) return;
    emit(const AuthState.loading());
    try {
      await _repository.signIn(name);
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
}
