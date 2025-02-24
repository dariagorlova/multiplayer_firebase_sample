// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AiModel _$AiModelFromJson(Map<String, dynamic> json) {
  return _AiModel.fromJson(json);
}

/// @nodoc
mixin _$AiModel {
  @JsonKey(name: AiModelJsonConsts.word)
  String get word => throw _privateConstructorUsedError;
  @JsonKey(name: AiModelJsonConsts.exists)
  bool get exists => throw _privateConstructorUsedError;
  @JsonKey(name: AiModelJsonConsts.noun)
  bool get noun => throw _privateConstructorUsedError;
  @JsonKey(name: AiModelJsonConsts.name)
  bool get name => throw _privateConstructorUsedError;
  @JsonKey(name: AiModelJsonConsts.reason)
  String? get reason => throw _privateConstructorUsedError;

  /// Serializes this AiModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiModelCopyWith<AiModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiModelCopyWith<$Res> {
  factory $AiModelCopyWith(AiModel value, $Res Function(AiModel) then) = _$AiModelCopyWithImpl<$Res, AiModel>;
  @useResult
  $Res call(
      {@JsonKey(name: AiModelJsonConsts.word) String word,
      @JsonKey(name: AiModelJsonConsts.exists) bool exists,
      @JsonKey(name: AiModelJsonConsts.noun) bool noun,
      @JsonKey(name: AiModelJsonConsts.name) bool name,
      @JsonKey(name: AiModelJsonConsts.reason) String? reason});
}

/// @nodoc
class _$AiModelCopyWithImpl<$Res, $Val extends AiModel> implements $AiModelCopyWith<$Res> {
  _$AiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? exists = null,
    Object? noun = null,
    Object? name = null,
    Object? reason = freezed,
  }) {
    return _then(_value.copyWith(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      exists: null == exists
          ? _value.exists
          : exists // ignore: cast_nullable_to_non_nullable
              as bool,
      noun: null == noun
          ? _value.noun
          : noun // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as bool,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AiModelImplCopyWith<$Res> implements $AiModelCopyWith<$Res> {
  factory _$$AiModelImplCopyWith(_$AiModelImpl value, $Res Function(_$AiModelImpl) then) = __$$AiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: AiModelJsonConsts.word) String word,
      @JsonKey(name: AiModelJsonConsts.exists) bool exists,
      @JsonKey(name: AiModelJsonConsts.noun) bool noun,
      @JsonKey(name: AiModelJsonConsts.name) bool name,
      @JsonKey(name: AiModelJsonConsts.reason) String? reason});
}

/// @nodoc
class __$$AiModelImplCopyWithImpl<$Res> extends _$AiModelCopyWithImpl<$Res, _$AiModelImpl> implements _$$AiModelImplCopyWith<$Res> {
  __$$AiModelImplCopyWithImpl(_$AiModelImpl _value, $Res Function(_$AiModelImpl) _then) : super(_value, _then);

  /// Create a copy of AiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? exists = null,
    Object? noun = null,
    Object? name = null,
    Object? reason = freezed,
  }) {
    return _then(_$AiModelImpl(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      exists: null == exists
          ? _value.exists
          : exists // ignore: cast_nullable_to_non_nullable
              as bool,
      noun: null == noun
          ? _value.noun
          : noun // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as bool,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AiModelImpl implements _AiModel {
  const _$AiModelImpl(
      {@JsonKey(name: AiModelJsonConsts.word) required this.word,
      @JsonKey(name: AiModelJsonConsts.exists) required this.exists,
      @JsonKey(name: AiModelJsonConsts.noun) required this.noun,
      @JsonKey(name: AiModelJsonConsts.name) required this.name,
      @JsonKey(name: AiModelJsonConsts.reason) this.reason});

  factory _$AiModelImpl.fromJson(Map<String, dynamic> json) => _$$AiModelImplFromJson(json);

  @override
  @JsonKey(name: AiModelJsonConsts.word)
  final String word;
  @override
  @JsonKey(name: AiModelJsonConsts.exists)
  final bool exists;
  @override
  @JsonKey(name: AiModelJsonConsts.noun)
  final bool noun;
  @override
  @JsonKey(name: AiModelJsonConsts.name)
  final bool name;
  @override
  @JsonKey(name: AiModelJsonConsts.reason)
  final String? reason;

  @override
  String toString() {
    return 'AiModel(word: $word, exists: $exists, noun: $noun, name: $name, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiModelImpl &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.exists, exists) || other.exists == exists) &&
            (identical(other.noun, noun) || other.noun == noun) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, word, exists, noun, name, reason);

  /// Create a copy of AiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiModelImplCopyWith<_$AiModelImpl> get copyWith => __$$AiModelImplCopyWithImpl<_$AiModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AiModelImplToJson(
      this,
    );
  }
}

abstract class _AiModel implements AiModel {
  const factory _AiModel(
      {@JsonKey(name: AiModelJsonConsts.word) required final String word,
      @JsonKey(name: AiModelJsonConsts.exists) required final bool exists,
      @JsonKey(name: AiModelJsonConsts.noun) required final bool noun,
      @JsonKey(name: AiModelJsonConsts.name) required final bool name,
      @JsonKey(name: AiModelJsonConsts.reason) final String? reason}) = _$AiModelImpl;

  factory _AiModel.fromJson(Map<String, dynamic> json) = _$AiModelImpl.fromJson;

  @override
  @JsonKey(name: AiModelJsonConsts.word)
  String get word;
  @override
  @JsonKey(name: AiModelJsonConsts.exists)
  bool get exists;
  @override
  @JsonKey(name: AiModelJsonConsts.noun)
  bool get noun;
  @override
  @JsonKey(name: AiModelJsonConsts.name)
  bool get name;
  @override
  @JsonKey(name: AiModelJsonConsts.reason)
  String? get reason;

  /// Create a copy of AiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiModelImplCopyWith<_$AiModelImpl> get copyWith => throw _privateConstructorUsedError;
}
