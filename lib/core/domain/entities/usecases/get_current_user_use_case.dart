import 'package:todorr/core/data/models/user_model.dart';
import 'package:todorr/core/di/locator.dart';
import 'package:todorr/core/domain/repositories/user/i_user_repository.dart';

class GetCurrentUserUseCase {
  final IUserRepository _iUserRepository;

  GetCurrentUserUseCase({
    IUserRepository? iUserRepository,
  }) : _iUserRepository = iUserRepository ?? locator<IUserRepository>();

  UserModel invoke() {
    return _iUserRepository.user;
  }
}
