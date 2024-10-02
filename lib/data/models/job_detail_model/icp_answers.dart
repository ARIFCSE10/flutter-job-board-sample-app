import 'package:freezed_annotation/freezed_annotation.dart';

import 'commission_offered.dart';
import 'job_role.dart';
import 'type_of_sale.dart';

part 'icp_answers.freezed.dart';
part 'icp_answers.g.dart';

@freezed
class IcpAnswers with _$IcpAnswers {
  factory IcpAnswers({
    @JsonKey(name: 'job-role') List<JobRole>? jobRole,
    @JsonKey(name: 'type-of-sales') List<TypeOfSale>? typeOfSales,
    @JsonKey(name: 'commission-offered') CommissionOffered? commissionOffered,
    @JsonKey(name: 'relocation-allowance') bool? relocationAllowance,
  }) = _IcpAnswers;

  factory IcpAnswers.fromJson(Map<String, dynamic> json) =>
      _$IcpAnswersFromJson(json);
}
