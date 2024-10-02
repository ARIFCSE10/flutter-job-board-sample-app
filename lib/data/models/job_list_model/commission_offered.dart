import 'package:freezed_annotation/freezed_annotation.dart';

part 'commission_offered.freezed.dart';
part 'commission_offered.g.dart';

@freezed
class CommissionOffered with _$CommissionOffered {
  factory CommissionOffered({
    int? id,
    @JsonKey(name: 'title_ar') String? titleAr,
    @JsonKey(name: 'title_en') String? titleEn,
  }) = _CommissionOffered;

  factory CommissionOffered.fromJson(Map<String, dynamic> json) =>
      _$CommissionOfferedFromJson(json);
}
