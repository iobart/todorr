import 'package:todorr/core/data/dtos/user_model_dto.dart';

class UserLocalDataSource{

  UserDTO _user = UserDTO();

  UserDTO get user => _user;

  void setUser(UserDTO user) => _user = user;
}