// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'active_game_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActiveGameModel _$ActiveGameModelFromJson(Map<String, dynamic> json) {
  return _ActiveGameModel.fromJson(json);
}

/// @nodoc
mixin _$ActiveGameModel {
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: FirebaseConsts.gameNameField)
  String get gameName => throw _privateConstructorUsedError;
  @JsonKey(name: FirebaseConsts.playersField)
  int get playersCount => throw _privateConstructorUsedError;
  @JsonKey(name: FirebaseConsts.ownerIdField)
  String get ownerId => throw _privateConstructorUsedError;
  @JsonKey(name: FirebaseConsts.ownerNameField)
  String get ownerName => throw _privateConstructorUsedError;
  @JsonKey(name: FirebaseConsts.playersInField)
  List<String> get playersIn => throw _privateConstructorUsedError;
  @JsonKey(name: FirebaseConsts.durationField)
  int get durationSec => throw _privateConstructorUsedError;

  /// Serializes this ActiveGameModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActiveGameModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActiveGameModelCopyWith<ActiveGameModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActiveGameModelCopyWith<$Res> {
  factory $ActiveGameModelCopyWith(ActiveGameModel value, $Res Function(ActiveGameModel) then) = _$ActiveGameModelCopyWithImpl<$Res, ActiveGameModel>;
  @useResult
  $Res call(
      {@JsonKey(includeFromJson: false, includeToJson: false) String? id,
      @JsonKey(name: FirebaseConsts.gameNameField) String gameName,
      @JsonKey(name: FirebaseConsts.playersField) int playersCount,
      @JsonKey(name: FirebaseConsts.ownerIdField) String ownerId,
      @JsonKey(name: FirebaseConsts.ownerNameField) String ownerName,
      @JsonKey(name: FirebaseConsts.playersInField) List<String> playersIn,
      @JsonKey(name: FirebaseConsts.durationField) int durationSec});
}

/// @nodoc
class _$ActiveGameModelCopyWithImpl<$Res, $Val extends ActiveGameModel> implements $ActiveGameModelCopyWith<$Res> {
  _$ActiveGameModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActiveGameModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? gameName = null,
    Object? playersCount = null,
    Object? ownerId = null,
    Object? ownerName = null,
    Object? playersIn = null,
    Object? durationSec = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      gameName: null == gameName
          ? _value.gameName
          : gameName // ignore: cast_nullable_to_non_nullable
              as String,
      playersCount: null == playersCount
          ? _value.playersCount
          : playersCount // ignore: cast_nullable_to_non_nullable
              as int,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      ownerName: null == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String,
      playersIn: null == playersIn
          ? _value.playersIn
          : playersIn // ignore: cast_nullable_to_non_nullable
              as List<String>,
      durationSec: null == durationSec
          ? _value.durationSec
          : durationSec // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActiveGameModelImplCopyWith<$Res> implements $ActiveGameModelCopyWith<$Res> {
  factory _$$ActiveGameModelImplCopyWith(_$ActiveGameModelImpl value, $Res Function(_$ActiveGameModelImpl) then) =
      __$$ActiveGameModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeFromJson: false, includeToJson: false) String? id,
      @JsonKey(name: FirebaseConsts.gameNameField) String gameName,
      @JsonKey(name: FirebaseConsts.playersField) int playersCount,
      @JsonKey(name: FirebaseConsts.ownerIdField) String ownerId,
      @JsonKey(name: FirebaseConsts.ownerNameField) String ownerName,
      @JsonKey(name: FirebaseConsts.playersInField) List<String> playersIn,
      @JsonKey(name: FirebaseConsts.durationField) int durationSec});
}

