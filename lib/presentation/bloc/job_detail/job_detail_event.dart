part of 'job_detail_bloc.dart';

abstract class JobDetailEvent extends Equatable {
  const JobDetailEvent();

  @override
  List<Object> get props => [];
}

class LoadJobDetail extends JobDetailEvent {}
