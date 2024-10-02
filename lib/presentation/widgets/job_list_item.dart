import 'package:flutter/material.dart';
import 'package:job_board/core/const/K.dart';
import 'package:job_board/core/theme/app_theme.dart';
import 'package:job_board/core/utils/time_util.dart';
import 'package:job_board/domain/entities/job.dart';

class JobListItem extends StatelessWidget {
  final JobEntity job;
  final VoidCallback onTap;

  const JobListItem({super.key, required this.job, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(K.borderRadius),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppTheme.borderColor),
          borderRadius: BorderRadius.circular(K.borderRadius),
        ),
        padding: const EdgeInsets.all(K.xlargePadding),
        child: Column(children: [
          Row(
            children: [
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(K.borderRadius),
                  image: DecorationImage(
                    image: NetworkImage(job.logo),
                  ),
                ),
              ),
              K.space8,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    job.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    job.company,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    '${job.location} • ${job.type}',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ],
          ),
          K.space16,
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              job.postedTime?.timeAgo() ?? '--',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ]),
      ),
    );
  }
}
