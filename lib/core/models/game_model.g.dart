// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameModelImpl _$$GameModelImplFromJson(Map<String, dynamic> json) => _$GameModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      playersCount: (json['count'] as num).toInt(),
      duration: (json['duration'] as num).toInt(),
      players: (json['players'] as List<dynamic>?)?.map((e) => UserModel.fromJson(e as Map<String, dynamic>)).toList() ?? const [],
      words: (json['words'] as List<dynamic>?)?.map((e) => WordModel.fromJson(e as Map<String, dynamic>)).toList() ?? const [],
      curPlayerId: json['cid'] as String,
    );

Map<String, dynamic> _$$GameModelImplToJson(_$GameModelImpl instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'count': instance.playersCount,
      'duration': instance.duration,
      'players': instance.players.map((e) => e.toJson()).toList(),
      'words': instance.words.map((e) => e.toJson()).toList(),
      'cid': instance.curPlayerId,
    };
