import 'package:freezed_annotation/freezed_annotation.dart';

part 'workplace_type.freezed.dart';
part 'workplace_type.g.dart';

@freezed
class WorkplaceType with _$WorkplaceType {
  factory WorkplaceType({
    int? id,
    @JsonKey(name: 'name_ar') String? nameAr,
    @JsonKey(name: 'name_en') String? nameEn,
  }) = _WorkplaceType;

  factory WorkplaceType.fromJson(Map<String, dynamic> json) =>
      _$WorkplaceTypeFromJson(json);
}
