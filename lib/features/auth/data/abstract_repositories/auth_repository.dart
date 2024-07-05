import 'package:pms_app/features/auth/data/dto/login_dto.dart';

abstract class IAuthRepository {
  Future<String> login(LoginDto dto);
}
