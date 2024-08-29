import 'package:get/get.dart';

import 'ui/controllers/new_task_controller.dart';
import 'ui/controllers/sign_in_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
    Get.lazyPut(() => NewTaskController());

  }
}
