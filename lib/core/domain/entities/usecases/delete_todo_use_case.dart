
import 'package:todorr/core/di/locator.dart';
import 'package:todorr/core/domain/repositories/todo/i_todo_repository.dart';

class DeleteCurrentTodoUseCase {
  final ITodoRepository _iTodoRepository;

  DeleteCurrentTodoUseCase({
    ITodoRepository? iTodoRepository,
  }) : _iTodoRepository= iTodoRepository ?? locator<ITodoRepository>();

    Future<bool> invoke(String docId) {
    return _iTodoRepository.deleteTodo(docId);
  }
}
