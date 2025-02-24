import 'package:freezed_annotation/freezed_annotation.dart';

import '../index.dart';

part 'game_model.freezed.dart';
part 'game_model.g.dart';

@freezed
class GameModel with _$GameModel {
  const factory GameModel({
    @JsonKey(name: FirebaseConsts.idField) required String id,
    @JsonKey(name: FirebaseConsts.userNameField) required String name,
    @JsonKey(name: FirebaseConsts.count) required int playersCount,
    @JsonKey(name: FirebaseConsts.durationField) required int duration,
    @JsonKey(name: FirebaseConsts.playersField) @Default([]) List<UserModel> players,
    @JsonKey(name: FirebaseConsts.words) @Default([]) List<WordModel> words,
    @JsonKey(name: FirebaseConsts.curPlayerId) required String curPlayerId,
  }) = _GameModel;

  factory GameModel.fromJson(Map<String, dynamic> json) => _$GameModelFromJson(json);

  factory GameModel.empty() => const GameModel(id: "", name: "", playersCount: 5, duration: 0, curPlayerId: "");
}
