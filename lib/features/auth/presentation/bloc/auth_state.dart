part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _AuthState;
  const factory AuthState.loading() = _AuthStateLoading;
}
