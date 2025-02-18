// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameModelImpl _$$GameModelImplFromJson(Map<String, dynamic> json) => _$GameModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      playersCount: (json['playersCount'] as num).toInt(),
      duration: (json['duration'] as num).toInt(),
      players: (json['players'] as List<dynamic>?)?.map((e) => UserModel.fromJson(e as Map<String, dynamic>)).toList() ?? const [],
      words: (json['words'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
      curPlayerId: json['curPlayerId'] as String,
    );

Map<String, dynamic> _$$GameModelImplToJson(_$GameModelImpl instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'playersCount': instance.playersCount,
      'duration': instance.duration,
      'players': instance.players.map((e) => e.toJson()).toList(),
      'words': instance.words,
      'curPlayerId': instance.curPlayerId,
    };
