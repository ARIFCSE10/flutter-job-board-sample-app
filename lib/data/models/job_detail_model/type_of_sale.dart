import 'package:freezed_annotation/freezed_annotation.dart';

part 'type_of_sale.freezed.dart';
part 'type_of_sale.g.dart';

@freezed
class TypeOfSale with _$TypeOfSale {
  factory TypeOfSale({
    int? id,
    @JsonKey(name: 'title_ar') String? titleAr,
    @JsonKey(name: 'title_en') String? titleEn,
    @JsonKey(name: 'next_question') List<String>? nextQuestion,
    @JsonKey(name: 'description_ar') String? descriptionAr,
    @JsonKey(name: 'description_en') String? descriptionEn,
  }) = _TypeOfSale;

  factory TypeOfSale.fromJson(Map<String, dynamic> json) =>
      _$TypeOfSaleFromJson(json);
}
