import 'package:flutter/material.dart';
import 'package:practiceapp/Style.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  List TodoList = [];
  String item = "";

  MyInputOnCgange(content) {
    setState(() {
      item = content;
    });
  }

  AddItem() {
    setState(() {
      TodoList.add({'item': item});
    });
  }

  RemoveItem(index) {
    setState(() {
      TodoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todo'),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                flex: 10,
                child: Row(
                  children: [
                    Expanded(
                      flex: 70,
                      child: TextFormField(
                        onChanged: (content) {
                          MyInputOnCgange(content);
                        },
                        decoration: AppInputDecoration("List Item"),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 30,
                      child: ElevatedButton(
                        onPressed: () {
                          AddItem();
                        },
                        child: const Text('Add'),
                        style: AppButtonStyle(),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 90,
                child: ListView.builder(
                  itemCount: TodoList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: SizeBox50(Row(
                        children: [
                          Expanded(
                            flex: 80,
                            child: Text(
                              TodoList[index]['item'].toString(),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 20,
                            child: TextButton(
                              onPressed: () {
                                RemoveItem(index);
                              },
                              child: Icon(Icons.delete),
                            ),
                          ),
                        ],
                      )),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
