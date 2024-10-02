import 'package:flutter/material.dart';
import 'package:job_board/core/const/K.dart';
import 'package:job_board/core/theme/app_theme.dart';

class JobTagWidget extends StatelessWidget {
  final String tag;

  const JobTagWidget({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: K.mediumPadding, vertical: K.smallPadding),
      decoration: BoxDecoration(
        color: const Color(0xFFF0EAF2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        tag,
        style: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(color: AppTheme.primaryColor),
      ),
    );
  }
}
