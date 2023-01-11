part of 'todo_bloc.dart';

abstract class TodoState {
  List<Todo> todos;
  TodoState({required this.todos});
}

class TodoInitial extends TodoState {
  TodoInitial() : super(todos: []);
}

class TodoAdded extends TodoState {
  TodoAdded({required List<Todo> todos}) : super(todos: todos);
}

class TodoUpdated extends TodoState {
  TodoUpdated({required List<Todo> todos}) : super(todos: todos);
}
