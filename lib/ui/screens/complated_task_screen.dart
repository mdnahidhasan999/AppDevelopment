import 'package:flutter/material.dart';
import 'package:practiceapp/ui/widgets/centered_progress_indicator.dart';

import '../../data/models/network_response.dart';
import '../../data/models/task_list_wrapper_model.dart';
import '../../data/models/task_model.dart';
import '../../data/network_caller/network_caller.dart';
import '../../data/utilities/urls.dart';
import '../widgets/snack_bar_messages.dart';
import '../widgets/task_item.dart';

class ComplatedTaskScreen extends StatefulWidget {
  const ComplatedTaskScreen({super.key});

  @override
  State<ComplatedTaskScreen> createState() => _ComplatedTaskScreenState();
}

class _ComplatedTaskScreenState extends State<ComplatedTaskScreen> {
  bool _getCompletedTaskInProgress = true;
  List<TaskModel> completedTasks = [];

  @override
  void initState() {
    super.initState();
    _getComletedTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async => _getComletedTasks(),
        child: Visibility(
          visible: _getCompletedTaskInProgress == false,
          replacement: const CenteredProgressIndicator(),
          child: ListView.builder(
            itemCount: completedTasks.length,
            itemBuilder: (context, index) {
              return TaskItem(taskModel: completedTasks[index], onUpdateTask: () {
                _getComletedTasks();
              },);
            },
          ),
        ),
      ),
    );
  }

  Future<void> _getComletedTasks() async {
    _getCompletedTaskInProgress = true;
    if (mounted) {
      setState(() {});
    }
    NetworkResponse response =
        await NetworkCaller.getRequest(Urls.comletedTasks);
    if (response.isSuccess) {
      TaskListWrapperModel taskListWrapperModel =
          TaskListWrapperModel.fromJson(response.responseData);
      completedTasks = taskListWrapperModel.taskList ?? [];
    } else {
      if (mounted) {
        showSnackBarMessage(
            context, response.errorMessage ?? 'Get New task failed! Try again');
      }
    }
    _getCompletedTaskInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }
}
