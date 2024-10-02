import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:job_board/data/datasources/job_data_source.dart';
import 'package:job_board/data/models/job_detail_model/job_detail_model.dart';
import 'package:job_board/data/models/job_list_model/job_list_model.dart';

class JobRemoteDataSource extends JobDataSource {
  @override
  Future<JobDetailModel> getJobDetails(String id) async {
    final response = await http.get(
        Uri.parse('https://mpa0771a40ef48fcdfb7.free.beeceptor.com/jobs/$id'));
    if (response.statusCode == 200) {
      return JobDetailModel.fromJson(jsonDecode(response.body)['data']);
    } else {
      throw Exception('Failed to load job details');
    }
  }

  @override
  Future<JobListModel> getJobs() async {
    final response = await http
        .get(Uri.parse('https://mpa0771a40ef48fcdfb7.free.beeceptor.com/jobs'));
    if (response.statusCode == 200) {
      return JobListModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load jobs');
    }
  }
}
