// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'countdown_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CountdownState {
  int get secondsPerPlayerMove => throw _privateConstructorUsedError;
  Duration get time => throw _privateConstructorUsedError;
  CountdownStatus get status => throw _privateConstructorUsedError;

  /// Create a copy of CountdownState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CountdownStateCopyWith<CountdownState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountdownStateCopyWith<$Res> {
  factory $CountdownStateCopyWith(CountdownState value, $Res Function(CountdownState) then) = _$CountdownStateCopyWithImpl<$Res, CountdownState>;
  @useResult
  $Res call({int secondsPerPlayerMove, Duration time, CountdownStatus status});
}

/// @nodoc
class _$CountdownStateCopyWithImpl<$Res, $Val extends CountdownState> implements $CountdownStateCopyWith<$Res> {
  _$CountdownStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CountdownState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? secondsPerPlayerMove = null,
    Object? time = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      secondsPerPlayerMove: null == secondsPerPlayerMove
          ? _value.secondsPerPlayerMove
          : secondsPerPlayerMove // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as Duration,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CountdownStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountdownStateImplCopyWith<$Res> implements $CountdownStateCopyWith<$Res> {
  factory _$$CountdownStateImplCopyWith(_$CountdownStateImpl value, $Res Function(_$CountdownStateImpl) then) =
      __$$CountdownStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int secondsPerPlayerMove, Duration time, CountdownStatus status});
}

/// @nodoc
class __$$CountdownStateImplCopyWithImpl<$Res> extends _$CountdownStateCopyWithImpl<$Res, _$CountdownStateImpl>
    implements _$$CountdownStateImplCopyWith<$Res> {
  __$$CountdownStateImplCopyWithImpl(_$CountdownStateImpl _value, $Res Function(_$CountdownStateImpl) _then) : super(_value, _then);

  /// Create a copy of CountdownState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? secondsPerPlayerMove = null,
    Object? time = null,
    Object? status = null,
  }) {
    return _then(_$CountdownStateImpl(
      secondsPerPlayerMove: null == secondsPerPlayerMove
          ? _value.secondsPerPlayerMove
          : secondsPerPlayerMove // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as Duration,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CountdownStatus,
    ));
  }
}

/// @nodoc

class _$CountdownStateImpl implements _CountdownState {
  const _$CountdownStateImpl({required this.secondsPerPlayerMove, required this.time, required this.status});

  @override
  final int secondsPerPlayerMove;
  @override
  final Duration time;
  @override
  final CountdownStatus status;

  @override
  String toString() {
    return 'CountdownState(secondsPerPlayerMove: $secondsPerPlayerMove, time: $time, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountdownStateImpl &&
            (identical(other.secondsPerPlayerMove, secondsPerPlayerMove) || other.secondsPerPlayerMove == secondsPerPlayerMove) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, secondsPerPlayerMove, time, status);

  /// Create a copy of CountdownState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CountdownStateImplCopyWith<_$CountdownStateImpl> get copyWith => __$$CountdownStateImplCopyWithImpl<_$CountdownStateImpl>(this, _$identity);
}

abstract class _CountdownState implements CountdownState {
  const factory _CountdownState({required final int secondsPerPlayerMove, required final Duration time, required final CountdownStatus status}) =
      _$CountdownStateImpl;

  @override
  int get secondsPerPlayerMove;
  @override
  Duration get time;
  @override
  CountdownStatus get status;

  /// Create a copy of CountdownState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CountdownStateImplCopyWith<_$CountdownStateImpl> get copyWith => throw _privateConstructorUsedError;
}
