

import 'package:todorr/core/data/dtos/user_model_dto.dart';
import 'package:todorr/core/data/models/user_model.dart';

abstract class IUserRepository {
  /// Returns a Future
  Future<UserDTO>authUser(UserModel user);

  /// Returns a Future containing the Croselling menu
  Future <bool> registerUser(UserModel user);

  UserModel get user;

  void updateUser(UserDTO user);

  Future<void> logoutUser();
}