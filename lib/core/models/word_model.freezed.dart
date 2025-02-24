// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WordModel _$WordModelFromJson(Map<String, dynamic> json) {
  return _WordModel.fromJson(json);
}

/// @nodoc
mixin _$WordModel {
  @JsonKey(name: FirebaseConsts.word)
  String get word => throw _privateConstructorUsedError;
  @JsonKey(name: FirebaseConsts.userNameField)
  String get userName => throw _privateConstructorUsedError;

  /// Serializes this WordModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordModelCopyWith<WordModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordModelCopyWith<$Res> {
  factory $WordModelCopyWith(WordModel value, $Res Function(WordModel) then) = _$WordModelCopyWithImpl<$Res, WordModel>;
  @useResult
  $Res call({@JsonKey(name: FirebaseConsts.word) String word, @JsonKey(name: FirebaseConsts.userNameField) String userName});
}

/// @nodoc
class _$WordModelCopyWithImpl<$Res, $Val extends WordModel> implements $WordModelCopyWith<$Res> {
  _$WordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? userName = null,
  }) {
    return _then(_value.copyWith(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WordModelImplCopyWith<$Res> implements $WordModelCopyWith<$Res> {
  factory _$$WordModelImplCopyWith(_$WordModelImpl value, $Res Function(_$WordModelImpl) then) = __$$WordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: FirebaseConsts.word) String word, @JsonKey(name: FirebaseConsts.userNameField) String userName});
}

/// @nodoc
class __$$WordModelImplCopyWithImpl<$Res> extends _$WordModelCopyWithImpl<$Res, _$WordModelImpl> implements _$$WordModelImplCopyWith<$Res> {
  __$$WordModelImplCopyWithImpl(_$WordModelImpl _value, $Res Function(_$WordModelImpl) _then) : super(_value, _then);

  /// Create a copy of WordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? userName = null,
  }) {
    return _then(_$WordModelImpl(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WordModelImpl implements _WordModel {
  const _$WordModelImpl(
      {@JsonKey(name: FirebaseConsts.word) required this.word, @JsonKey(name: FirebaseConsts.userNameField) required this.userName});

  factory _$WordModelImpl.fromJson(Map<String, dynamic> json) => _$$WordModelImplFromJson(json);

  @override
  @JsonKey(name: FirebaseConsts.word)
  final String word;
  @override
  @JsonKey(name: FirebaseConsts.userNameField)
  final String userName;

  @override
  String toString() {
    return 'WordModel(word: $word, userName: $userName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordModelImpl &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.userName, userName) || other.userName == userName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, word, userName);

  /// Create a copy of WordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WordModelImplCopyWith<_$WordModelImpl> get copyWith => __$$WordModelImplCopyWithImpl<_$WordModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WordModelImplToJson(
      this,
    );
  }
}

abstract class _WordModel implements WordModel {
  const factory _WordModel(
      {@JsonKey(name: FirebaseConsts.word) required final String word,
      @JsonKey(name: FirebaseConsts.userNameField) required final String userName}) = _$WordModelImpl;

  factory _WordModel.fromJson(Map<String, dynamic> json) = _$WordModelImpl.fromJson;

  @override
  @JsonKey(name: FirebaseConsts.word)
  String get word;
  @override
  @JsonKey(name: FirebaseConsts.userNameField)
  String get userName;

  /// Create a copy of WordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WordModelImplCopyWith<_$WordModelImpl> get copyWith => throw _privateConstructorUsedError;
}
