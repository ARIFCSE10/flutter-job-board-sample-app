part of 'job_list_bloc.dart';

abstract class JobListEvent extends Equatable {
  const JobListEvent();

  @override
  List<Object> get props => [];
}

class LoadJobList extends JobListEvent {}
