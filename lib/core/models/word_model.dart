import 'package:freezed_annotation/freezed_annotation.dart';

import '../index.dart';

part 'word_model.freezed.dart';
part 'word_model.g.dart';

@freezed
class WordModel with _$WordModel {
  const factory WordModel({
    @JsonKey(name: FirebaseConsts.word) required String word,
    @JsonKey(name: FirebaseConsts.userNameField) required String userName,
  }) = _WordModel;

  factory WordModel.fromJson(Map<String, dynamic> json) => _$WordModelFromJson(json);
}
