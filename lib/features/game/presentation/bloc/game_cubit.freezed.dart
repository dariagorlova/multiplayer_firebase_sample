// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GameState {
  GameStatus get status => throw _privateConstructorUsedError;
  GameModel get board => throw _privateConstructorUsedError;
  String get myName => throw _privateConstructorUsedError;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameStateCopyWith<GameState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) = _$GameStateCopyWithImpl<$Res, GameState>;
  @useResult
  $Res call({GameStatus status, GameModel board, String myName});

  $GameModelCopyWith<$Res> get board;
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res, $Val extends GameState> implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? board = null,
    Object? myName = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStatus,
      board: null == board
          ? _value.board
          : board // ignore: cast_nullable_to_non_nullable
              as GameModel,
      myName: null == myName
          ? _value.myName
          : myName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GameModelCopyWith<$Res> get board {
    return $GameModelCopyWith<$Res>(_value.board, (value) {
      return _then(_value.copyWith(board: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GameStateImplCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$$GameStateImplCopyWith(_$GameStateImpl value, $Res Function(_$GameStateImpl) then) = __$$GameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GameStatus status, GameModel board, String myName});

  @override
  $GameModelCopyWith<$Res> get board;
}

/// @nodoc
class __$$GameStateImplCopyWithImpl<$Res> extends _$GameStateCopyWithImpl<$Res, _$GameStateImpl> implements _$$GameStateImplCopyWith<$Res> {
  __$$GameStateImplCopyWithImpl(_$GameStateImpl _value, $Res Function(_$GameStateImpl) _then) : super(_value, _then);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? board = null,
    Object? myName = null,
  }) {
    return _then(_$GameStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GameStatus,
      board: null == board
          ? _value.board
          : board // ignore: cast_nullable_to_non_nullable
              as GameModel,
      myName: null == myName
          ? _value.myName
          : myName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GameStateImpl implements _GameState {
  const _$GameStateImpl({required this.status, required this.board, required this.myName});

  @override
  final GameStatus status;
  @override
  final GameModel board;
  @override
  final String myName;

  @override
  String toString() {
    return 'GameState(status: $status, board: $board, myName: $myName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.board, board) || other.board == board) &&
            (identical(other.myName, myName) || other.myName == myName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, board, myName);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith => __$$GameStateImplCopyWithImpl<_$GameStateImpl>(this, _$identity);
}

abstract class _GameState implements GameState {
  const factory _GameState({required final GameStatus status, required final GameModel board, required final String myName}) = _$GameStateImpl;

  @override
  GameStatus get status;
  @override
  GameModel get board;
  @override
  String get myName;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameStateImplCopyWith<_$GameStateImpl> get copyWith => throw _privateConstructorUsedError;
}
