import 'package:freezed_annotation/freezed_annotation.dart';

part 'type.freezed.dart';
part 'type.g.dart';

@freezed
class Type with _$Type {
  factory Type({
    int? id,
    @JsonKey(name: 'name_ar') String? nameAr,
    @JsonKey(name: 'name_en') String? nameEn,
    int? order,
  }) = _Type;

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);
}
