import 'package:dartz/dartz.dart';
import 'package:job_board/domain/entities/job.dart';

import '../../core/error/failures.dart';
import '../entities/job_detail.dart';

abstract class JobRepository {
  Future<Either<Failure, JobDetailEntity>> getJobDetails(String id);
  Future<Either<Failure, List<JobEntity>>> getJobs();
}
