part of 'auth_status_bloc.dart';

@freezed
class AuthStatusBlocState with _$AuthStatusBlocState {
  const factory AuthStatusBlocState({required UserStatus user}) = _AuthStatusBlocState;
}
