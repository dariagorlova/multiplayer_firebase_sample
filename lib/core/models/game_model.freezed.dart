// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GameModel _$GameModelFromJson(Map<String, dynamic> json) {
  return _GameModel.fromJson(json);
}

/// @nodoc
mixin _$GameModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get playersCount => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  List<UserModel> get players => throw _privateConstructorUsedError;
  List<String> get words => throw _privateConstructorUsedError;
  String get curPlayerId => throw _privateConstructorUsedError;

  /// Serializes this GameModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GameModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameModelCopyWith<GameModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameModelCopyWith<$Res> {
  factory $GameModelCopyWith(GameModel value, $Res Function(GameModel) then) = _$GameModelCopyWithImpl<$Res, GameModel>;
  @useResult
  $Res call({String id, String name, int playersCount, int duration, List<UserModel> players, List<String> words, String curPlayerId});
}

/// @nodoc
class _$GameModelCopyWithImpl<$Res, $Val extends GameModel> implements $GameModelCopyWith<$Res> {
  _$GameModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? playersCount = null,
    Object? duration = null,
    Object? players = null,
    Object? words = null,
    Object? curPlayerId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      playersCount: null == playersCount
          ? _value.playersCount
          : playersCount // ignore: cast_nullable_to_non_nullable
              as int,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      words: null == words
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<String>,
      curPlayerId: null == curPlayerId
          ? _value.curPlayerId
          : curPlayerId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameModelImplCopyWith<$Res> implements $GameModelCopyWith<$Res> {
  factory _$$GameModelImplCopyWith(_$GameModelImpl value, $Res Function(_$GameModelImpl) then) = __$$GameModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, int playersCount, int duration, List<UserModel> players, List<String> words, String curPlayerId});
}

/// @nodoc
class __$$GameModelImplCopyWithImpl<$Res> extends _$GameModelCopyWithImpl<$Res, _$GameModelImpl> implements _$$GameModelImplCopyWith<$Res> {
  __$$GameModelImplCopyWithImpl(_$GameModelImpl _value, $Res Function(_$GameModelImpl) _then) : super(_value, _then);

  /// Create a copy of GameModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? playersCount = null,
    Object? duration = null,
    Object? players = null,
    Object? words = null,
    Object? curPlayerId = null,
  }) {
    return _then(_$GameModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      playersCount: null == playersCount
          ? _value.playersCount
          : playersCount // ignore: cast_nullable_to_non_nullable
              as int,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      players: null == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      words: null == words
          ? _value._words
          : words // ignore: cast_nullable_to_non_nullable
              as List<String>,
      curPlayerId: null == curPlayerId
          ? _value.curPlayerId
          : curPlayerId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameModelImpl implements _GameModel {
  const _$GameModelImpl(
      {required this.id,
      required this.name,
      required this.playersCount,
      required this.duration,
      final List<UserModel> players = const [],
      final List<String> words = const [],
      required this.curPlayerId})
      : _players = players,
        _words = words;

  factory _$GameModelImpl.fromJson(Map<String, dynamic> json) => _$$GameModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int playersCount;
  @override
  final int duration;
  final List<UserModel> _players;
  @override
  @JsonKey()
  List<UserModel> get players {
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  final List<String> _words;
  @override
  @JsonKey()
  List<String> get words {
    if (_words is EqualUnmodifiableListView) return _words;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_words);
  }

  @override
  final String curPlayerId;

  @override
  String toString() {
    return 'GameModel(id: $id, name: $name, playersCount: $playersCount, duration: $duration, players: $players, words: $words, curPlayerId: $curPlayerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.playersCount, playersCount) || other.playersCount == playersCount) &&
            (identical(other.duration, duration) || other.duration == duration) &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            const DeepCollectionEquality().equals(other._words, _words) &&
            (identical(other.curPlayerId, curPlayerId) || other.curPlayerId == curPlayerId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, playersCount, duration, const DeepCollectionEquality().hash(_players),
      const DeepCollectionEquality().hash(_words), curPlayerId);

  /// Create a copy of GameModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameModelImplCopyWith<_$GameModelImpl> get copyWith => __$$GameModelImplCopyWithImpl<_$GameModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameModelImplToJson(
      this,
    );
  }
}

abstract class _GameModel implements GameModel {
  const factory _GameModel(
      {required final String id,
      required final String name,
      required final int playersCount,
      required final int duration,
      final List<UserModel> players,
      final List<String> words,
      required final String curPlayerId}) = _$GameModelImpl;

  factory _GameModel.fromJson(Map<String, dynamic> json) = _$GameModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get playersCount;
  @override
  int get duration;
  @override
  List<UserModel> get players;
  @override
  List<String> get words;
  @override
  String get curPlayerId;

  /// Create a copy of GameModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameModelImplCopyWith<_$GameModelImpl> get copyWith => throw _privateConstructorUsedError;
}
