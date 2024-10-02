import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockito/annotations.dart';

import '../../../domain/entities/job_detail.dart';
import '../../../domain/usecases/get_job_details.dart';

part 'job_detail_event.dart';
part 'job_detail_state.dart';

@GenerateMocks([GetJobDetails])
class JobDetailBloc extends Bloc<JobDetailEvent, JobDetailState> {
  final GetJobDetails getJobDetails;
  final String jobId;

  JobDetailBloc({required this.getJobDetails, required this.jobId})
      : super(JobDetailInitial()) {
    on<LoadJobDetail>((event, emit) async {
      emit(JobDetailLoading());
      final result = await getJobDetails(jobId);
      result.fold(
        (failure) => emit(JobDetailError(failure.message)),
        (job) => emit(JobDetailLoaded(job)),
      );
    });
  }
}
