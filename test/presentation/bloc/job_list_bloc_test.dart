import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job_board/core/error/failures.dart';
import 'package:job_board/domain/entities/job.dart';
import 'package:job_board/domain/usecases/get_job_list.dart';
import 'package:job_board/presentation/bloc/job_list/job_list_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'job_list_bloc_test.mocks.dart';

@GenerateMocks([GetJobList])
void main() {
  late JobListBloc bloc;
  late MockGetJobList mockGetJobList;

  setUp(() {
    mockGetJobList = MockGetJobList();
    bloc = JobListBloc(getJobList: mockGetJobList);
  });

  test('initialState should be JobListInitial', () {
    // assert
    expect(bloc.state, equals(JobListInitial()));
  });

  group('LoadJobList', () {
    final tJobList = [
      JobEntity(
        id: '1',
        title: 'Software Developer',
        company: 'Tech Co',
        location: 'New York',
        type: 'Full-time',
        logo: 'https://example.com/logo.png',
        postedTime: DateTime.now(),
      ),
    ];

    test('should get data from the GetJobList use case', () async {
      // arrange
      when(mockGetJobList()).thenAnswer((_) async => Right(tJobList));
      // act
      bloc.add(LoadJobList());
      await untilCalled(mockGetJobList());
      // assert
      verify(mockGetJobList());
    });

    test('should emit [Loading, Loaded] when data is gotten successfully',
        () async {
      // arrange
      when(mockGetJobList()).thenAnswer((_) async => Right(tJobList));
      // assert later
      final expected = [
        JobListLoading(),
        JobListLoaded(tJobList),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(LoadJobList());
    });

    test('should emit [Loading, Error] when getting data fails', () async {
      // arrange
      when(mockGetJobList())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // assert later
      final expected = [
        JobListLoading(),
        const JobListError('Server Failure'),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(LoadJobList());
    });
  });
}
