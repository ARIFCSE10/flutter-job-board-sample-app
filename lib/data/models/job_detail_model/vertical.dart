import 'package:freezed_annotation/freezed_annotation.dart';

part 'vertical.freezed.dart';
part 'vertical.g.dart';

@freezed
class Vertical with _$Vertical {
  factory Vertical({
    int? id,
    @JsonKey(name: 'name_ar') String? nameAr,
    @JsonKey(name: 'name_en') String? nameEn,
  }) = _Vertical;

  factory Vertical.fromJson(Map<String, dynamic> json) =>
      _$VerticalFromJson(json);
}
