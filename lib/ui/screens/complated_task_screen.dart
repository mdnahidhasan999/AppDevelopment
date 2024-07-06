import 'package:flutter/material.dart';

import '../widgets/task_item.dart';

class ComplatedTaskScreen extends StatefulWidget {
  const ComplatedTaskScreen({super.key});

  @override
  State<ComplatedTaskScreen> createState() => _ComplatedTaskScreenState();
}

class _ComplatedTaskScreenState extends State<ComplatedTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return const TaskItem();
        },
      ),
    );
  }
}
