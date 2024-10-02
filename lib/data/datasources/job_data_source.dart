import 'package:job_board/data/models/job_detail_model/job_detail_model.dart';
import 'package:job_board/data/models/job_list_model/job_list_model.dart';

abstract class JobDataSource {
  Future<JobDetailModel> getJobDetails(String id);
  Future<JobListModel> getJobs();
}
