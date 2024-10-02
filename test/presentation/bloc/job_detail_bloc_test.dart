import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job_board/core/error/failures.dart';
import 'package:job_board/domain/entities/job_detail.dart';
import 'package:job_board/domain/usecases/get_job_details.dart';
import 'package:job_board/presentation/bloc/job_detail/job_detail_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'job_detail_bloc_test.mocks.dart';

@GenerateMocks([GetJobDetails])
void main() {
  late JobDetailBloc bloc;
  late MockGetJobDetails mockGetJobDetails;

  setUp(() {
    mockGetJobDetails = MockGetJobDetails();
    bloc = JobDetailBloc(getJobDetails: mockGetJobDetails, jobId: '1');
  });

  test('initialState should be JobDetailInitial', () {
    // assert
    expect(bloc.state, equals(JobDetailInitial()));
  });

  group('LoadJobDetail', () {
    final tJobDetail = JobDetailEntity(
      id: '1',
      jobTitle: 'Software Developer',
      companyName: 'Tech Co',
      location: 'New York',
      jobType: 'Full-time',
      companyLogo: 'https://example.com/logo.png',
      jobDescription: 'Job description here',
      responsibilities: ['Requirement 1', 'Requirement 2'],
      companyType: 'Company Type',
      tags: ['Tag 1', 'Tag 2'],
      workplaceType: 'Workplace Type',
    );
    test('should get data from the GetJobDetails use case', () async {
      // arrange
      when(mockGetJobDetails(any)).thenAnswer((_) async => Right(tJobDetail));
      // act
      bloc.add(LoadJobDetail());
      await untilCalled(mockGetJobDetails(any));
      // assert
      verify(mockGetJobDetails('1'));
    });

    test('should emit [Loading, Loaded] when data is gotten successfully',
        () async {
      // arrange
      when(mockGetJobDetails(any)).thenAnswer((_) async => Right(tJobDetail));
      // assert later
      final expected = [
        JobDetailLoading(),
        JobDetailLoaded(tJobDetail),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(LoadJobDetail());
    });

    test('should emit [Loading, Error] when getting data fails', () async {
      // arrange
      when(mockGetJobDetails(any))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      // assert later
      final expected = [
        JobDetailLoading(),
        const JobDetailError('Server Failure'),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(LoadJobDetail());
    });
  });
}
