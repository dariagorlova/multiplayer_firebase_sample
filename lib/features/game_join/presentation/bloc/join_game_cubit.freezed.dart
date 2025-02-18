// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'join_game_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$JoinGameState {
  JoinGameStatus get status => throw _privateConstructorUsedError;
  List<ActiveGameModel> get activeGames => throw _privateConstructorUsedError;
  ActiveGameModel? get selectedGame => throw _privateConstructorUsedError;

  /// Create a copy of JoinGameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JoinGameStateCopyWith<JoinGameState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JoinGameStateCopyWith<$Res> {
  factory $JoinGameStateCopyWith(JoinGameState value, $Res Function(JoinGameState) then) = _$JoinGameStateCopyWithImpl<$Res, JoinGameState>;
  @useResult
  $Res call({JoinGameStatus status, List<ActiveGameModel> activeGames, ActiveGameModel? selectedGame});

  $ActiveGameModelCopyWith<$Res>? get selectedGame;
}

/// @nodoc
class _$JoinGameStateCopyWithImpl<$Res, $Val extends JoinGameState> implements $JoinGameStateCopyWith<$Res> {
  _$JoinGameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JoinGameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? activeGames = null,
    Object? selectedGame = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as JoinGameStatus,
      activeGames: null == activeGames
          ? _value.activeGames
          : activeGames // ignore: cast_nullable_to_non_nullable
              as List<ActiveGameModel>,
      selectedGame: freezed == selectedGame
          ? _value.selectedGame
          : selectedGame // ignore: cast_nullable_to_non_nullable
              as ActiveGameModel?,
    ) as $Val);
  }

  /// Create a copy of JoinGameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ActiveGameModelCopyWith<$Res>? get selectedGame {
    if (_value.selectedGame == null) {
      return null;
    }

    return $ActiveGameModelCopyWith<$Res>(_value.selectedGame!, (value) {
      return _then(_value.copyWith(selectedGame: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$JoinGameStateImplCopyWith<$Res> implements $JoinGameStateCopyWith<$Res> {
  factory _$$JoinGameStateImplCopyWith(_$JoinGameStateImpl value, $Res Function(_$JoinGameStateImpl) then) = __$$JoinGameStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({JoinGameStatus status, List<ActiveGameModel> activeGames, ActiveGameModel? selectedGame});

  @override
  $ActiveGameModelCopyWith<$Res>? get selectedGame;
}

/// @nodoc
class __$$JoinGameStateImplCopyWithImpl<$Res> extends _$JoinGameStateCopyWithImpl<$Res, _$JoinGameStateImpl>
    implements _$$JoinGameStateImplCopyWith<$Res> {
  __$$JoinGameStateImplCopyWithImpl(_$JoinGameStateImpl _value, $Res Function(_$JoinGameStateImpl) _then) : super(_value, _then);

  /// Create a copy of JoinGameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? activeGames = null,
    Object? selectedGame = freezed,
  }) {
    return _then(_$JoinGameStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as JoinGameStatus,
      activeGames: null == activeGames
          ? _value._activeGames
          : activeGames // ignore: cast_nullable_to_non_nullable
              as List<ActiveGameModel>,
      selectedGame: freezed == selectedGame
          ? _value.selectedGame
          : selectedGame // ignore: cast_nullable_to_non_nullable
              as ActiveGameModel?,
    ));
  }
}

/// @nodoc

class _$JoinGameStateImpl implements _JoinGameState {
  const _$JoinGameStateImpl({required this.status, required final List<ActiveGameModel> activeGames, this.selectedGame}) : _activeGames = activeGames;

  @override
  final JoinGameStatus status;
  final List<ActiveGameModel> _activeGames;
  @override
  List<ActiveGameModel> get activeGames {
    if (_activeGames is EqualUnmodifiableListView) return _activeGames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activeGames);
  }

  @override
  final ActiveGameModel? selectedGame;

  @override
  String toString() {
    return 'JoinGameState(status: $status, activeGames: $activeGames, selectedGame: $selectedGame)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JoinGameStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._activeGames, _activeGames) &&
            (identical(other.selectedGame, selectedGame) || other.selectedGame == selectedGame));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, const DeepCollectionEquality().hash(_activeGames), selectedGame);

  /// Create a copy of JoinGameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JoinGameStateImplCopyWith<_$JoinGameStateImpl> get copyWith => __$$JoinGameStateImplCopyWithImpl<_$JoinGameStateImpl>(this, _$identity);
}

abstract class _JoinGameState implements JoinGameState {
  const factory _JoinGameState(
      {required final JoinGameStatus status,
      required final List<ActiveGameModel> activeGames,
      final ActiveGameModel? selectedGame}) = _$JoinGameStateImpl;

  @override
  JoinGameStatus get status;
  @override
  List<ActiveGameModel> get activeGames;
  @override
  ActiveGameModel? get selectedGame;

  /// Create a copy of JoinGameState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JoinGameStateImplCopyWith<_$JoinGameStateImpl> get copyWith => throw _privateConstructorUsedError;
}
