import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo/data/repository.dart';

import '../data/models/todo.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  final Repository? repository;

  TodosCubit({this.repository}) : super(TodosInitial());

  void fetchTodos() {
    Timer(Duration(seconds: 3), () {
      repository?.fetchTodos().then((todos) {
        emit(TodosLoaded(todos: todos));
      });
    });
  }

  void changeCompletion(Todo todo) {
    repository?.changeCompletion(!todo.isComplete, todo.id).then((isChanged) {
      if (isChanged != null && isChanged) {
        todo.isComplete = !todo.isComplete;
        updateTodoList();
      }
    });
  }

  void updateTodoList() {
    final currentState = state;
    if (currentState is TodosLoaded) {
      emit(TodosLoaded(todos: currentState.todos));
    }
  }
}
