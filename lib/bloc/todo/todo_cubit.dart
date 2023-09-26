import 'package:bloc_tutorial/repository/todo_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoRepository _repository;
  TodoCubit(this._repository) : super(InitTodoState());
  static TodoCubit get(context) => BlocProvider.of(context);
  Future<void> fetchTodo() async {
    emit(LoadingTodoState());
    try {
      final response = await _repository.getAll();
      emit(ResponseTodoState(response));
    } catch (e) {
      emit(ErrorTodoState(e.toString()));
    }
  }
}
