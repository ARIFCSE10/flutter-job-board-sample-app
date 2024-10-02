part of 'job_list_bloc.dart';

class JobListError extends JobListState {
  final String message;

  const JobListError(this.message);

  @override
  List<Object> get props => [message];
}

class JobListInitial extends JobListState {}

class JobListLoaded extends JobListState {
  final List<JobEntity> jobs;

  const JobListLoaded(this.jobs);

  @override
  List<Object> get props => [jobs];
}

class JobListLoading extends JobListState {}

abstract class JobListState extends Equatable {
  const JobListState();

  @override
  List<Object> get props => [];
}
