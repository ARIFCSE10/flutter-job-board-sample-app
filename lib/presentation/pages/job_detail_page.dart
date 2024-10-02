import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_board/core/const/K.dart';
import 'package:job_board/core/theme/app_theme.dart';
import 'package:job_board/domain/entities/job_detail.dart';
import 'package:job_board/injection_container.dart';
import 'package:job_board/presentation/widgets/job_tag_widget.dart';

import '../bloc/job_detail/job_detail_bloc.dart';

class JobDetailPage extends StatelessWidget {
  final String jobId;

  const JobDetailPage({super.key, required this.jobId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JobDetailBloc(getJobDetails: sl(), jobId: jobId)
        ..add(LoadJobDetail()),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ),
          ],
        ),
        body: BlocBuilder<JobDetailBloc, JobDetailState>(
          builder: (context, state) {
            if (state is JobDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is JobDetailLoaded) {
              final JobDetailEntity job = state.job;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: K.contentPadding, vertical: K.xlargePadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _companyProfile(context, job.companyName, job.companyLogo,
                          job.companyType),
                      K.space24,
                      _jobSummary(context, job.jobTitle, job.jobType,
                          job.location, job.workplaceType, job.tags),
                      K.space24,
                      _jobDescription(context, job.jobDescription),
                      K.space24,
                      _jobResponsibilities(context, job.responsibilities),
                    ],
                  ),
                ),
              );
            } else if (state is JobDetailError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text('Job details not found'));
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(K.xlargePadding),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text('Apply'),
          ),
        ),
      ),
    );
  }

  Widget _companyProfile(BuildContext context, String companyName,
      String companyLogo, String companyDescription) {
    return Column(children: [
      Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(K.borderRadius),
              image: DecorationImage(
                image: NetworkImage(companyLogo),
              ),
            ),
          ),
          K.space8,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                companyName,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              K.space2,
              Text(
                companyDescription,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: AppTheme.labelColor2),
              ),
            ],
          ),
        ],
      ),
    ]);
  }

  Widget _jobDescription(BuildContext context, String jobDescription) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Job Description',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        K.space8,
        Text(
          jobDescription,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppTheme.labelColor3,
              ),
        ),
      ],
    );
  }

  Widget _jobResponsibilities(
      BuildContext context, List<String> jobResponsibilities) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Key Responsibilities',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          K.space8,
          Text(
            jobResponsibilities.map((e) => '- $e').join('\n'),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.labelColor3,
                ),
          ),
        ]);
  }

  Widget _jobSummary(BuildContext context, String jobTitle, String jobType,
      String location, String workplaceType, List<String> tags) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            jobTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          K.space2,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '$location . $workplaceType . $jobType',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: AppTheme.labelColor2),
              ),
            ],
          ),
          K.space8,
          Wrap(
            spacing: K.largePadding,
            runSpacing: K.mediumPadding,
            direction: Axis.horizontal,
            children: tags.map((tag) => JobTagWidget(tag: tag)).toList(),
          ),
        ]);
  }
}
