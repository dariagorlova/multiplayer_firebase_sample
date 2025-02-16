// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActiveGameModelImpl _$$ActiveGameModelImplFromJson(Map<String, dynamic> json) => _$ActiveGameModelImpl(
      gameName: json['game_name'] as String,
      playersCount: (json['players'] as num).toInt(),
      ownerId: json['owner_id'] as String,
      ownerName: json['owner_name'] as String,
      playersIn: (json['players_in'] as List<dynamic>).map((e) => e as String).toList(),
      durationSec: (json['duration'] as num).toInt(),
    );

Map<String, dynamic> _$$ActiveGameModelImplToJson(_$ActiveGameModelImpl instance) => <String, dynamic>{
      'game_name': instance.gameName,
      'players': instance.playersCount,
      'owner_id': instance.ownerId,
      'owner_name': instance.ownerName,
      'players_in': instance.playersIn,
      'duration': instance.durationSec,
    };
