import 'package:freezed_annotation/freezed_annotation.dart';

part 'workplace_preference.freezed.dart';
part 'workplace_preference.g.dart';

@freezed
class WorkplacePreference with _$WorkplacePreference {
  factory WorkplacePreference({
    int? id,
    @JsonKey(name: 'name_ar') String? nameAr,
    @JsonKey(name: 'name_en') String? nameEn,
  }) = _WorkplacePreference;

  factory WorkplacePreference.fromJson(Map<String, dynamic> json) =>
      _$WorkplacePreferenceFromJson(json);
}
