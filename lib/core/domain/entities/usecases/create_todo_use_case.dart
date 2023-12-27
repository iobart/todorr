import 'package:todorr/core/data/models/todo_model.dart';
import 'package:todorr/core/di/locator.dart';
import 'package:todorr/core/domain/repositories/todo/i_todo_repository.dart';

class CreateTodoUseCase{
  final ITodoRepository _iTodoRepository;

  CreateTodoUseCase({
ITodoRepository? iTodoRepository
  }):_iTodoRepository=iTodoRepository??locator<ITodoRepository>();

Future <bool> invoke (TodoModel todo){
  return _iTodoRepository.createTodo(todo);
}
}