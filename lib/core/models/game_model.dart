import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_model.dart';

part 'game_model.freezed.dart';
part 'game_model.g.dart';

@freezed
class GameModel with _$GameModel {
  const factory GameModel({
    required String id,
    required String name,
    required int playersCount,
    required int duration,
    @Default([]) List<UserModel> players,
    @Default([]) List<String> words,
    required String curPlayerId,
  }) = _GameModel;

  factory GameModel.fromJson(Map<String, dynamic> json) => _$GameModelFromJson(json);

  factory GameModel.empty() => const GameModel(id: "", name: "", playersCount: 5, duration: 0, curPlayerId: "");
}
