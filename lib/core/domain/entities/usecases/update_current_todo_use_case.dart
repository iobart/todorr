import 'package:todorr/core/data/models/todo_model.dart';
import 'package:todorr/core/di/locator.dart';
import 'package:todorr/core/domain/repositories/todo/i_todo_repository.dart';

class UpdateCurrentTodoUseCase {
  final ITodoRepository _iTodoRepository;

  UpdateCurrentTodoUseCase({
    ITodoRepository? iTodoRepository,
  }) : _iTodoRepository= iTodoRepository ?? locator<ITodoRepository>();

    Future<bool> invoke(String docId,TodoModel todo) {
    return _iTodoRepository.updateTodo(docId, todo);
  }
}
