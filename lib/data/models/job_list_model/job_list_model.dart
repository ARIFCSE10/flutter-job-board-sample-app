import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:job_board/domain/entities/job.dart';

import 'datum.dart';

part 'job_list_model.freezed.dart';
part 'job_list_model.g.dart';

@freezed
class JobListModel with _$JobListModel {
  factory JobListModel({
    List<Datum>? data,
    int? count,
    @JsonKey(name: 'next_link') dynamic nextLink,
    @JsonKey(name: 'prev_link') dynamic prevLink,
  }) = _JobListModel;

  factory JobListModel.fromJson(Map<String, dynamic> json) =>
      _$JobListModelFromJson(json);
}

extension JobListModelX on JobListModel {
  List<JobEntity> toEntity() {
    List<JobEntity> jobEntities = [];
    for (Datum job in data ?? []) {
      if (job.job != null) {
        jobEntities.add(
          JobEntity(
            id: job.job!.uuid ?? '',
            title: job.job!.title ?? '',
            location: job.job!.location?.nameEn ?? '',
            type: job.job!.type?.nameEn ?? '',
            company: job.job!.company?.name ?? '',
            postedTime: job.job!.createdDate,
            logo: job.job!.company?.logo ?? '',
          ),
        );
      }
    }
    return jobEntities;
  }
}
