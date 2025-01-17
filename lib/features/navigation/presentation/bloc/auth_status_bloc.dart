import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../index.dart';

part 'auth_status_event.dart';
part 'auth_status_state.dart';
part 'auth_status_bloc.freezed.dart';

class AuthStatusBloc extends Bloc<AuthStatusBlocEvent, AuthStatusBlocState> with ChangeNotifier {
  AuthStatusBloc(AppAuthRepository repository)
      : _repository = repository,
        super(const AuthStatusBlocState(user: UserStatus())) {
    _authSubscription = _repository.authorizationStatus.listen(
      _onAuthStatusChangeCallback,
    );

    on<_StatusAuthStatusBlocEvent>(_onAuthStatusChange);
    on<_ConnectionAuthStatusBlocEvent>(_onConnectionStatusChange);
  }

  StreamSubscription<UserStatus>? _authSubscription;
  StreamSubscription<bool>? _onlineSubscription;
  final AppAuthRepository _repository;

  Future<void> _onAuthStatusChangeCallback(UserStatus status) async {
    // add an event, if auth status changed
    add(AuthStatusBlocEvent.status(user: status));

    // user is logged in, so we can start checking his online status
    if (status.userId != null && _onlineSubscription == null) {
      _onlineSubscription = _repository.connectionStream.listen(
        _onConnectionStatusChangeCallback,
      );
    } else if (status.userId == null && _onlineSubscription != null) {
      //logout case
      await _onlineSubscription?.cancel();
      // to make it work if user logs in again
      _onlineSubscription = null;
    }
  }

  void _onConnectionStatusChangeCallback(bool status) {
    // add an event, if connection status changed
    if (state.user.connectionStatus == ConnectionStatus.unknown && !status) {
      return;
    }
    add(AuthStatusBlocEvent.connection(status: status));
  }

  Future<void> _onAuthStatusChange(
    _StatusAuthStatusBlocEvent event,
    Emitter<AuthStatusBlocState> emit,
  ) async {
    emit(state.copyWith(
      user: state.user.copyWith(
        userId: event.user.userId,
        connectionStatus: event.user.userId == null ? ConnectionStatus.unknown : event.user.connectionStatus,
      ),
    ));
    // we have to notify go_router about auth status changes,
    // cuz his job is to rule the redirection logic
    notifyListeners();
  }

  Future<void> _onConnectionStatusChange(
    _ConnectionAuthStatusBlocEvent event,
    Emitter<AuthStatusBlocState> emit,
  ) async {
    emit(state.copyWith(
      user: state.user.copyWith(
        connectionStatus: state.user.userId == null
            ? ConnectionStatus.unknown
            : event.status
                ? ConnectionStatus.online
                : ConnectionStatus.offline,
      ),
    ));
    // we dont need to notify go_router about connection status changes.
    // this job will be done by the block listener
  }

  @override
  Future<void> close() async {
    await _authSubscription?.cancel();
    await _onlineSubscription?.cancel();
    await super.close();
  }
}
