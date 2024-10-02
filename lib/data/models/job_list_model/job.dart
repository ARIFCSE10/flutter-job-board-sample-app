import 'package:freezed_annotation/freezed_annotation.dart';

import 'company.dart';
import 'filters.dart';
import 'icp_answers.dart';
import 'location.dart';
import 'status.dart';
import 'type.dart';
import 'vertical.dart';
import 'workplace_preference.dart';
import 'workplace_type.dart';

part 'job.freezed.dart';
part 'job.g.dart';

@freezed
class Job with _$Job {
  factory Job({
    int? id,
    @JsonKey(name: 'created_date') DateTime? createdDate,
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
    @JsonKey(name: 'icp_answers') IcpAnswers? icpAnswers,
    String? uuid,
    String? title,
    @JsonKey(name: 'updated_date') DateTime? updatedDate,
    Filters? filters,
    @JsonKey(name: 'unique_token') String? uniqueToken,
    @JsonKey(name: 'created_source') String? createdSource,
    @JsonKey(name: 'is_curation_requested') bool? isCurationRequested,
    @JsonKey(name: 'curation_requested_date_time')
    DateTime? curationRequestedDateTime,
    @JsonKey(name: 'cancellation_reason') dynamic cancellationReason,
    @JsonKey(name: 'edit_attempts') int? editAttempts,
    @JsonKey(name: 'is_default') bool? isDefault,
    int? order,
    @JsonKey(name: 'job_bucket') dynamic jobBucket,
    @JsonKey(name: 'generic_candidate_applications')
    List<dynamic>? genericCandidateApplications,
  }) = _Job;

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);
}
