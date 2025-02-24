// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AiModelImpl _$$AiModelImplFromJson(Map<String, dynamic> json) => _$AiModelImpl(
      word: json['word'] as String,
      exists: json['exist'] as bool,
      noun: json['noun'] as bool,
      name: json['name'] as bool,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$$AiModelImplToJson(_$AiModelImpl instance) => <String, dynamic>{
      'word': instance.word,
      'exist': instance.exists,
      'noun': instance.noun,
      'name': instance.name,
      'reason': instance.reason,
    };
