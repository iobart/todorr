


import 'package:todorr/core/data/models/user_model.dart';
import 'package:todorr/core/di/locator.dart';
import 'package:todorr/core/domain/repositories/user/i_user_repository.dart';

class RegisterUserUseCase {
  final IUserRepository _iUserRepository;

  RegisterUserUseCase({
    IUserRepository? iUserRepository,
  }) : _iUserRepository = iUserRepository ?? locator<IUserRepository>();

  Future <bool> invoke(String email, String password) async {
    final UserModel user = UserModel(email: email, password:password);
    return await _iUserRepository.registerUser(user);
  }
}
