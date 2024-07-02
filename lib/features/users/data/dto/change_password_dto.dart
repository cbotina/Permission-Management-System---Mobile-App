import 'dart:collection';

class ChangePasswordDto extends MapView<String, String> {
  final String oldPassword;
  final String newPassword;

  ChangePasswordDto({required this.oldPassword, required this.newPassword})
      : super({
          "oldPassword": oldPassword,
          "newPassword": newPassword,
        });
}
