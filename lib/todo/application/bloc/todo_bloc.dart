import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

import '../../domain/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final Uuid uuid;

  TodoBloc({required this.uuid})
      : super(
          TodoInitial(
            todos: [
              Todo(id: uuid.v1(), title: 'Build flutter app'),
              Todo(id: uuid.v1(), title: 'Get some milk'),
              Todo(id: uuid.v1(), title: 'Tweet about progress'),
            ],
          ),
        ) {
    on<AddTodoEvent>((event, emit) {
      Todo todo = Todo(
        id: uuid.v1(),
        title: event.todoTitle,
      );
      emit(TodoAdded(todos: state.todos..add(todo)));
    });

    on<UpdateTodoEvent>((event, emit) {
      Todo updatedTodo =
          state.todos.firstWhere((Todo todo) => todo == event.todo);
      updatedTodo.isDone = !updatedTodo.isDone;
      emit(TodoUpdated(todos: state.todos));
    });
  }
}
