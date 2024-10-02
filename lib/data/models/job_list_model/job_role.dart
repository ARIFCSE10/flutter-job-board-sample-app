import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_role.freezed.dart';
part 'job_role.g.dart';

@freezed
class JobRole with _$JobRole {
  factory JobRole({
    int? id,
    @JsonKey(name: 'title_ar') String? titleAr,
    @JsonKey(name: 'title_en') String? titleEn,
    @JsonKey(name: 'next_question') List<String>? nextQuestion,
    @JsonKey(name: 'description_ar') String? descriptionAr,
    @JsonKey(name: 'description_en') String? descriptionEn,
  }) = _JobRole;

  factory JobRole.fromJson(Map<String, dynamic> json) =>
      _$JobRoleFromJson(json);
}
