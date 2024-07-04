import 'package:pms_app/features/users/data/abstract_repositories/users_repository.dart';
import 'package:pms_app/features/users/data/dto/change_password_dto.dart';

class MockUsersRepository implements IUsersRepository {
  @override
  Future<void> changePasword(int userId, ChangePasswordDto dto) async {}
}
