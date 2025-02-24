import 'package:freezed_annotation/freezed_annotation.dart';

import '../index.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: FirebaseConsts.idField) required String id,
    @JsonKey(name: FirebaseConsts.userNameField) required String name,
    @JsonKey(name: FirebaseConsts.errorCount) @Default(0) int errorCount,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
