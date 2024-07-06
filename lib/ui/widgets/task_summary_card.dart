import 'package:flutter/material.dart';

class TaskSummaryCard extends StatelessWidget {
  const TaskSummaryCard({
    super.key,
    required this.title,
    required this.count,
  });

  final String title;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(count, style: Theme.of(context).textTheme.titleLarge),
            Text(title, style: Theme.of(context).textTheme.titleSmall)
          ],
        ),
      ),
    );
  }
}

Widget _buildSummarySection() {
  return const SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        TaskSummaryCard(
          title: 'New Task',
          count: '34',
        ),
        TaskSummaryCard(
          title: 'Completed',
          count: '34',
        ),
        TaskSummaryCard(
          title: 'In Progress',
          count: '34',
        ),
        TaskSummaryCard(
          title: 'Cancelled',
          count: '34',
        ),
      ],
    ),
  );
}
