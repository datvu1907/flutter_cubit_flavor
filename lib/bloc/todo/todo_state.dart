// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_tutorial/models/todo_model.dart';

abstract class TodoState {}

class InitTodoState extends TodoState {}

class LoadingTodoState extends TodoState {}

class ErrorTodoState extends TodoState {
  final String error;
  ErrorTodoState(
    this.error,
  );
}

class ResponseTodoState extends TodoState {
  List<ToDo> todos;
  ResponseTodoState(this.todos);
}
