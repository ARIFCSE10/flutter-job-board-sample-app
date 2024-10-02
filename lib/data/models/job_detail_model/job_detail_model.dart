import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:job_board/domain/entities/job_detail.dart';

import 'company.dart';
import 'description.dart';
import 'icp_answers.dart';
import 'location.dart';
import 'status.dart';
import 'tags.dart';
import 'type.dart';
import 'vertical.dart';
import 'workplace_preference.dart';
import 'workplace_type.dart';

part 'job_detail_model.freezed.dart';
part 'job_detail_model.g.dart';

@freezed
class JobDetailModel with _$JobDetailModel {
  factory JobDetailModel({
    int? id,
    @JsonKey(name: 'created_date') String? createdDate,
    @JsonKey(name: 'salary_range') List<int>? salaryRange,
    List<dynamic>? benefits,
    Location? location,
    @JsonKey(name: 'open_for_discussion') bool? openForDiscussion,
    @JsonKey(name: 'commission_based') bool? commissionBased,
    Type? type,
    Status? status,
    @JsonKey(name: 'workplace_preference')
    WorkplacePreference? workplacePreference,
    @JsonKey(name: 'workplace_type') WorkplaceType? workplaceType,
    Vertical? vertical,
    @JsonKey(name: 'is_predefined_list_set') bool? isPredefinedListSet,
    Company? company,
    dynamic isApplicationCanceled,
    @JsonKey(name: 'icp_answers') IcpAnswers? icpAnswers,
    Tags? tags,
    dynamic application,
    String? uuid,
    String? title,
    @JsonKey(name: 'updated_date') DateTime? updatedDate,
    Description? description,
    @JsonKey(name: 'unique_token') String? uniqueToken,
    @JsonKey(name: 'created_source') String? createdSource,
    @JsonKey(name: 'is_curation_requested') bool? isCurationRequested,
    @JsonKey(name: 'curation_requested_date_time')
    dynamic curationRequestedDateTime,
    @JsonKey(name: 'cancellation_reason') dynamic cancellationReason,
    @JsonKey(name: 'edit_attempts') int? editAttempts,
    @JsonKey(name: 'is_default') bool? isDefault,
    int? order,
    @JsonKey(name: 'job_bucket') int? jobBucket,
    @JsonKey(name: 'generic_candidate_applications')
    List<dynamic>? genericCandidateApplications,
  }) = _JobDetailModel;

  factory JobDetailModel.fromJson(Map<String, dynamic> json) =>
      _$JobDetailModelFromJson(json);
}

extension JobDetailModelX on JobDetailModel {
  JobDetailEntity toEntity() {
    return JobDetailEntity(
      id: uuid ?? '',
      jobTitle: title ?? '',
      jobDescription: icpAnswers?.jobRole
              ?.map((e) => e.descriptionEn ?? '')
              .toList()
              .join('\n') ??
          '',
      location: location?.nameEn ?? '',
      jobType: type?.nameEn ?? '',
      companyName: company?.name ?? '',
      companyLogo: company?.logo ?? '',
      companyType: company?.industry ?? '',
      responsibilities:
          icpAnswers?.jobRole?.map((e) => e.descriptionEn ?? '').toList() ?? [],
      tags: tags?.jobRole?.map((e) => e.titleEn ?? '').toList() ?? [],
      workplaceType: workplaceType?.nameEn ?? '',
    );
  }
}
