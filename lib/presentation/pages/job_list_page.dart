import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_board/core/const/K.dart';

import '../bloc/job_list/job_list_bloc.dart';
import '../widgets/job_list_item.dart';
import 'job_detail_page.dart';

class JobListPage extends StatelessWidget {
  const JobListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jobs'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<JobListBloc, JobListState>(
        builder: (context, state) {
          if (state is JobListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is JobListLoaded) {
            return ListView.separated(
              itemCount: state.jobs.length,
              separatorBuilder: (context, index) =>
                  const SizedBox(height: K.xlargePadding),
              padding: const EdgeInsets.all(K.xlargePadding),
              itemBuilder: (context, index) {
                return JobListItem(
                  job: state.jobs[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            JobDetailPage(jobId: state.jobs[index].id),
                      ),
                    );
                  },
                );
              },
            );
          } else if (state is JobListError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('No jobs found'));
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.work_outline_rounded), label: 'Jobs'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded), label: 'Resume'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: 'Settings'),
        ],
      ),
    );
  }
}
