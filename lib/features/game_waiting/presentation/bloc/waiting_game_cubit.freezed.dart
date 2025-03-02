// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'waiting_game_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WaitingGameState {
  WaitingStatus get status => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  int get playersIn => throw _privateConstructorUsedError;
  String get host => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;

  /// Create a copy of WaitingGameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WaitingGameStateCopyWith<WaitingGameState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WaitingGameStateCopyWith<$Res> {
  factory $WaitingGameStateCopyWith(WaitingGameState value, $Res Function(WaitingGameState) then) =
      _$WaitingGameStateCopyWithImpl<$Res, WaitingGameState>;
  @useResult
  $Res call({WaitingStatus status, String id, int count, int playersIn, String host, int duration});
}

/// @nodoc
class _$WaitingGameStateCopyWithImpl<$Res, $Val extends WaitingGameState> implements $WaitingGameStateCopyWith<$Res> {
  _$WaitingGameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WaitingGameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? id = null,
    Object? count = null,
    Object? playersIn = null,
    Object? host = null,
    Object? duration = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WaitingStatus,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      playersIn: null == playersIn
          ? _value.playersIn
          : playersIn // ignore: cast_nullable_to_non_nullable
              as int,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WaitingGameStateImplCopyWith<$Res> implements $WaitingGameStateCopyWith<$Res> {
  factory _$$WaitingGameStateImplCopyWith(_$WaitingGameStateImpl value, $Res Function(_$WaitingGameStateImpl) then) =
      __$$WaitingGameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WaitingStatus status, String id, int count, int playersIn, String host, int duration});
}

/// @nodoc
class __$$WaitingGameStateImplCopyWithImpl<$Res> extends _$WaitingGameStateCopyWithImpl<$Res, _$WaitingGameStateImpl>
    implements _$$WaitingGameStateImplCopyWith<$Res> {
  __$$WaitingGameStateImplCopyWithImpl(_$WaitingGameStateImpl _value, $Res Function(_$WaitingGameStateImpl) _then) : super(_value, _then);

  /// Create a copy of WaitingGameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? id = null,
    Object? count = null,
    Object? playersIn = null,
    Object? host = null,
    Object? duration = null,
  }) {
    return _then(_$WaitingGameStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WaitingStatus,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      playersIn: null == playersIn
          ? _value.playersIn
          : playersIn // ignore: cast_nullable_to_non_nullable
              as int,
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$WaitingGameStateImpl implements _WaitingGameState {
  const _$WaitingGameStateImpl(
      {required this.status, required this.id, required this.count, required this.playersIn, required this.host, required this.duration});

  @override
  final WaitingStatus status;
  @override
  final String id;
  @override
  final int count;
  @override
  final int playersIn;
  @override
  final String host;
  @override
  final int duration;

  @override
  String toString() {
    return 'WaitingGameState(status: $status, id: $id, count: $count, playersIn: $playersIn, host: $host, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WaitingGameStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.playersIn, playersIn) || other.playersIn == playersIn) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.duration, duration) || other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, id, count, playersIn, host, duration);

  /// Create a copy of WaitingGameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WaitingGameStateImplCopyWith<_$WaitingGameStateImpl> get copyWith =>
      __$$WaitingGameStateImplCopyWithImpl<_$WaitingGameStateImpl>(this, _$identity);
}

abstract class _WaitingGameState implements WaitingGameState {
  const factory _WaitingGameState(
      {required final WaitingStatus status,
      required final String id,
      required final int count,
      required final int playersIn,
      required final String host,
      required final int duration}) = _$WaitingGameStateImpl;

  @override
  WaitingStatus get status;
  @override
  String get id;
  @override
  int get count;
  @override
  int get playersIn;
  @override
  String get host;
  @override
  int get duration;

  /// Create a copy of WaitingGameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WaitingGameStateImplCopyWith<_$WaitingGameStateImpl> get copyWith => throw _privateConstructorUsedError;
}
