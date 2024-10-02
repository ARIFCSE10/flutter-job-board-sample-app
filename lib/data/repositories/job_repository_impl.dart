import 'package:dartz/dartz.dart';
import 'package:job_board/data/datasources/job_data_source.dart';
import 'package:job_board/data/models/job_detail_model/job_detail_model.dart';
import 'package:job_board/data/models/job_list_model/job_list_model.dart';
import 'package:job_board/domain/entities/job.dart';

import '../../core/error/failures.dart';
import '../../domain/entities/job_detail.dart';
import '../../domain/repositories/job_repository.dart';

class JobRepositoryImpl implements JobRepository {
  final JobDataSource dataSource;

  JobRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, JobDetailEntity>> getJobDetails(String id) async {
    try {
      final jobDetail = await dataSource.getJobDetails(id);
      return Right(jobDetail.toEntity());
    } catch (e) {
      return Left(ServerFailure('Failed to get job details'));
    }
  }

  @override
  Future<Either<Failure, List<JobEntity>>> getJobs() async {
    try {
      final jobList = await dataSource.getJobs();
      return Right(jobList.toEntity());
    } catch (e) {
      return Left(ServerFailure('Failed to get jobs'));
    }
  }
}
