// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_status_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthStatusBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserStatus user) status,
    required TResult Function(bool status) connection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserStatus user)? status,
    TResult? Function(bool status)? connection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserStatus user)? status,
    TResult Function(bool status)? connection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StatusAuthStatusBlocEvent value) status,
    required TResult Function(_ConnectionAuthStatusBlocEvent value) connection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StatusAuthStatusBlocEvent value)? status,
    TResult? Function(_ConnectionAuthStatusBlocEvent value)? connection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StatusAuthStatusBlocEvent value)? status,
    TResult Function(_ConnectionAuthStatusBlocEvent value)? connection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStatusBlocEventCopyWith<$Res> {
  factory $AuthStatusBlocEventCopyWith(AuthStatusBlocEvent value, $Res Function(AuthStatusBlocEvent) then) =
      _$AuthStatusBlocEventCopyWithImpl<$Res, AuthStatusBlocEvent>;
}

/// @nodoc
class _$AuthStatusBlocEventCopyWithImpl<$Res, $Val extends AuthStatusBlocEvent> implements $AuthStatusBlocEventCopyWith<$Res> {
  _$AuthStatusBlocEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthStatusBlocEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StatusAuthStatusBlocEventImplCopyWith<$Res> {
  factory _$$StatusAuthStatusBlocEventImplCopyWith(_$StatusAuthStatusBlocEventImpl value, $Res Function(_$StatusAuthStatusBlocEventImpl) then) =
      __$$StatusAuthStatusBlocEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserStatus user});

  $UserStatusCopyWith<$Res> get user;
}

/// @nodoc
class __$$StatusAuthStatusBlocEventImplCopyWithImpl<$Res> extends _$AuthStatusBlocEventCopyWithImpl<$Res, _$StatusAuthStatusBlocEventImpl>
    implements _$$StatusAuthStatusBlocEventImplCopyWith<$Res> {
  __$$StatusAuthStatusBlocEventImplCopyWithImpl(_$StatusAuthStatusBlocEventImpl _value, $Res Function(_$StatusAuthStatusBlocEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthStatusBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$StatusAuthStatusBlocEventImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserStatus,
    ));
  }

  /// Create a copy of AuthStatusBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserStatusCopyWith<$Res> get user {
    return $UserStatusCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$StatusAuthStatusBlocEventImpl implements _StatusAuthStatusBlocEvent {
  const _$StatusAuthStatusBlocEventImpl({required this.user});

  @override
  final UserStatus user;

  @override
  String toString() {
    return 'AuthStatusBlocEvent.status(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StatusAuthStatusBlocEventImpl && (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of AuthStatusBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusAuthStatusBlocEventImplCopyWith<_$StatusAuthStatusBlocEventImpl> get copyWith =>
      __$$StatusAuthStatusBlocEventImplCopyWithImpl<_$StatusAuthStatusBlocEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserStatus user) status,
    required TResult Function(bool status) connection,
  }) {
    return status(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserStatus user)? status,
    TResult? Function(bool status)? connection,
  }) {
    return status?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserStatus user)? status,
    TResult Function(bool status)? connection,
    required TResult orElse(),
  }) {
    if (status != null) {
      return status(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StatusAuthStatusBlocEvent value) status,
    required TResult Function(_ConnectionAuthStatusBlocEvent value) connection,
  }) {
    return status(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StatusAuthStatusBlocEvent value)? status,
    TResult? Function(_ConnectionAuthStatusBlocEvent value)? connection,
  }) {
    return status?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StatusAuthStatusBlocEvent value)? status,
    TResult Function(_ConnectionAuthStatusBlocEvent value)? connection,
    required TResult orElse(),
  }) {
    if (status != null) {
      return status(this);
    }
    return orElse();
  }
}

abstract class _StatusAuthStatusBlocEvent implements AuthStatusBlocEvent {
  const factory _StatusAuthStatusBlocEvent({required final UserStatus user}) = _$StatusAuthStatusBlocEventImpl;

  UserStatus get user;

  /// Create a copy of AuthStatusBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatusAuthStatusBlocEventImplCopyWith<_$StatusAuthStatusBlocEventImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConnectionAuthStatusBlocEventImplCopyWith<$Res> {
  factory _$$ConnectionAuthStatusBlocEventImplCopyWith(
          _$ConnectionAuthStatusBlocEventImpl value, $Res Function(_$ConnectionAuthStatusBlocEventImpl) then) =
      __$$ConnectionAuthStatusBlocEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool status});
}

