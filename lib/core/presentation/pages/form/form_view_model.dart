import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todorr/core/data/models/todo_model.dart';
import 'package:todorr/core/di/locator.dart';
import 'package:todorr/core/domain/entities/usecases/create_todo_use_case.dart';

class FormViewModel extends ChangeNotifier{
 final CreateTodoUseCase _createTodoUseCase;
 final TextEditingController titleController = TextEditingController();
 final TextEditingController descriptionController = TextEditingController();
 final bool state = false;
 final DateTime date = DateTime.now();

FormViewModel({
 CreateTodoUseCase? createTodoUseCase
}):_createTodoUseCase=createTodoUseCase??locator<CreateTodoUseCase>();


 Future<bool> submitForm() async {
  String title = titleController.text;
  String description = descriptionController.text;

  if(title.isEmpty || description.isEmpty){
    if (kDebugMode) {
      print('Title or description is empty');
    }
    return false;
  }

  TodoModel model = TodoModel(title: title, description: description, state: state, date: date);

  try {
    final isCreatedTodo = await _createTodoUseCase.invoke(model);
    return isCreatedTodo;
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return false;
  }
}

}