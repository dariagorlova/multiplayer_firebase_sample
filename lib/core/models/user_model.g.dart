// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) => _$UserModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      errorCount: (json['errorCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'errorCount': instance.errorCount,
    };
