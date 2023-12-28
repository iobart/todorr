import 'package:todorr/core/data/dtos/user_model_dto.dart';
import 'package:todorr/core/data/models/user_model.dart';
import 'package:todorr/core/di/locator.dart';
import 'package:todorr/core/domain/repositories/api/todo_api.dart';

class UserRemotoDataSource  {
  final TodoApi _todoApi;

  UserRemotoDataSource({
    TodoApi? todoApi,
  }) : _todoApi = todoApi ?? locator<TodoApi>();

  Future<bool> registerUser(UserModel user) async {
    UserDTO userDto = UserDTO.fromModel(model: user);
    return await  _todoApi.registerUser(userDto);
  }
  Future<UserDTO> authUser(UserModel user) async {
    UserDTO userDto = UserDTO.fromModel(model: user);
    return await  _todoApi.authUser(userDto);
  }

  Future<void> logoutUser() async {
    return await  _todoApi.logoutUser();
  }
}