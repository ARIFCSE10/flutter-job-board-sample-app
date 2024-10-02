import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/job_detail.dart';
import '../repositories/job_repository.dart';

class GetJobDetails {
  final JobRepository repository;

  GetJobDetails(this.repository);

  Future<Either<Failure, JobDetailEntity>> call(String id) async {
    return await repository.getJobDetails(id);
  }
}
