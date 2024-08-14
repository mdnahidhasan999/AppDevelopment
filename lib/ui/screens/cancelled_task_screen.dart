import 'package:flutter/material.dart';

import '../../data/models/network_response.dart';
import '../../data/models/task_list_wrapper_model.dart';
import '../../data/models/task_model.dart';
import '../../data/network_caller/network_caller.dart';
import '../../data/utilities/urls.dart';
import '../widgets/centered_progress_indicator.dart';
import '../widgets/snack_bar_messages.dart';
import '../widgets/task_item.dart';


class CancelledTaskScreen extends StatefulWidget {
  const CancelledTaskScreen({super.key});

  @override
  State<CancelledTaskScreen> createState() => _CancelledTaskScreenState();
}

class _CancelledTaskScreenState extends State<CancelledTaskScreen> {
  bool _getInCancelledTaskInProgress = false;
  List<TaskModel> _taskList = [];


  @override
  void initState() {
    super.initState();
    _getCancelledTasks();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        visible: _getInCancelledTaskInProgress == false,
        replacement: const CenteredProgressIndicator(),
        child: ListView.builder(
          itemCount: _taskList.length,
          itemBuilder: (context, index) {
        
          
            return  TaskItem(
             taskModel: _taskList[index],
                onUpdateTask: () {
                  _getCancelledTasks();
                }
            );
          },
        ),
      ),
    );
  }
  Future<void> _getCancelledTasks() async {
    _getInCancelledTaskInProgress = true;
    if (mounted) {
      setState(() {});
    }
    NetworkResponse response =
    await NetworkCaller.getRequest(Urls.cancelledTasks);
    if (response.isSuccess) {
      TaskListWrapperModel taskListWrapperModel =
      TaskListWrapperModel.fromJson(response.responseData);
      _taskList = taskListWrapperModel.taskList ?? [];
    } else {
      if (mounted) {
        showSnackBarMessage(
            context, response.errorMessage ?? 'Get New task failed! Try again');
      }
    }
    _getInCancelledTaskInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }
}
