import 'package:flutter/material.dart';
import 'package:practiceapp/data/network_caller/network_caller.dart';
import 'package:practiceapp/ui/widgets/background_widget.dart';
import 'package:practiceapp/ui/widgets/profile_app_bar.dart';
import 'package:practiceapp/ui/widgets/snack_bar_messages.dart';

import '../../data/models/network_response.dart';
import '../../data/utilities/urls.dart';
import '../widgets/centered_progress_indicator.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _addNewTaskInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context),
      body: BackgroundWidget(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _titleTEController,
                    decoration: const InputDecoration(hintText: 'Title'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter title';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: _descriptionTEController,
                    decoration: const InputDecoration(hintText: 'Description'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter Description';
                      }
                      return null;
                    },
                    maxLines: 4,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Visibility(
                    visible: _addNewTaskInProgress == false,
                    replacement: const CenteredProgressIndicator(),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _addNewTask();
                        }
                      },
                      child: const Text('Add'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _addNewTask() async {
    _addNewTaskInProgress = true;
    if (mounted) {
      setState(() {});
    }
    Map<String, dynamic> requestData = {
      "title": _titleTEController.text.trim(),
      "description": _descriptionTEController.text.trim(),
      "status": "New"
    };
    NetworkResponse response = await NetworkCaller.postRequest(
      Urls.createTask,
      body: requestData,
    );
    _addNewTaskInProgress = false;
    if (mounted) {
      setState(() {});
    }
    if (response.isSuccess) {
      _clearTextFields();
      if (mounted) {
        showSnackBarMessage(context, 'New task added!');
      } else {
        if (mounted) {
          showSnackBarMessage(context, 'New task add failed! Try again', true);
        }
      }
    }
  }

  void _clearTextFields() {
    _descriptionTEController.clear();
    _titleTEController.clear();
  }

  @override
  void dispose() {
    _descriptionTEController.dispose();
    _titleTEController.dispose();
    super.dispose();
  }
}
