import 'package:freezed_annotation/freezed_annotation.dart';

import '../../index.dart';

part 'ai_model.freezed.dart';
part 'ai_model.g.dart';

@freezed
class AiModel with _$AiModel {
  const factory AiModel({
    @JsonKey(name: AiModelJsonConsts.word) required String word,
    @JsonKey(name: AiModelJsonConsts.exists) required bool exists,
    @JsonKey(name: AiModelJsonConsts.noun) required bool noun,
    @JsonKey(name: AiModelJsonConsts.name) required bool name,
    @JsonKey(name: AiModelJsonConsts.reason) String? reason,
  }) = _AiModel;

  factory AiModel.fromJson(Map<String, dynamic> json) => _$AiModelFromJson(json);
}
