class Urls {
  static const String _baseUrl = 'https://task.teamrabbil.com/api/v1';
  static const String registration = '$_baseUrl/registration';
  static const String login = '$_baseUrl/login';
  static const String createTask = '$_baseUrl/createTask';
  static const String newTasks = '$_baseUrl/listTaskByStatus/New';
  static const String taskStatusCount = '$_baseUrl/taskStatusCount';
  static const String comletedTasks = '$_baseUrl/listTaskByStatus/Comleted';

  static String deleteTask(String id) => '$_baseUrl/deleteTask/$id';
  static String updateProfile = '$_baseUrl/profileUpdate';
}
