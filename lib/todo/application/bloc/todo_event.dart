part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final String todoTitle;
  AddTodoEvent({required this.todoTitle});
}

class UpdateTodoEvent extends TodoEvent {
  final Todo todo;
  UpdateTodoEvent({required this.todo});
}
