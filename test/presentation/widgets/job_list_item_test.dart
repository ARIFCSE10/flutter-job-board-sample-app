import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job_board/domain/entities/job.dart';
import 'package:job_board/presentation/widgets/job_list_item.dart';

void main() {
  testWidgets('JobListItem displays correct job information',
      (WidgetTester tester) async {
    final job = JobEntity(
      id: '1',
      title: 'Software Developer',
      company: 'Tech Co',
      location: 'New York',
      type: 'Full-time',
      postedTime: DateTime.now().subtract(const Duration(days: 2)),
      logo: '',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: JobListItem(job: job, onTap: () {}),
        ),
      ),
    );

    // Verify that the job title is displayed
    expect(find.text('Software Developer'), findsOneWidget);

    // Verify that the company name is displayed
    expect(find.text('Tech Co'), findsOneWidget);

    // Verify that the location is displayed
    expect(find.text('New York • Full-time'), findsOneWidget);

    // Verify that the posted date is displayed (as "2 days ago")
    expect(find.text('2 days ago'), findsOneWidget);
  });
}
