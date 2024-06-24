import 'package:flutter/material.dart';

import '../../../entities/todo.dart';
import '../add_New_Todo.dart';
import 'Done_todo_list_Tab.dart';
import 'UnDonel_todo_list_Tab.dart';
import 'all_todo_list_Tab.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<Todo> _todoList = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Todo List"),
          bottom: _buildTabBar(),
        ),
        body: TabBarView(
          children: [
            AllTodoListTab(
              onDelete: _deleteTodo,
              onStatusChange: _toggleTodoStatus,
              todoList: _todoList,
            ),

            UndoneTodoListTab(
              onDelete: _deleteTodo,
              onStatusChange: _toggleTodoStatus,
              todoList: _todoList.where((item) => item.isDone == false).toList(),
            ),
            DoneTodoListTab(
              onDelete: _deleteTodo,
              onStatusChange: _toggleTodoStatus,
              todoList: _todoList.where((item) => item.isDone == true).toList(),

            ),
          ],
        ),
        floatingActionButton: _buildAddTodoFAB(context),
      ),
    );
  }

  TabBar _buildTabBar() {
    return const TabBar(
      tabs: [
        Tab(
          text: 'All',
        ),
        Tab(
          text: 'UnDone',
        ),
        Tab(
          text: 'Done',
        ),
      ],
    );
  }

  FloatingActionButton _buildAddTodoFAB(BuildContext context) {
    return FloatingActionButton.extended(
        tooltip: 'Add New Todo',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNewTodoScreen(
                onAddTodo: _addNewTodo,
              ),
            ),
          );
        },
        label: const Text('Add'),
        icon: const Icon(Icons.add));
  }

  void _addNewTodo(Todo todo) {
    _todoList.add(todo);
    if (mounted) {
      setState(() {});
    }
  }

  void _deleteTodo(int index) {
    _todoList.removeAt(index);
    if (mounted) {
      setState(() {});
    }
  }

  void _toggleTodoStatus(int index) {
    _todoList[index].isDone = !_todoList[index].isDone;
    if (mounted) {
      setState(() {});
    }
  }
}
