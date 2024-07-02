import 'package:pms_app/features/users/data/dto/change_password_dto.dart';

abstract class IUsersRepository {
  Future<void> changePasword(int userId, ChangePasswordDto dto);
}
