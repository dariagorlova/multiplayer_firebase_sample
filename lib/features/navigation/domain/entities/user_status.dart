import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_status.freezed.dart';

enum ConnectionStatus { unknown, online, offline }

@freezed
class UserStatus with _$UserStatus {
  const factory UserStatus({
    String? userId,
    String? name,
    @Default(ConnectionStatus.unknown) ConnectionStatus? connectionStatus,
  }) = _UserStatus;
}
