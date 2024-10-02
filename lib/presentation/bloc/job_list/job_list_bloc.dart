import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_board/domain/entities/job.dart';

import '../../../domain/usecases/get_job_list.dart';

part 'job_list_event.dart';
part 'job_list_state.dart';

class JobListBloc extends Bloc<JobListEvent, JobListState> {
  final GetJobList getJobList;

  JobListBloc({required this.getJobList}) : super(JobListInitial()) {
    on<LoadJobList>((event, emit) async {
      emit(JobListLoading());
      final result = await getJobList();
      result.fold(
        (failure) => emit(JobListError(failure.message)),
        (jobs) => emit(JobListLoaded(jobs)),
      );
    });
  }
}
