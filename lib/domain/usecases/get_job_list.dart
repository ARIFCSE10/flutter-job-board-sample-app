import 'package:dartz/dartz.dart';
import 'package:job_board/domain/entities/job.dart';

import '../../core/error/failures.dart';
import '../repositories/job_repository.dart';

class GetJobList {
  final JobRepository repository;

  GetJobList(this.repository);

  Future<Either<Failure, List<JobEntity>>> call() async {
    return await repository.getJobs();
  }
}
