part of 'auth_status_bloc.dart';

@freezed
class AuthStatusBlocEvent with _$AuthStatusBlocEvent {
  const factory AuthStatusBlocEvent.status({required UserStatus user}) = _StatusAuthStatusBlocEvent;
  const factory AuthStatusBlocEvent.connection({required bool status}) = _ConnectionAuthStatusBlocEvent;
}
