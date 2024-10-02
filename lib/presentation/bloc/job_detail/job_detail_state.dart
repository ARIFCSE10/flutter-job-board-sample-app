part of 'job_detail_bloc.dart';

class JobDetailError extends JobDetailState {
  final String message;

  const JobDetailError(this.message);

  @override
  List<Object> get props => [message];
}

class JobDetailInitial extends JobDetailState {}

class JobDetailLoaded extends JobDetailState {
  final JobDetailEntity job;

  const JobDetailLoaded(this.job);

  @override
  List<Object> get props => [job];
}

class JobDetailLoading extends JobDetailState {}

abstract class JobDetailState extends Equatable {
  const JobDetailState();

  @override
  List<Object> get props => [];
}
