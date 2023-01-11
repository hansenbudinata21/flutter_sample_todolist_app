import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../application/bloc/todo_bloc.dart';
import 'todo_list_item.dart';

class TodoPage extends StatelessWidget {
  TodoPage({Key? key}) : super(key: key);

  final TextEditingController _todoNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Todo List'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 8.w,
        ),
        child: BlocBuilder<TodoBloc, TodoState>(
          builder: (BuildContext context, TodoState state) {
            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return TodoListItem(
                  todo: state.todos[index],
                  onTap: () {
                    BlocProvider.of<TodoBloc>(context).add(
                      UpdateTodoEvent(
                        todo: state.todos[index],
                      ),
                    );
                  },
                );
              },
              itemCount: state.todos.length,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return AlertDialog(
                title: const Text('Add a new todo item'),
                content: TextField(
                  controller: _todoNameController,
                  decoration: const InputDecoration(
                    hintText: 'Type your new todo',
                  ),
                  textCapitalization: TextCapitalization.sentences,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      if (_todoNameController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Todo title shouldn\'t be empty'),
                          ),
                        );
                        return;
                      }

                      BlocProvider.of<TodoBloc>(context).add(
                        AddTodoEvent(
                          todoTitle: _todoNameController.text,
                        ),
                      );
                      Navigator.of(context).pop();
                      _todoNameController.clear();
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
