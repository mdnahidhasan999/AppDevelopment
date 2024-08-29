import 'package:get/get.dart';
import 'package:practiceapp/data/network_caller/network_caller.dart';

import '../../data/models/network_response.dart';
import '../../data/models/task_list_wrapper_model.dart';
import '../../data/models/task_model.dart';
import '../../data/utilities/urls.dart';

class NewTaskController extends GetxController {
  bool _getNewTaskInProgress = false;
  List<TaskModel> newTaskList = [];
  String _errorMessage = '';

  String get getErrorMessage => _errorMessage;

  bool get getNewTaskInProgress => _getNewTaskInProgress;

  List<TaskModel> get getNewTaskList => newTaskList;

  Future<bool> getNewTasks() async {
    bool isSuccess = false;
    _getNewTaskInProgress = true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(Urls.newTasks);
    if (response.isSuccess) {
      TaskListWrapperModel taskListWrapperModel =
          TaskListWrapperModel.fromJson(response.responseData);
      newTaskList = taskListWrapperModel.taskList ?? [];
    } else {
      _errorMessage = response.errorMessage ?? 'Get New task failed! Try again';
    }

    _getNewTaskInProgress = false;
    update();
    return isSuccess;
  }
}
