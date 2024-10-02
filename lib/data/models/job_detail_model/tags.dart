import 'package:freezed_annotation/freezed_annotation.dart';

import 'job_role.dart';
import 'type_of_sale.dart';

part 'tags.freezed.dart';
part 'tags.g.dart';

@freezed
class Tags with _$Tags {
  factory Tags({
    @JsonKey(name: 'job-role') List<JobRole>? jobRole,
    @JsonKey(name: 'type-of-sales') List<TypeOfSale>? typeOfSales,
  }) = _Tags;

  factory Tags.fromJson(Map<String, dynamic> json) => _$TagsFromJson(json);
}
