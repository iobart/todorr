

import 'package:todorr/core/data/models/user_model.dart';
import 'package:todorr/core/di/locator.dart';
import 'package:todorr/core/domain/repositories/user/i_user_repository.dart';

class LoginUseCase {
  final IUserRepository _iUserRepository;

  LoginUseCase({IUserRepository? iUserRepository})
      : _iUserRepository = iUserRepository ?? locator<IUserRepository>();

  Future<UserModel> invoke(String email, String password) async {

    final UserModel user = UserModel(email: email, password: password,);
    final userData = await _iUserRepository.authUser(user);
    _iUserRepository.updateUser(userData);
    return _iUserRepository.user;
  }
}