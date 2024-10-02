import 'package:get_it/get_it.dart';
import 'package:job_board/data/datasources/job_data_source.dart';
import 'package:job_board/data/datasources/job_remote_data_source.dart';

import 'data/repositories/job_repository_impl.dart';
import 'domain/repositories/job_repository.dart';
import 'domain/usecases/get_job_details.dart';
import 'domain/usecases/get_job_list.dart';
import 'presentation/bloc/job_detail/job_detail_bloc.dart';
import 'presentation/bloc/job_list/job_list_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => JobListBloc(getJobList: sl()));
  sl.registerFactoryParam<JobDetailBloc, String, void>(
    (jobId, _) => JobDetailBloc(getJobDetails: sl(), jobId: jobId),
  );

  // Use cases
  sl.registerLazySingleton(() => GetJobList(sl()));
  sl.registerLazySingleton(() => GetJobDetails(sl()));

  // Repository
  sl.registerLazySingleton<JobRepository>(
    () => JobRepositoryImpl(dataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<JobDataSource>(
    () => JobRemoteDataSource(),
  );
}