/// @nodoc
class __$$ActiveGameModelImplCopyWithImpl<$Res> extends _$ActiveGameModelCopyWithImpl<$Res, _$ActiveGameModelImpl>
    implements _$$ActiveGameModelImplCopyWith<$Res> {
  __$$ActiveGameModelImplCopyWithImpl(_$ActiveGameModelImpl _value, $Res Function(_$ActiveGameModelImpl) _then) : super(_value, _then);

  /// Create a copy of ActiveGameModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? gameName = null,
    Object? playersCount = null,
    Object? ownerId = null,
    Object? ownerName = null,
    Object? playersIn = null,
    Object? durationSec = null,
  }) {
    return _then(_$ActiveGameModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      gameName: null == gameName
          ? _value.gameName
          : gameName // ignore: cast_nullable_to_non_nullable
              as String,
      playersCount: null == playersCount
          ? _value.playersCount
          : playersCount // ignore: cast_nullable_to_non_nullable
              as int,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      ownerName: null == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String,
      playersIn: null == playersIn
          ? _value._playersIn
          : playersIn // ignore: cast_nullable_to_non_nullable
              as List<String>,
      durationSec: null == durationSec
          ? _value.durationSec
          : durationSec // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActiveGameModelImpl implements _ActiveGameModel {
  const _$ActiveGameModelImpl(
      {@JsonKey(includeFromJson: false, includeToJson: false) this.id,
      @JsonKey(name: FirebaseConsts.gameNameField) required this.gameName,
      @JsonKey(name: FirebaseConsts.playersField) required this.playersCount,
      @JsonKey(name: FirebaseConsts.ownerIdField) required this.ownerId,
      @JsonKey(name: FirebaseConsts.ownerNameField) required this.ownerName,
      @JsonKey(name: FirebaseConsts.playersInField) required final List<String> playersIn,
      @JsonKey(name: FirebaseConsts.durationField) required this.durationSec})
      : _playersIn = playersIn;

  factory _$ActiveGameModelImpl.fromJson(Map<String, dynamic> json) => _$$ActiveGameModelImplFromJson(json);

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? id;
  @override
  @JsonKey(name: FirebaseConsts.gameNameField)
  final String gameName;
  @override
  @JsonKey(name: FirebaseConsts.playersField)
  final int playersCount;
  @override
  @JsonKey(name: FirebaseConsts.ownerIdField)
  final String ownerId;
  @override
  @JsonKey(name: FirebaseConsts.ownerNameField)
  final String ownerName;
  final List<String> _playersIn;
  @override
  @JsonKey(name: FirebaseConsts.playersInField)
  List<String> get playersIn {
    if (_playersIn is EqualUnmodifiableListView) return _playersIn;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playersIn);
  }

  @override
  @JsonKey(name: FirebaseConsts.durationField)
  final int durationSec;

  @override
  String toString() {
    return 'ActiveGameModel(id: $id, gameName: $gameName, playersCount: $playersCount, ownerId: $ownerId, ownerName: $ownerName, playersIn: $playersIn, durationSec: $durationSec)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActiveGameModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.gameName, gameName) || other.gameName == gameName) &&
            (identical(other.playersCount, playersCount) || other.playersCount == playersCount) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.ownerName, ownerName) || other.ownerName == ownerName) &&
            const DeepCollectionEquality().equals(other._playersIn, _playersIn) &&
            (identical(other.durationSec, durationSec) || other.durationSec == durationSec));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, gameName, playersCount, ownerId, ownerName, const DeepCollectionEquality().hash(_playersIn), durationSec);

  /// Create a copy of ActiveGameModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActiveGameModelImplCopyWith<_$ActiveGameModelImpl> get copyWith => __$$ActiveGameModelImplCopyWithImpl<_$ActiveGameModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActiveGameModelImplToJson(
      this,
    );
  }
}

abstract class _ActiveGameModel implements ActiveGameModel {
  const factory _ActiveGameModel(
      {@JsonKey(includeFromJson: false, includeToJson: false) final String? id,
      @JsonKey(name: FirebaseConsts.gameNameField) required final String gameName,
      @JsonKey(name: FirebaseConsts.playersField) required final int playersCount,
      @JsonKey(name: FirebaseConsts.ownerIdField) required final String ownerId,
      @JsonKey(name: FirebaseConsts.ownerNameField) required final String ownerName,
      @JsonKey(name: FirebaseConsts.playersInField) required final List<String> playersIn,
      @JsonKey(name: FirebaseConsts.durationField) required final int durationSec}) = _$ActiveGameModelImpl;

  factory _ActiveGameModel.fromJson(Map<String, dynamic> json) = _$ActiveGameModelImpl.fromJson;

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get id;
  @override
  @JsonKey(name: FirebaseConsts.gameNameField)
  String get gameName;
  @override
  @JsonKey(name: FirebaseConsts.playersField)
  int get playersCount;
  @override
  @JsonKey(name: FirebaseConsts.ownerIdField)
  String get ownerId;
  @override
  @JsonKey(name: FirebaseConsts.ownerNameField)
  String get ownerName;
  @override
  @JsonKey(name: FirebaseConsts.playersInField)
  List<String> get playersIn;
  @override
  @JsonKey(name: FirebaseConsts.durationField)
  int get durationSec;

  /// Create a copy of ActiveGameModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActiveGameModelImplCopyWith<_$ActiveGameModelImpl> get copyWith => throw _privateConstructorUsedError;
}
