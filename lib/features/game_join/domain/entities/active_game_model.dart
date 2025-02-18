import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/index.dart';

part 'active_game_model.freezed.dart';
part 'active_game_model.g.dart';

@freezed
class ActiveGameModel with _$ActiveGameModel {
  const factory ActiveGameModel({
    @JsonKey(includeFromJson: false, includeToJson: false) String? id,
    @JsonKey(name: FirebaseConsts.gameNameField) required String gameName,
    @JsonKey(name: FirebaseConsts.playersField) required int playersCount,
    @JsonKey(name: FirebaseConsts.ownerIdField) required String ownerId,
    @JsonKey(name: FirebaseConsts.ownerNameField) required String ownerName,
    @JsonKey(name: FirebaseConsts.playersInField) required List<String> playersIn,
    @JsonKey(name: FirebaseConsts.durationField) required int durationSec,
  }) = _ActiveGameModel;

  factory ActiveGameModel.fromJson(Map<String, dynamic> json) => _$ActiveGameModelFromJson(json);
}