/// @nodoc
class __$$ConnectionAuthStatusBlocEventImplCopyWithImpl<$Res> extends _$AuthStatusBlocEventCopyWithImpl<$Res, _$ConnectionAuthStatusBlocEventImpl>
    implements _$$ConnectionAuthStatusBlocEventImplCopyWith<$Res> {
  __$$ConnectionAuthStatusBlocEventImplCopyWithImpl(
      _$ConnectionAuthStatusBlocEventImpl _value, $Res Function(_$ConnectionAuthStatusBlocEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthStatusBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$ConnectionAuthStatusBlocEventImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ConnectionAuthStatusBlocEventImpl implements _ConnectionAuthStatusBlocEvent {
  const _$ConnectionAuthStatusBlocEventImpl({required this.status});

  @override
  final bool status;

  @override
  String toString() {
    return 'AuthStatusBlocEvent.connection(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionAuthStatusBlocEventImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  /// Create a copy of AuthStatusBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectionAuthStatusBlocEventImplCopyWith<_$ConnectionAuthStatusBlocEventImpl> get copyWith =>
      __$$ConnectionAuthStatusBlocEventImplCopyWithImpl<_$ConnectionAuthStatusBlocEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserStatus user) status,
    required TResult Function(bool status) connection,
  }) {
    return connection(this.status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserStatus user)? status,
    TResult? Function(bool status)? connection,
  }) {
    return connection?.call(this.status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserStatus user)? status,
    TResult Function(bool status)? connection,
    required TResult orElse(),
  }) {
    if (connection != null) {
      return connection(this.status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StatusAuthStatusBlocEvent value) status,
    required TResult Function(_ConnectionAuthStatusBlocEvent value) connection,
  }) {
    return connection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StatusAuthStatusBlocEvent value)? status,
    TResult? Function(_ConnectionAuthStatusBlocEvent value)? connection,
  }) {
    return connection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StatusAuthStatusBlocEvent value)? status,
    TResult Function(_ConnectionAuthStatusBlocEvent value)? connection,
    required TResult orElse(),
  }) {
    if (connection != null) {
      return connection(this);
    }
    return orElse();
  }
}

abstract class _ConnectionAuthStatusBlocEvent implements AuthStatusBlocEvent {
  const factory _ConnectionAuthStatusBlocEvent({required final bool status}) = _$ConnectionAuthStatusBlocEventImpl;

  bool get status;

  /// Create a copy of AuthStatusBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConnectionAuthStatusBlocEventImplCopyWith<_$ConnectionAuthStatusBlocEventImpl> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthStatusBlocState {
  UserStatus get user => throw _privateConstructorUsedError;

  /// Create a copy of AuthStatusBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthStatusBlocStateCopyWith<AuthStatusBlocState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStatusBlocStateCopyWith<$Res> {
  factory $AuthStatusBlocStateCopyWith(AuthStatusBlocState value, $Res Function(AuthStatusBlocState) then) =
      _$AuthStatusBlocStateCopyWithImpl<$Res, AuthStatusBlocState>;
  @useResult
  $Res call({UserStatus user});

  $UserStatusCopyWith<$Res> get user;
}

/// @nodoc
class _$AuthStatusBlocStateCopyWithImpl<$Res, $Val extends AuthStatusBlocState> implements $AuthStatusBlocStateCopyWith<$Res> {
  _$AuthStatusBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthStatusBlocState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserStatus,
    ) as $Val);
  }

  /// Create a copy of AuthStatusBlocState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserStatusCopyWith<$Res> get user {
    return $UserStatusCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthStatusBlocStateImplCopyWith<$Res> implements $AuthStatusBlocStateCopyWith<$Res> {
  factory _$$AuthStatusBlocStateImplCopyWith(_$AuthStatusBlocStateImpl value, $Res Function(_$AuthStatusBlocStateImpl) then) =
      __$$AuthStatusBlocStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserStatus user});

  @override
  $UserStatusCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthStatusBlocStateImplCopyWithImpl<$Res> extends _$AuthStatusBlocStateCopyWithImpl<$Res, _$AuthStatusBlocStateImpl>
    implements _$$AuthStatusBlocStateImplCopyWith<$Res> {
  __$$AuthStatusBlocStateImplCopyWithImpl(_$AuthStatusBlocStateImpl _value, $Res Function(_$AuthStatusBlocStateImpl) _then) : super(_value, _then);

  /// Create a copy of AuthStatusBlocState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$AuthStatusBlocStateImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserStatus,
    ));
  }
}

/// @nodoc

class _$AuthStatusBlocStateImpl implements _AuthStatusBlocState {
  const _$AuthStatusBlocStateImpl({required this.user});

  @override
  final UserStatus user;

  @override
  String toString() {
    return 'AuthStatusBlocState(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthStatusBlocStateImpl && (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of AuthStatusBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStatusBlocStateImplCopyWith<_$AuthStatusBlocStateImpl> get copyWith =>
      __$$AuthStatusBlocStateImplCopyWithImpl<_$AuthStatusBlocStateImpl>(this, _$identity);
}

abstract class _AuthStatusBlocState implements AuthStatusBlocState {
  const factory _AuthStatusBlocState({required final UserStatus user}) = _$AuthStatusBlocStateImpl;

  @override
  UserStatus get user;

  /// Create a copy of AuthStatusBlocState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStatusBlocStateImplCopyWith<_$AuthStatusBlocStateImpl> get copyWith => throw _privateConstructorUsedError;
}
