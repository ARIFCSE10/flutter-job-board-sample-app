import 'package:freezed_annotation/freezed_annotation.dart';

part 'commission_offered.freezed.dart';
part 'commission_offered.g.dart';

@freezed
class CommissionOffered with _$CommissionOffered {
  factory CommissionOffered({
    int? id,
    @JsonKey(name: 'name_ar') String? nameAr,
    @JsonKey(name: 'name_en') String? nameEn,
  }) = _CommissionOffered;

  factory CommissionOffered.fromJson(Map<String, dynamic> json) =>
      _$CommissionOfferedFromJson(json);
}
